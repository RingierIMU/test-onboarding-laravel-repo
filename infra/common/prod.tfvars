# 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 #
# 💥                                                            💥 #
# 💥 Do not edit this file as it will be overwritten!           💥 #
# 💥                                                            💥 #
# 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 #

region = "eu-west-1"

ns_seperator = "."

vpcs = {
  # we unfortunately can not mix types, but will be fixed in 0.12 (see: https://github.com/hashicorp/terraform/issues/14322)

  # base/core
  # rimu
  "rimu.cidr"             = "172.16.96.0/19"
  "rimu.single_natgw"     = "false"
  "rimu.private_subs"     = "172.16.96.0/24 172.16.97.0/24 172.16.98.0/24"
  "rimu.database_subs"    = "172.16.101.0/24 172.16.102.0/24 172.16.103.0/24"
  "rimu.elasticache_subs" = "172.16.106.0/24 172.16.107.0/24 172.16.108.0/24"
  "rimu.public_subs"      = "172.16.111.0/24 172.16.112.0/24 172.16.113.0/24"
  "rimu.region"           = "eu-west-1"
  "rimu.azs"              = "eu-west-1a eu-west-1b eu-west-1c"
  "rimu.account_id"       = "135132174985"

  # payeer account
  # ritdu-main
  "ritdu-main.cidr"             = "10.11.96.0/19"
  "ritdu-main.single_natgw"     = "true"
  "ritdu-main.private_subs"     = "10.11.96.0/24 10.11.97.0/24 10.11.98.0/24"
  "ritdu-main.database_subs"    = "10.11.101.0/24 10.11.102.0/24 10.11.103.0/24"
  "ritdu-main.elasticache_subs" = "10.11.106.0/24 10.11.107.0/24 10.11.108.0/24"
  "ritdu-main.public_subs"      = "10.11.111.0/24 10.11.112.0/24 10.11.113.0/24"
  "ritdu-main.region"           = "eu-west-1"
  "ritdu-main.azs"              = "eu-west-1a eu-west-1b eu-west-1c"
  "ritdu-main.account_id"       = "953455652261"

  # jobs
  # ritdu-jobs
  "ritdu-jobs-af1.cidr"             = "10.12.96.0/19"
  "ritdu-jobs-af1.single_natgw"     = "false"
  "ritdu-jobs-af1.private_subs"     = "10.12.96.0/24 10.12.97.0/24 10.12.98.0/24"
  "ritdu-jobs-af1.database_subs"    = "10.12.101.0/24 10.12.102.0/24 10.12.103.0/24"
  "ritdu-jobs-af1.elasticache_subs" = "10.12.106.0/24 10.12.107.0/24 10.12.108.0/24"
  "ritdu-jobs-af1.public_subs"      = "10.12.111.0/24 10.12.112.0/24 10.12.113.0/24"
  "ritdu-jobs-af1.region"           = "eu-west-1"
  "ritdu-jobs-af1.azs"              = "eu-west-1a eu-west-1b eu-west-1c"
  "ritdu-jobs-af1.account_id"       = "471953789682"

  # sec 1
  # ritdu-sec 1
  "ritdu-sec-eu1.cidr"             = "10.13.96.0/19"
  "ritdu-sec-eu1.single_natgw"     = "true"
  "ritdu-sec-eu1.private_subs"     = "10.13.96.0/24 10.13.97.0/24 10.13.98.0/24"
  "ritdu-sec-eu1.database_subs"    = "10.13.101.0/24 10.13.102.0/24 10.13.103.0/24"
  "ritdu-sec-eu1.elasticache_subs" = "10.13.106.0/24 10.13.107.0/24 10.13.108.0/24"
  "ritdu-sec-eu1.public_subs"      = "10.13.111.0/24 10.13.112.0/24 10.13.113.0/24"
  "ritdu-sec-eu1.region"           = "eu-west-1"
  "ritdu-sec-eu1.azs"              = "eu-west-1a eu-west-1b eu-west-1c"
  "ritdu-sec-eu1.account_id"       = "636025426721"

  # horizon
  # roam-horizon
  "roam-horizon-af1.cidr"             = "10.14.96.0/19"
  "roam-horizon-af1.single_natgw"     = "false"
  "roam-horizon-af1.private_subs"     = "10.14.96.0/24 10.14.97.0/24 10.14.98.0/24"
  "roam-horizon-af1.database_subs"    = "10.14.101.0/24 10.14.102.0/24 10.14.103.0/24"
  "roam-horizon-af1.elasticache_subs" = "10.14.106.0/24 10.14.107.0/24 10.14.108.0/24"
  "roam-horizon-af1.public_subs"      = "10.14.111.0/24 10.14.112.0/24 10.14.113.0/24"
  "roam-horizon-af1.region"           = "eu-west-1"
  "roam-horizon-af1.azs"              = "eu-west-1a eu-west-1b eu-west-1c"
  "roam-horizon-af1.account_id"       = "947872912714"

  # bus 1
  # ritdu-dcd
  "ritdu-dcd.cidr"             = "10.15.96.0/19"
  "ritdu-dcd.single_natgw"     = "false"
  "ritdu-dcd.private_subs"     = "10.15.96.0/24 10.15.97.0/24 10.15.98.0/24"
  "ritdu-dcd.database_subs"    = "10.15.101.0/24 10.15.102.0/24 10.15.103.0/24"
  "ritdu-dcd.elasticache_subs" = "10.15.106.0/24 10.15.107.0/24 10.15.108.0/24"
  "ritdu-dcd.public_subs"      = "10.15.111.0/24 10.15.112.0/24 10.15.113.0/24"
  "ritdu-dcd.region"           = "eu-west-1"
  "ritdu-dcd.azs"              = "eu-west-1a eu-west-1b eu-west-1c"
  "ritdu-dcd.account_id"       = "634401859868"

  # prop
  # rimu-prop
  "rimu-prop-vnm.cidr"             = "10.16.96.0/19"
  "rimu-prop-vnm.single_natgw"     = "false"
  "rimu-prop-vnm.private_subs"     = "10.16.96.0/24 10.16.97.0/24 10.16.98.0/24"
  "rimu-prop-vnm.database_subs"    = "10.16.101.0/24 10.16.102.0/24 10.16.103.0/24"
  "rimu-prop-vnm.elasticache_subs" = "10.16.106.0/24 10.16.107.0/24 10.16.108.0/24"
  "rimu-prop-vnm.public_subs"      = "10.16.111.0/24 10.16.112.0/24 10.16.113.0/24"
  "rimu-prop-vnm.region"           = "eu-west-1"
  "rimu-prop-vnm.azs"              = "eu-west-1a eu-west-1b eu-west-1c"
  "rimu-prop-vnm.account_id"       = "348539006591"

  # testing/pe
  # ritdu-pe
  "ritdu-pe-eu1.cidr"             = "10.17.96.0/19"
  "ritdu-pe-eu1.single_natgw"     = "true"
  "ritdu-pe-eu1.private_subs"     = "10.17.96.0/24 10.17.97.0/24 10.17.98.0/24"
  "ritdu-pe-eu1.database_subs"    = "10.17.101.0/24 10.17.102.0/24 10.17.103.0/24"
  "ritdu-pe-eu1.elasticache_subs" = "10.17.106.0/24 10.17.107.0/24 10.17.108.0/24"
  "ritdu-pe-eu1.public_subs"      = "10.17.111.0/24 10.17.112.0/24 10.17.113.0/24"
  "ritdu-pe-eu1.region"           = "eu-west-1"
  "ritdu-pe-eu1.azs"              = "eu-west-1a eu-west-1b eu-west-1c"
  "ritdu-pe-eu1.account_id"       = "025015820777"

  # bus 2
  # ritdu-dcd
  "ritdu-dcd-eu2.cidr"             = "10.18.96.0/19"
  "ritdu-dcd-eu2.single_natgw"     = "true"
  "ritdu-dcd-eu2.private_subs"     = "10.18.96.0/24 10.18.97.0/24 10.18.98.0/24"
  "ritdu-dcd-eu2.database_subs"    = "10.18.101.0/24 10.18.102.0/24 10.18.103.0/24"
  "ritdu-dcd-eu2.elasticache_subs" = "10.18.106.0/24 10.18.107.0/24 10.18.108.0/24"
  "ritdu-dcd-eu2.public_subs"      = "10.18.111.0/24 10.18.112.0/24 10.18.113.0/24"
  "ritdu-dcd-eu2.region"           = "eu-west-1"
  "ritdu-dcd-eu2.azs"              = "eu-west-1a eu-west-1b eu-west-1c"
  "ritdu-dcd-eu2.account_id"       = "520152236921"

  # sdc
  # cube-sdc
  "cube-sdc-eu1.cidr"             = "10.19.96.0/19"
  "cube-sdc-eu1.single_natgw"     = "true"
  "cube-sdc-eu1.private_subs"     = "10.19.96.0/24 10.19.97.0/24 10.19.98.0/24"
  "cube-sdc-eu1.database_subs"    = "10.19.101.0/24 10.19.102.0/24 10.19.103.0/24"
  "cube-sdc-eu1.elasticache_subs" = "10.19.106.0/24 10.19.107.0/24 10.19.108.0/24"
  "cube-sdc-eu1.public_subs"      = "10.19.111.0/24 10.19.112.0/24 10.19.113.0/24"
  "cube-sdc-eu1.region"           = "eu-west-1"
  "cube-sdc-eu1.azs"              = "eu-west-1a eu-west-1b eu-west-1c"
  "cube-sdc-eu1.account_id"       = "013389100338"

  # nexus ai
  # ritdu-nex
  "ritdu-nex-eu1.cidr"             = "10.20.96.0/19"
  "ritdu-nex-eu1.single_natgw"     = "true"
  "ritdu-nex-eu1.private_subs"     = "10.20.96.0/24 10.20.97.0/24 10.20.98.0/24"
  "ritdu-nex-eu1.database_subs"    = "10.20.101.0/24 10.20.102.0/24 10.20.103.0/24"
  "ritdu-nex-eu1.elasticache_subs" = "10.20.106.0/24 10.20.107.0/24 10.20.108.0/24"
  "ritdu-nex-eu1.public_subs"      = "10.20.111.0/24 10.20.112.0/24 10.20.113.0/24"
  "ritdu-nex-eu1.region"           = "eu-west-1"
  "ritdu-nex-eu1.azs"              = "eu-west-1a eu-west-1b eu-west-1c"
  "ritdu-nex-eu1.account_id"       = "253624119624"

  # hex
  # ritdu-hex
  "ritdu-hex-eu1.cidr"             = "10.21.96.0/19"
  "ritdu-hex-eu1.single_natgw"     = "true"
  "ritdu-hex-eu1.private_subs"     = "10.21.96.0/24 10.21.97.0/24 10.21.98.0/24"
  "ritdu-hex-eu1.database_subs"    = "10.21.101.0/24 10.21.102.0/24 10.21.103.0/24"
  "ritdu-hex-eu1.elasticache_subs" = "10.21.106.0/24 10.21.107.0/24 10.21.108.0/24"
  "ritdu-hex-eu1.public_subs"      = "10.21.111.0/24 10.21.112.0/24 10.21.113.0/24"
  "ritdu-hex-eu1.region"           = "eu-west-1"
  "ritdu-hex-eu1.azs"              = "eu-west-1a eu-west-1b eu-west-1c"
  "ritdu-hex-eu1.account_id"       = "592990123379"

  # sports
  # ritdu-sports
  "ritdu-sports-eu1.cidr"             = "10.22.96.0/19"
  "ritdu-sports-eu1.single_natgw"     = "true"
  "ritdu-sports-eu1.private_subs"     = "10.22.96.0/24 10.22.97.0/24 10.22.98.0/24"
  "ritdu-sports-eu1.database_subs"    = "10.22.101.0/24 10.22.102.0/24 10.22.103.0/24"
  "ritdu-sports-eu1.elasticache_subs" = "10.22.106.0/24 10.22.107.0/24 10.22.108.0/24"
  "ritdu-sports-eu1.public_subs"      = "10.22.111.0/24 10.22.112.0/24 10.22.113.0/24"
  "ritdu-sports-eu1.region"           = "eu-west-1"
  "ritdu-sports-eu1.azs"              = "eu-west-1a eu-west-1b eu-west-1c"
  "ritdu-sports-eu1.account_id"       = "381491892809"

  # meta
  # ritdu-meta
  "ritdu-meta-eu1.cidr"             = "10.23.96.0/19"
  "ritdu-meta-eu1.single_natgw"     = "true"
  "ritdu-meta-eu1.private_subs"     = "10.23.96.0/24 10.23.97.0/24 10.23.98.0/24"
  "ritdu-meta-eu1.database_subs"    = "10.23.101.0/24 10.23.102.0/24 10.23.103.0/24"
  "ritdu-meta-eu1.elasticache_subs" = "10.23.106.0/24 10.23.107.0/24 10.23.108.0/24"
  "ritdu-meta-eu1.public_subs"      = "10.23.111.0/24 10.23.112.0/24 10.23.113.0/24"
  "ritdu-meta-eu1.region"           = "eu-west-1"
  "ritdu-meta-eu1.azs"              = "eu-west-1a eu-west-1b eu-west-1c"
  "ritdu-meta-eu1.account_id"       = "132631306742"

  # bi
  # ritdu-bi
  "ritdu-bi-eu1.cidr"             = "10.24.96.0/19"
  "ritdu-bi-eu1.single_natgw"     = "true"
  "ritdu-bi-eu1.private_subs"     = "10.24.96.0/24 10.24.97.0/24 10.24.98.0/24"
  "ritdu-bi-eu1.database_subs"    = "10.24.101.0/24 10.24.102.0/24 10.24.103.0/24"
  "ritdu-bi-eu1.elasticache_subs" = "10.24.106.0/24 10.24.107.0/24 10.24.108.0/24"
  "ritdu-bi-eu1.public_subs"      = "10.24.111.0/24 10.24.112.0/24 10.24.113.0/24"
  "ritdu-bi-eu1.region"           = "eu-west-1"
  "ritdu-bi-eu1.azs"              = "eu-west-1a eu-west-1b eu-west-1c"
  "ritdu-bi-eu1.account_id"       = "981242785456"

  # mkt
  # ritdu-mkt
  "ritdu-mkt-eu1.cidr"             = "10.25.96.0/19"
  "ritdu-mkt-eu1.single_natgw"     = "true"
  "ritdu-mkt-eu1.private_subs"     = "10.25.96.0/24 10.25.97.0/24 10.25.98.0/24"
  "ritdu-mkt-eu1.database_subs"    = "10.25.101.0/24 10.25.102.0/24 10.25.103.0/24"
  "ritdu-mkt-eu1.elasticache_subs" = "10.25.106.0/24 10.25.107.0/24 10.25.108.0/24"
  "ritdu-mkt-eu1.public_subs"      = "10.25.111.0/24 10.25.112.0/24 10.25.113.0/24"
  "ritdu-mkt-eu1.region"           = "eu-west-1"
  "ritdu-mkt-eu1.azs"              = "eu-west-1a eu-west-1b eu-west-1c"
  "ritdu-mkt-eu1.account_id"       = "032310891895"

  # ecom
  # ritdu-ecom
  "ritdu-ecom-eu1.cidr"             = "10.26.96.0/19"
  "ritdu-ecom-eu1.single_natgw"     = "true"
  "ritdu-ecom-eu1.private_subs"     = "10.26.96.0/24 10.26.97.0/24 10.26.98.0/24"
  "ritdu-ecom-eu1.database_subs"    = "10.26.101.0/24 10.26.102.0/24 10.26.103.0/24"
  "ritdu-ecom-eu1.elasticache_subs" = "10.26.106.0/24 10.26.107.0/24 10.26.108.0/24"
  "ritdu-ecom-eu1.public_subs"      = "10.26.111.0/24 10.26.112.0/24 10.26.113.0/24"
  "ritdu-ecom-eu1.region"           = "eu-west-1"
  "ritdu-ecom-eu1.azs"              = "eu-west-1a eu-west-1b eu-west-1c"
  "ritdu-ecom-eu1.account_id"       = "102891362269"

  # imo
  # rmn-imo
  "rmn-imo-eu1.cidr"             = "10.27.96.0/19"
  "rmn-imo-eu1.single_natgw"     = "true"
  "rmn-imo-eu1.private_subs"     = "10.27.96.0/24 10.27.97.0/24 10.27.98.0/24"
  "rmn-imo-eu1.database_subs"    = "10.27.101.0/24 10.27.102.0/24 10.27.103.0/24"
  "rmn-imo-eu1.elasticache_subs" = "10.27.106.0/24 10.27.107.0/24 10.27.108.0/24"
  "rmn-imo-eu1.public_subs"      = "10.27.111.0/24 10.27.112.0/24 10.27.113.0/24"
  "rmn-imo-eu1.region"           = "eu-central-1"
  "rmn-imo-eu1.azs"              = "eu-central-1a eu-central-1b eu-central-1c"
  "rmn-imo-eu1.account_id"       = "637234805497"

  # vapor
  # ritdu-vapor
  "ritdu-vapor-eu1.cidr"             = "10.28.96.0/19"
  "ritdu-vapor-eu1.single_natgw"     = "true"
  "ritdu-vapor-eu1.private_subs"     = "10.28.96.0/24 10.28.97.0/24 10.28.98.0/24"
  "ritdu-vapor-eu1.database_subs"    = "10.28.101.0/24 10.28.102.0/24 10.28.103.0/24"
  "ritdu-vapor-eu1.elasticache_subs" = "10.28.106.0/24 10.28.107.0/24 10.28.108.0/24"
  "ritdu-vapor-eu1.public_subs"      = "10.28.111.0/24 10.28.112.0/24 10.28.113.0/24"
  "ritdu-vapor-eu1.region"           = "eu-west-1"
  "ritdu-vapor-eu1.azs"              = "eu-west-1a eu-west-1b eu-west-1c"
  "ritdu-vapor-eu1.account_id"       = "374141200047"

  # cds
  # ritdu-cds
  "ritdu-cds-eu1.cidr"             = "10.29.96.0/19"
  "ritdu-cds-eu1.single_natgw"     = "true"
  "ritdu-cds-eu1.private_subs"     = "10.29.96.0/24 10.29.97.0/24 10.29.98.0/24"
  "ritdu-cds-eu1.database_subs"    = "10.29.101.0/24 10.29.102.0/24 10.29.103.0/24"
  "ritdu-cds-eu1.elasticache_subs" = "10.29.106.0/24 10.29.107.0/24 10.29.108.0/24"
  "ritdu-cds-eu1.public_subs"      = "10.29.111.0/24 10.29.112.0/24 10.29.113.0/24"
  "ritdu-cds-eu1.region"           = "eu-west-1"
  "ritdu-cds-eu1.azs"              = "eu-west-1a eu-west-1b eu-west-1c"
  "ritdu-cds-eu1.account_id"       = "838756042015"

  # sol
  # ritdu-sol
  "ritdu-sol-eu1.cidr"             = "10.30.96.0/19"
  "ritdu-sol-eu1.single_natgw"     = "true"
  "ritdu-sol-eu1.private_subs"     = "10.30.96.0/24 10.30.97.0/24 10.30.98.0/24"
  "ritdu-sol-eu1.database_subs"    = "10.30.101.0/24 10.30.102.0/24 10.30.103.0/24"
  "ritdu-sol-eu1.elasticache_subs" = "10.30.106.0/24 10.30.107.0/24 10.30.108.0/24"
  "ritdu-sol-eu1.public_subs"      = "10.30.111.0/24 10.30.112.0/24 10.30.113.0/24"
  "ritdu-sol-eu1.region"           = "eu-west-1"
  "ritdu-sol-eu1.azs"              = "eu-west-1a eu-west-1b eu-west-1c"
  "ritdu-sol-eu1.account_id"       = "038858594630"

  # logs
  # ritdu-logs-eu1
  "ritdu-logs-eu1.cidr"             = "10.31.96.0/19"
  "ritdu-logs-eu1.single_natgw"     = "true"
  "ritdu-logs-eu1.private_subs"     = "10.31.96.0/24 10.31.97.0/24 10.31.98.0/24"
  "ritdu-logs-eu1.database_subs"    = "10.31.101.0/24 10.31.102.0/24 10.31.103.0/24"
  "ritdu-logs-eu1.elasticache_subs" = "10.31.106.0/24 10.31.107.0/24 10.31.108.0/24"
  "ritdu-logs-eu1.public_subs"      = "10.31.111.0/24 10.31.112.0/24 10.31.113.0/24"
  "ritdu-logs-eu1.region"           = "eu-west-1"
  "ritdu-logs-eu1.azs"              = "eu-west-1a eu-west-1b eu-west-1c"
  "ritdu-logs-eu1.account_id"       = "767397910791"

  # ritdu-ias
  # ritdu-ias-eu1
  "ritdu-ias-eu1.cidr"             = "10.32.96.0/19"
  "ritdu-ias-eu1.single_natgw"     = "true"
  "ritdu-ias-eu1.private_subs"     = "10.32.96.0/24 10.32.97.0/24 10.32.98.0/24"
  "ritdu-ias-eu1.database_subs"    = "10.32.101.0/24 10.32.102.0/24 10.32.103.0/24"
  "ritdu-ias-eu1.elasticache_subs" = "10.32.106.0/24 10.32.107.0/24 10.32.108.0/24"
  "ritdu-ias-eu1.public_subs"      = "10.32.111.0/24 10.32.112.0/24 10.32.113.0/24"
  "ritdu-ias-eu1.region"           = "eu-central-1"
  "ritdu-ias-eu1.azs"              = "eu-central-1a eu-central-1b eu-central-1c"
  "ritdu-ias-eu1.account_id"       = "337909768645"
}

key_pair_public = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDMVftSUkukzjMGe7ORWkh5UHoiF+4AyaGtkYzLsyDsiqQqWEljn+tNccu62zTyHrc7s39Yy8Anqox44fXgcvCaTIqHFYdIJdCqivQ0g5uminw1JSDl2YNDDVI/rhgobITVPwrCav+kCq3Ar+KBXfrX+pYLGyiEpXsUgxKgmQGHvnwCAaJ7C4G7tcB3z4m3qsE6xgTqq6LYXU/fH/d0FnmVVy/zuM1sXXskLCm1rj3oQME3xoI2PoTLxR5NZbqKgU1KanhN0ioCOH4wiqiBUdHrEW7Jt5sSKveZqGwMOgohbwEXNESq7n9tMqOS4sWfI3klAH09yMYOc588lkR2zTIPoMtfoOciX/WBCk9GLYzCID8SnrdxSi6fqRssYJoyxOe+ZPjEU1rkgSh3r5sPyU9wPdn8+eizApW8enbaLfORoJKe9orPEJGkb80ydYs/uDkhcLXS2p+bZIOi+WNnsb6NPu98XZdEcW0A6hc7SjHrtwB49xe+YLY85Vseiffvvt6LopP942lSvkmqTPKNGA4c+Iv3I1bixGQUt6ALpX+/NRjk/qBGXszPOBnLv+V6airCHcyxxXxy5nneK3Ecaddt8zT+X+WgVyNITaZF9uCl8w4PJ+rUCloCvUDhsF6uSBMh0PaWK49z8KE+BmHZLYKE9LNHGowh+e+XVpRY5HebjQ== prod@ringierimu"