# 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 #
# 💥                                                            💥 #
# 💥 Do not edit this file as it will be overwritten!           💥 #
# 💥                                                            💥 #
# 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 #
#data "aws_ami" "base" {
#  most_recent = true
#
#  filter {
#    name   = "name"
#    values = ["rimu-base_master-*"]
#  }
#
#  # this will have to change with cross-account
#  owners = ["${data.aws_caller_identity.current.account_id}"]
#}
