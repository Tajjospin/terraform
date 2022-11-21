# variable "AWS_ACCESS_KEY" {}
# variable "AWS_SECRET_KEY" {}
variable "PREFIX" {
    type = string
    default = "taj"
  
}

variable "AWS_REGION" {
  description = "c'est la région où l'infra sera déployée"
  type = string
  default = "eu-west-1"
}

variable "TYPE_EC2" {
    description = "détermine le type d'instance EC2"
    type = string
    default = "t2.micro"
}

variable "ESPACE_DISK" {
    description = "définir la taille du diswue dur"
    type = number
    default = "15"
}

variable "NOM_CLUSTER" {
    type = string
    default = "taj-cluster"
}
variable "NOM_GRP_NODES" {
    type = string
    default = "taj-nodes"
}

variable "NODE_MAX" {
    description = "contient le nombre maximal des noeuds du cluster"
    type = number
    default = 3
}

variable "NODE_DESIRE" {
    description = "contient le nombre de noeuds demandés à régime normale"
    type = number
    default = 2
}

variable "NODE_MIN" {
    description = "contient le nombre de noeuds minimale du cluster"
    type = number
    default = 2
}

variable "NOM_VPC" {
    type = string
    default = "taj-VPC"
  
}
variable "S3_BUCKET_NAME" {
    type = string
    default = "taj_bucket"
  
}
