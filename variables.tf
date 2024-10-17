variable "tags" {
  default = {}
}

variable "aws_resources" {
  default = {
    vpc = [
      {
        name                   = "vpc-ap-northeast-1-01"
        cidr_block             = "172.32.0.0/16"
        cidr_block_association = ["172.33.0.0/16", "172.34.0.0/16"]
        instance_tenancy       = "default"
        enable_dns_support     = true
        enable_dns_hostnames   = false
        domain_name            = "ap-northeast-1-01.compute.internal"
        domain_name_servers    = ["AmazonProvidedDNS"]
        ntp_servers            = ["127.0.0.1"]
        netbios_name_servers   = []
        netbios_node_type      = 2
        security_group_rule = [
          {
            type      = "ingress"
            protocol  = -1
            from_port = 0
            to_port   = 0
            self      = true
          },
          {
            type      = "egress"
            protocol  = -1
            from_port = 0
            to_port   = 0
            self      = true
          }
        ]
        tags = {}
        subnet = [
          {
            name                                           = "subnet-emr-ap-northeast-1-01"
            availability_zone                              = "ap-northeast-1a"
            cidr_block                                     = "172.32.1.0/24"
            enable_dns64                                   = false
            enable_resource_name_dns_aaaa_record_on_launch = false
            enable_resource_name_dns_a_record_on_launch    = false
            map_public_ip_on_launch                        = false
            tags                                           = {}
          },
          {
            name              = "subnet-instance-ap-northeast-1-01"
            availability_zone = "ap-northeast-1a"
            cidr_block        = "172.32.2.0/24"
            tags              = {}
          }
        ]
      },
      {
        name                   = "vpc-ap-northeast-1-02"
        cidr_block             = "172.35.0.0/16"
        cidr_block_association = ["172.36.0.0/16", "172.37.0.0/16"]
        instance_tenancy       = "default"
        enable_dns_support     = true
        enable_dns_hostnames   = false
        domain_name            = "ap-northeast-1-02.compute.internal"
        security_group_rule = [
          {
            type      = "ingress"
            protocol  = -1
            from_port = 0
            to_port   = 0
            self      = true
          },
          {
            type        = "ingress"
            cidr_blocks = ["0.0.0.0/0"]
            protocol    = "icmp"
            from_port   = 8
            to_port     = 0
          },
          {
            type      = "egress"
            protocol  = -1
            from_port = 0
            to_port   = 0
            self      = true
          },
          {
            type        = "egress"
            cidr_blocks = ["0.0.0.0/0"]
            protocol    = "icmp"
            from_port   = 8
            to_port     = 0
          },
          {
            type        = "egress"
            cidr_blocks = ["0.0.0.0/0"]
            protocol    = "tcp"
            from_port   = 80
            to_port     = 80
          },
          {
            type        = "egress"
            cidr_blocks = ["0.0.0.0/0"]
            protocol    = "tcp"
            from_port   = 443
            to_port     = 443
          },
          {
            type        = "egress"
            cidr_blocks = ["0.0.0.0/0"]
            protocol    = "udp"
            from_port   = 123
            to_port     = 123
          }
        ]
        tags   = {}
        subnet = []
      },
    ]
  }
}
