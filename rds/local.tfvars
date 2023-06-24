allocated_storage = 50
aws_region        = "ca-central-1"
aws_profile       = "" # Set your AWS Profile
db_name           = "rdsTest"
engine            = "postgres"
engine_version    = 13
environment       = "local"
instance_class    = "db.t3.micro"
subnets = [
  {
    name              = "terraform-local-test-s1"
    cidr_block        = "192.168.0.0/24"
    availability_zone = "ca-central-1a"
  },
  {
    name              = "terraform-local-test-s2"
    cidr_block        = "192.168.1.0/24"
    availability_zone = "ca-central-1b"
  }
]
vpc_cidr_block    = "192.168.0.0/16"
rds_name          = "terraform-local-test"
