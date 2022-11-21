variable "PREFIX" {

    type = string
    default = "AWS_DAKAR"
  
}

variable "network_id" {

    description = "l'ID du réseau"
    type = string
}

variable "public_subnet_1_id" {
    description = "l'ID du premier sous réseau public"
    type = string
}

variable "public_subnet_2_id" {
    description = "l'ID du deuxième sous réseau public"
    type = string
}

variable "private_subnet_1_id" {
    description = "l'ID du premier sous réseau privé"
    type = string
}

variable "private_subnet_2_id" {
    description = "l'ID du deuxième sous réseau privé"
    type = string
}