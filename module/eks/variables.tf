variable "PREFIX" {
    description = "préfixe de tous les noms de variable"
    type = string
    default = "AWS_DAKAR"
}

variable "NOM_CLUSTER" {
    description = "le nom du cluster à créer"
    type = string
    default = "taj-cluster"
}

variable "subnet" {
    description = "contient les sous réseaux configurées"
    type = list(string)
    default = []
}