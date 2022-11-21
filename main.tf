
# importer les modules

module "web_s3" {
    source = "./module/web-s3"
    bucket_name = var.S3_BUCKET_NAME
    NOM_CLUSTER = var.NOM_CLUSTER
  
}

### pour charger les fichiers du site web dans le bucket créé :
# - installer AWS CLI et entrer la commande suivante :
# aws s3 cp module/web-s3/www/ s3://$(terraform output -raw website_bucket_name)/ --recursive --profile=beopenIT

### visiter le site web : https://<YOUR BUCKET NAME>.s3-us-west-2.amazonaws.com/index.html 
# site web: https://<website_bucket_name>.<website_bucket_domain>/index.html

### Avant de détruire l'infra, supprimer en avance les fichiers chargés dans le bucket par la commande:
# aws s3 rm s3://$(terraform output -raw website_bucket_name)/ --recursive --profile=beopenIT

module "network" {
    source = "./module/vpc"
     AWS_REGION = var.AWS_REGION
     PREFIX = var.PREFIX
     NOM_CLUSTER = var.NOM_CLUSTER
  
}

module "gateway" {
    source = "./module/gateway"
    PREFIX = var.PREFIX
    network_id = module.network.vpc_id
    public_subnet_1_id = module.network.public_subnet_1_id
    public_subnet_2_id = module.network.public_subnet_2_id
    private_subnet_1_id = module.network.private_subnet_1_id
    private_subnet_2_id = module.network.private_subnet_2_id

    depends_on = [
   module.network
  ]

}

module "cluster_eks" {
    source = "./module/eks"
    NOM_CLUSTER = var.NOM_CLUSTER
    PREFIX = var.PREFIX
    subnet = [ module.network.private_subnet_1_id ,
      module.network.private_subnet_2_id ,
      module.network.public_subnet_1_id ,
      module.network.public_subnet_2_id ]
}

module "node_cluster" {
    source = "./module/nodes"
    PREFIX = var.PREFIX
    cluster_name = module.cluster_eks.Cluster_name
    subnet_ids = [ module.network.private_subnet_1_id ,
      module.network.private_subnet_2_id ]
    TYPE_EC2 = var.TYPE_EC2
    ESPACE_DISK = var.ESPACE_DISK
    node_max = var.NODE_MAX
    node_desire = var.NODE_DESIRE
    node_min = var.NODE_MIN
    
}

