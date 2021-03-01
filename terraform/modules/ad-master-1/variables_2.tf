variable "deployment_config" {
  description = "deployment configs for tf module"
  type        = map(string)
  default = {
    aws_iam_account_alias = "aws-traiana-sandbox"
    aws_region            = "us-east-1"
    account_id            = "776404332921"
    role_arn              = "arn:aws:iam::776404332921:role/traiana-terraform-iam-role"
  }
}

variable "AvailabilityZones" {
  default = "us-east-1a,us-east-1b"
}

### these variables will be defined by you, are unique to you, and should not be pushed to the git repo.

### Create your own key pair and insert its name here
variable "KeyPairName" {
  default = "barkay_us-east-1_sandbox"
}

### Insert your own remote ip to access the gateway from.  This will open an RDP in the security group to your ip allowing remote access.
variable "RDGWCIDR" {
  default = "98.109.207.30/32"
}

### set this password and ensure it is unique, it is required to restore the domain.
variable "RestoreModePassword" {
  default = "THbmpiVXgTyjQL48@"
}

### Set this user name to a unique name - this is the stack admin user name to login to the remote gateway and domain controllers.
variable "DomainAdminUser" {
  default = "StackAdmin"
}

### set this password and ensure it is unique
variable "DomainAdminPassword" {
  default = "THbmpiVXgTyjQL48@"
}
