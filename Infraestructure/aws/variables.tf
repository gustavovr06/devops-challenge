// Cluster variables
variable "deployer-key-file" {
  description = "SSH key to access instances incluster"
  default = ""
}

variable "deployer-key-name" {
  description = "SSH key Name to access instances cluster"
  default = "deployer-key"
}

variable "ansible-deployer-key-file" {
  description = "SSH key Name to access instances in cluster by ansible"
  default = "deployer-key"
}

//Region

variable "aws_region" {
  default = "us-west-2"
  description = "Default AWS Region"
}

variable "aws_region_network" {
  description = "Default AWS Region Subnet"
  default = "us-west-2b"
}

variable "aws_s3bucket_state" {
  default = ""
  description = "AWS S3 Bucket for save tfstate"
}

//Credentials

variable "aws_file_credentials" {
  default = "$HOME/.aws/credentials"
  description = "Default credentials file location"
}

variable "aws_profile" {
  description = "describe your variable"
  default = "customprofile"
}

variable "aws_access_key" {
  default = ""
  description = "the user aws acess key"
}

variable "aws_secret_key" {
  default = ""
  description = "the user aws secret key"
}

// Network Variables

variable "network_fqdn" {
  default = "eva.local"
}

variable "vpc_1_cidr" {
  description = "CIDR for the VPC agents"
  default = "172.17.0.0/16"
}

variable "network_private_zone" {
  description = "CIDR for the private zone"
  default = "192.168.1.0/24"
}


variable "network_public_zone" {
  description = "CIDR for the public zone"
  default = "192.168.3.0/24"
}

variable "bastion_host_private_ip" {
  description = "bastion_host variables IP"
  default = ""
}

//Nodes image type

variable "image_type" {
  type = "string"
  default = "ami-02c71d7a"
  description = "Image type Default Centos"
}

variable "image_type_bastion_host" {
  type = "string"
  default = "ami-02c71d7a"
  description = "bastion_host image type"
}

//Nodes Configuration

//Jenkins agent Configuration

variable "instance_type_Jenkins" {
  description = "Instance type private agent"
  default = "t3.xlarge"
}

variable "Jenkins_number" {
  description = "Number of private agent"
  default = "1"
}

variable "Jenkins_disk_size" {
  description = "Private agent machine disk"
  default = "80"
}

variable "Jenkins_disk_type" {
  description = "Private agent machine type"
  default = "standard"
}

//bastion_host Configuration

variable "instance_type_bastion_host" {
  description = "Instance type bastion_host"
  default = "t3.xlarge"
}

variable "bastion_host_name" {
  description = "Name of bastion_host"
  default = "bastion_host"
}

variable "bastion_host_number" {
  description = "Number of bastion_host"
  default = "1"
}

variable "bastion_host_disk_size" {
  description = "bastion_host machine disk"
  default = "250"
}

variable "bastion_host_disk_type" {
  description = "bastion_host type disk"
  default = "standard"
}


//Elasticsearch Configuration

variable "instance_type_elasticsearch" {
  description = "Instance type elasticsearch"
  default = "m4.xlarge"
}

variable "elasticsearch_name" {
  description = "Name of elasticsearch"
  default = "elasticsearch"
}

variable "elasticsearch_number" {
  description = "Number of elasticsearch"
  default = "3"
}

variable "elasticsearch_disk_size" {
  description = "elasticsearch machine disk"
  default = "80"
}

variable "elasticsearch_disk_type" {
  description = "elasticsearch type disk"
  default = "standard"
}

//Logstash Configuration

variable "instance_type_logstash" {
  description = "Instance type logstash"
  default = "m4.xlarge"
}

variable "logstash_name" {
  description = "Name of logstash"
  default = "logstash"
}

variable "logstash_number" {
  description = "Number of logstash"
  default = "1"
}

variable "logstash_disk_size" {
  description = "logstash machine disk"
  default = "80"
}

variable "logstash_disk_type" {
  description = "logstash type disk"
  default = "standard"
}

//Kibana Configuration

variable "instance_type_kibana" {
  description = "Instance type kibana"
  default = "m4.xlarge"
}

variable "kibana_name" {
  description = "Name of kibana"
  default = "kibana"
}

variable "kibana_number" {
  description = "Number of kibana"
  default = "1"
}

variable "kibana_disk_size" {
  description = "kibana machine disk"
  default = "80"
}

variable "kibana_disk_type" {
  description = "kibana type disk"
  default = "standard"
}

// ECS 

variable "ecs-cluster-name" {
    default = "eva-tech-cluster"
}

variable "ecs-service-role-arn" {
    default = "eva-tech-cluster"
}

variable "ecs-service-name" {
    default = "eva-tech-service"
}

variable "ecs-load-balancer-name" {
    default = "eva-tech-load-balancer"
}