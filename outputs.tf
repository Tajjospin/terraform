output "website_bucket_arn" {
  description = "ARN du bucket"
  value       = module.web_s3.bucket_arn
}

output "website_bucket_name" {
  description = "le nom du bucket S3"
  value       = module.web_s3.bucket_name
}

output "website_bucket_domain" {
  description = "le lien pour accéder au site web "
  value       = module.web_s3.domain
}

output "région_d_infra" {
  value = var.AWS_REGION
  
}

output "Cluster_name" {
  description = "contient le nom du cluster créé"
  value = module.cluster_eks.Cluster_name
  
}

output "Cluster_id" {
  value = module.cluster_eks.Cluster_id
}

output "end_point_cluster" {
  description = "contient le end point du cluster créé"
  value = module.cluster_eks.endpoint_cluster
  
}

output "adresse_réseau_global" {
  value = module.network.vpc_net
}

output "adresse_sous_réseau_privé_az_1a" {
  value = module.network.priv_subnet_1a
}

output "adresse_sous_réseau_privé_az_1b" {
  value = module.network.priv_subnet_1b
}

output "adresse_sous_reseau_public_az_1a" {
  value = module.network.pub_subnet_1a
}

output "adresse_sous_reseau_public_az_1b" {
  value = module.network.pub_subnet_1b
}

