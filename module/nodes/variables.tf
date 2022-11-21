


variable "subnet_ids" {
    description = "l'ID de deux sous réseaux privés"
    type = list(string)
    default = []
  
}

variable "cluster_name" {
    description = "le nom du cluster créé"
    type = string
    default = ""
  
}

variable "TYPE_EC2" {
    description = "type des noeuds EC2 du cluster"
    type = string
    default = "t2.micro"
}

variable "ESPACE_DISK" {
    description = "espace mémoire des disques ssd à alouer aux noueds du cluster"
    type = number
    default = 20
}

variable "PREFIX" {
    description = "préfixe des noms des ressources"
    type = string
    default = "aws_cluster"
  
}

variable "node_max" {
    description = "contient le nombre maximal des noeuds du cluster"
    type = number
    default = 5
}

variable "node_desire" {
    description = "contient le nombre de noeuds demandés à régime normale"
    type = number
    default = 3 
}

variable "node_min" {
    description = "contient le nombre de noeuds minimale du cluster"
    type = number
    default = 3
}