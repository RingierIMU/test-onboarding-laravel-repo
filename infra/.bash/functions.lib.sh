throw_exception() {
  consolelog "Ooops!" "error"
  wtimeout=60
  if [ -f /tmp/tf_cleanup_lock ]; then
    echo "Possible cleanup in progress, waiting ${wtimeout}s before terminating"
    # We need to know the PID of the terraform process in order to send a TERM to it.
    # Before:
    #
    # jenkins -> TERM -> tf.sh -> starts to kill own children and self -> ERR trapped -> exit 1
    #
    # After:
    #
    # jenkins/watcher -> TERM -> tf.sh -> TRAP -> LOCK -> SIGTERM PID_OF terraform ->
    # ERR -> waits on lock/timeout -> exit 1
    sleep ${wtimeout}
    echo "Terminating"
    rm -f /tmp/tf_cleanup_lock
  fi
  echo 'Stack trace:' 1>&2

  while caller $((n++)) 1>&2; do :; done;

  exit 1
}

consolelog() {
  local color
  local ts

  # el-cheapo way to detect if timestamp prefix needed
  if [[ ! -z "${JENKINS_HOME}" ]]; then
    ts=''
  else
    ts="[$(date -u +'%Y-%m-%d %H:%M:%S')] "
  fi

  color_reset='\e[0m'

  case "${2}" in
    success )
      color='\e[0;32m'
      ;;
    error )
      color='\e[1;31m'
      ;;
    warn )
      color='\e[1;33m'
      ;;
    * )
      color='\e[0;37m'
      ;;
  esac

  if [[ ! -z "${1}" ]] && [[ ! -z "${2}" ]] && [[ "${2}" == "error" ]]; then
    printf "${color}%s%s: %s${color_reset}\n" "${ts}" "${0##*/}" "${1}" >&2
  elif [[ ! -z "${1}" ]]; then
    printf "${color}%s%s: %s${color_reset}\n" "${ts}" "${0##*/}" "${1}"
  fi

  return 0
}

lock_or_wait() {
  local lock_file="${1}"
  if [[ -z ${lock_file} ]]; then
    consolelog "please specify lockfile" "error"
    exit 1
  fi
  if ! command -v flock > /dev/null; then
    consolelog "install flock: see ritdu documentation at https://oneafricamedia.atlassian.net/wiki/spaces/PE/pages/1230962695/Macbook+Local+Terraform+setup" "error"
    exit 1
  fi
  exec 200>/var/tmp/${lock_file} || (consolelog "could not create lockfile" "error" && exit 1)
  flock 200 || (consolelog "fail to initialise flock" "error" && exit 1)
}

file_exists() {
  local file_name
  file_name="${1}"

  if [[ -z "${file_name}" ]]; then
    consolelog "ERROR: required var file_name not supplied" "error"
    throw_exception
  fi

  if [[ -f "${file_name}" ]]; then
    return 0
  else
    return 1
  fi
}

aws-eks-update-kubeconfig() {
  local reset="\033[0m"
  local red="\033[31m"
  local aws_profile="${1}"
  local aws_region="${2}"
  local cluster_name="${3}"

  if [[ -z "${1}" ]]; then
    echo "${red}usage: aws-eks-update-kubeconfig <venture profile name> <aws region> <cluster name>${reset}"
    return 1
  fi

  if ! command -v aws > /dev/null; then
    echo -e "${red}install awscli${reset}"
    return 1
  fi

  aws \
    --profile "${aws_profile}" eks --region "${aws_region}" \
    update-kubeconfig --name "${cluster_name}"
}

aws-eks-venture-kubeconfig() {
  local reset="\033[0m"
  local red="\033[31m"
  local aws_profile="${1}"

  if [[ -z "${1}" ]]; then
    echo "${red}usage: aws-eks-venture-kubeconfig <venture profile name>${reset}"
    return
  fi

  if ! command -v aws > /dev/null; then
    echo -e "${red}install awscli${reset}"
    return 1
  fi

  if ! awk --version > /dev/null; then
    echo -e "${red}install gawk${reset}"
    return 1
  fi

  if ! command -v jq > /dev/null; then
    echo -e "${red}install jq${reset}"
    return 1
  fi

  mapfile -t clusters < <( aws --profile "${aws_profile}" eks list-clusters | jq -r '.clusters[]' )

  if [[ -z "${clusters[*]}" ]]; then
    consolelog "could not obtain cluster name" "error"
    throw_exception
  fi

  local aws_region
  for cluster_name in "${clusters[@]}"; do
    aws_region=$(aws --profile "${aws_profile}" eks describe-cluster --name "${cluster_name}" | jq -r '.cluster.arn' | awk -F':' '{print $4}')
    if [[ -z "${aws_region}" ]]; then
      consolelog "could not obtain region name" "error"
      throw_exception
    else
      aws \
        --profile "${aws_profile}" eks --region "${aws_region}" \
        update-kubeconfig --name "${cluster_name}"
      aws_region=""
    fi
  done
}

random_emoji() {
  emoji_array=(
    "kungfu" \
    "aww_yeah" \
    "ultrafastparrot" \
    "celebrate" \
    "bean" \
    "alrightythen" \
    "cat_typing" \
    "bob_ross" \
    "nyancat" \
    "excited" \
    "sonic" \
    "hypno" \
    "very_nice" \
    "bananadance" \
    "booyah" \
    "catjam" \
    "dancing_penguin" \
    "pikachu_amaze" \
    "powerup" \
    "charmander_dancing" \
    "ninja2" \
    "youre_welcome" \
  )
  echo "${emoji_array[$((RANDOM%${#emoji_array[@]}))]}"
}

# get RHS of "value" from tf-block
# match on string exactly (using word boundary) to differentiate
# "ns_zone_new" from "ns_zone_id_new" :pray:
get_value() {
  local reset="\033[0m"
  local red="\033[31m"

  local block_begins="${1}" left_hand_side="${2}"
  if [[ ! -z ${1} ]] && [[ ! -z ${2} ]]; then
    python3 "${PWD}/.python/terraform-variable-parse.py" "${block_begins}:${left_hand_side}"
  fi
}

# get cloudflare values
get_cloudflare_value() {
  local value="${1}"
  if [[ ! -z ${1} ]]; then
    get_value "cloudflare" "${value}"
  fi
}

# given tf variable name this function returns the default value
# ns_zone_new=$(get_variable_default "ns_zone_new" < ./_variables.tf)
get_variable_default() {
  local variable_name="${1}"
  if [[ ! -z ${variable_name} ]]; then
    get_value "${variable_name}" "default"
  fi
}

# return the current arch
current_arch() {
  case $(uname -m) in
    x86_64 | amd64)
      arch=amd64
      ;;
    arm64 | aarch64)
      arch=arm64
      ;;
    *)
      echo "Unsupported Arch: $(uname -m)" >&2
      exit 1
      ;;
  esac
  printf "%s" "${arch}"
  return 0
}

# git-diff-file sha .tf-common-version
# returns commit message of supplied file if file changed in (sha) merged commit
git-diff-file() {
  local git_sha file check="null" result="null"
  if [[ ! -z ${1} ]] && [[ ! -z ${2} ]]; then
    git_sha="${1}"
    file="${2}"
    check="$(git diff --name-only "${git_sha}^" "${git_sha}" -- ${file} | grep . || echo "null")"
    if [[ ${check} != "null" ]]; then
      # Title: %B Body: %b (most commits do not have a Body but do have a title)
      result=$(git log -1 --pretty=format:'%B' "${git_sha}^" "${git_sha}" -- "${file}" | grep . || echo "null")
    fi
  fi
  echo "${result}"
}

block_init() {
  local header message block
  header="${1:?Header Text is required}"
  message="${2:?Message Text is required}"
  block=$(
  cat <<EOF
{
  "blocks": [
    {
      "type": "section",
      "text": {
        "type": "mrkdwn",
        "text": "${header:?}"
      }
    },
    {
      "type": "section",
      "text": {
        "type": "mrkdwn",
        "text": "${message:?}}"
      }
    }
  ]
}
EOF
)
  printf '%s' "${block}"
}

get_message_and_thread_uuid() {
  local response result
  response=$(jq -Cr '. | tostring')
  result=$(printf '%s' "${response}" | jq -Cr '{ "message_uuid":.message_uuid, "thread_uuid": .thread_uuid} | tostring')
  printf '%s\n' "${result}"
}

# send_slack 'initial/message_and_thread_id' 'message'
# To create a thread or reply to an existing thread
send_slack() {
  local message_and_thread_uuid escaped_text
  local initial_or_thread="${1:?}"
  local text="${2:?}"
  escaped_text=$(printf '%s' "${text}" | sed 's/"/\"/g' | sed "s/'/\'/g" )
  if [[ "$initial_or_thread" == "initial" ]]; then
    local thread_uuid
    # generate a new unique thread_id
    thread_uuid=$(uuidgen)-$(date +%s)
    message_and_thread_uuid=$(ritdu-slacker message --workspace ringier-southafrica --channel "${SLACK_CHANNEL:?}" --text "${escaped_text}" --message-or-thread-uuid "${thread_uuid}" | get_message_and_thread_uuid)
  else
    thread_uuid=$(printf '%s' "${initial_or_thread:?}" | jq -Cr '.thread_uuid')
    message_and_thread_uuid=$(ritdu-slacker message --workspace ringier-southafrica --channel "${SLACK_CHANNEL:?}" --command "${COMMAND:-SimpleMessage}" --text "${escaped_text}" --message-or-thread-uuid "${thread_uuid}" | get_message_and_thread_uuid)
  fi
  printf '%s\n' "${message_and_thread_uuid}"
}

# replace_slack_message 'message_and_thread_uuid' 'newtext'
# To update the message
replace_slack_message() {
  local message_uuid message_and_thread_uuid escaped_text
  local message_and_thread_uuid="${1:?}"
  local text="${2:?}"
  message_uuid=$(echo "${message_and_thread_uuid:?}" | jq -Cr '.message_uuid')
  escaped_text=$(echo "${text}" | sed 's/"/\"/g' | sed "s/'/\'/g")
  message_and_thread_uuid=$(ritdu-slacker message --workspace ringier-southafrica --channel "${SLACK_CHANNEL:?}" --command "${COMMAND:-SimpleMessage}" --text "${escaped_text}" --message-uuid "${message_uuid}" | get_message_and_thread_uuid)
  printf '%s\n' "${message_and_thread_uuid}"
}

# broadcast_slack_message 'message_and_thread_uuid' 'broadcast text'
# To broadcast message from within the thread
broadcast_slack_message() {
  local thread_uuid escaped_text
  local message_and_thread_uuid="${1:?}"
  local text="${2:?}"
  thread_uuid=$(echo "${message_and_thread_uuid:?}" | jq -Cr '.thread_uuid')
  escaped_text=$(echo "${text}" | sed 's/"/\"/g' | sed "s/'/\'/g")
  message_and_thread_uuid=$(ritdu-slacker message --workspace ringier-southafrica --channel "${SLACK_CHANNEL:?}" --command "${COMMAND:-SimpleMessage}" --text "${escaped_text}" --message-or-thread-uuid "${thread_uuid}" --thread-broadcast | get_message_and_thread_uuid)
  printf '%s\n' "${message_and_thread_uuid}"
}

if-git-diff-file() {
  local git_sha file result
  if [[ ! -z ${1} ]] && [[ ! -z ${2} ]]; then
    git_sha="${1}"
    file="${2}"
    result=$(git-diff-file "${git_sha}" "${file}")
    if [[ ${result} != "null" ]] && [[ ! -z ${SLACK_HEADER} ]] && [[ ! -z ${SLACK_MESSAGE} ]]; then
      COMMAND="SlackJson" send_slack initial "$(block_init "${SLACK_HEADER}" "${SLACK_MESSAGE}")"
      if [[ $? -eq 0 ]]; then
        consolelog "Message sent"
        consolelog "Header: ${SLACK_HEADER}"
        consolelog "Message: ${SLACK_MESSAGE}"
      else
        consolelog "Something went wrong!"
        throw_exception
      fi
    else
      consolelog "No changes detected"
    fi
  else
    consolelog "Usage: if-git-diff-file <git_sha> <path/to/file>" error
    throw_exception
  fi
}

watcher() {
  # Use currently shared path on agents and temp path for local dev
  if [[ "${JENKINS_CI}" == "true"  ]]; then
    target_file="${WORKSPACE}/../../caches/node_removal"
  else
    target_file="/var/tmp/node_removal"
  fi
  # pid to watch
  local pid=${1:?}
  wait_count=0
  # wait up to 5s for the process to start
  while ! ps -p "${pid:?}" > /dev/null; do
    ((wait_count+=1))
    if [[ ${wait_count} -gt 5 ]]; then
      consolelog "Process ${pid:?} did not start in time" error
      throw_exception
    fi
    sleep 1
  done
  # wait for the process to finish
  while ps -p "${pid:?}" > /dev/null; do
    # if ${target_file} exists, then send SIGTERM to this process
    if [[ -f "${target_file:?}" ]]; then
      consolelog "node_removal file exists, sending SIGTERM to pid ${pid:?}" error
      kill -s SIGTERM "${pid:?}"
      exit 0
    fi
    sleep 1
  done
}
