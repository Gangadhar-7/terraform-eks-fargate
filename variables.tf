# VPC Name
variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "test-mumbai-vpc"
}

# VPC CIDR Block
variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type        = string
  default     = "13.0.0.0/16"
}

# region
variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

# vpc public subnets
variable "public_subnets" {
  description = "VPC Public Subnets"
  type        = list(string)
  default     = ["subnet-02bf93e126f7285eb", "subnet-06d35e1bbe0e39c0b"]
}

# VPC Private Subnets
variable "private_subnets" {
  description = "VPC Private Subnets"
  type        = list(string)
  default     = ["subnet-027526cdac9bb5300", "subnet-0729ff173b5d0652b"]
}

# EKS OIDC ROOT CA Thumbprint - valid until 2037
variable "eks_oidc_root_ca_thumbprint" {
  type        = string
  description = "Thumbprint of Root CA for EKS OIDC, Valid until 2037"
  default     = "9e99a48a9960b14926bb7f3b02e22da2b0ab7280"
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}