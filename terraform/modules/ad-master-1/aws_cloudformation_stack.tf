resource "aws_cloudformation_stack" "demohostingADStack" {
  name               = "demohostingADStack"
  capabilities       = ["CAPABILITY_IAM"]
  timeout_in_minutes = 60
  timeouts {
    create = "120m"
    delete = "360m"
    update = "120m"
  }

  parameters = {
    #Network Configuration
    AvailabilityZones  = var.AvailabilityZones
    NumberOfAZs        = var.NumberOfAZs
    PrivateSubnet1CIDR = var.PrivateSubnet1CIDR
    PrivateSubnet2CIDR = var.PrivateSubnet2CIDR
    PrivateSubnet3CIDR = var.PrivateSubnet3CIDR
    PublicSubnet1CIDR  = var.PublicSubnet1CIDR
    PublicSubnet2CIDR  = var.PublicSubnet2CIDR
    PublicSubnet3CIDR  = var.PublicSubnet3CIDR
    RDGWCIDR           = var.RDGWCIDR
    VPCCIDR            = var.VPCCIDR

    # EC2 Configuration
    KeyPairName           = var.KeyPairName
    ADServer1InstanceType = var.ADServer1InstanceType
    ADServer1NetBIOSName  = var.ADServer1NetBIOSName
    ADServer1PrivateIP    = var.ADServer1PrivateIP
    ADServer2InstanceType = var.ADServer2InstanceType
    ADServer2NetBIOSName  = var.ADServer2NetBIOSName
    ADServer2PrivateIP    = var.ADServer2PrivateIP
    RDGWInstanceType      = var.RDGWInstanceType

    # Microsoft Active Directory Configuration
    DomainDNSName     = var.DomainDNSName
    DomainNetBIOSName = var.DomainNetBIOSName
    //    RestoreModePassword = var.RestoreModePassword
    DomainAdminUser     = var.DomainAdminUser
    DomainAdminPassword = var.DomainAdminPassword

    # Microsoft Remote Desktop Gateway Configuration
    NumberOfRDGWHosts = var.NumberOfRDGWHosts

    # AWS Quick Start Configuration
    QSS3BucketName = var.QSS3BucketName
    QSS3KeyPrefix  = var.QSS3KeyPrefix
  }

  template_url = "https://aws-quickstart.s3.amazonaws.com/quickstart-microsoft-activedirectory/templates/ad-master-1.template"
}
