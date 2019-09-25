//AWS credencials
aws_region = "us-west-2"
aws_region_network = "us-west-2b"
aws_region_storage = "us-west-2b"
aws_file_credentials = "$HOME/.aws/credentials"
aws_profile = "customprofile"
aws_s3bucket_state = "tfstate"

aws_access_key = "**************"
aws_secret_key = "**************************"


//Cluster variables

cluster-name = "live.eva"
deployer-key-file = "../../ansible/keys/eva-tech-live"
ansible-deployer-key-file = "./keys/eva-tech-live"
deployer-key-name = "eva-tech-live"

//AWS network
vpc_1_cidr = "172.17.0.0/16"
vcp_2_cidr = "10.0.0.0/16"

//Network
network_fqdn = "live.eva-tech.local"
network_private_zone = "172.17.78.0/24"


bastion_host_private_ip = "172.17.77.100"

//Node image type

//image_type = "ami-084989af76f19c807"
image_type_bastion_host = "ami-02c71d7a"
image_type = "ami-02c71d7a"
image_type_pfsense = "ami-0f43309d75797b087"

//Nodes configuration

instance_type_public_agent = "t3.xlarge"
public_agent_number = 3
public_agent_disk_size = "80"
public_agent_disk_type = "standard"

instance_type_Jenkins = "t3.xlarge"
Jenkins_number = 3
instance_type_Jenkins_spot = "t3.2xlarge"
instance_max_price_Jenkins_spot = "0.11"
Jenkins_spot_number = 2
Jenkins_disk_size = "80"
Jenkins_disk_type = "standard"

// bastion_host configuration
instance_type_bastion_host = "t3.xlarge"
bastion_host_number = 1
bastion_host_disk_size = "250"
bastion_host_disk_type = "standard"

// Elasticsearch Configuration
elasticsearch_number = 1
instance_type_elasticsearch = "m4.xlarge"
elasticsearch_disk_size = "250"
elasticsearch_disk_type = "standard"

// Logstash Configuration
logstash_number = 1
instance_type_logstash = "m4.xlarge"
logstash_disk_size = "80"
logstash_disk_type = "standard"

// Kibana Configuration
kibana_number = 1
instance_type_kibana = "m4.xlarge"
kibana_disk_size = "80"
kibana_disk_type = "standard"
