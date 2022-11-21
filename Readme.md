

## infrastructure sur AWS

Cette infrastructure utilise les service EKS, VPC et S3; et est provisionée automatiquement via Terraform.



l'ensemble de fichiers de configuration est composé de:
* 0-provider.tf : qui spécifie le provider cloud et la version de l'API de AWS utilisée. Ainsi que l'organisation et le workspace de terraform cloud
* main.tf : qui fait appel au différents modules se trouvant dans le dossier "module"
* outputs.tf : ce fichier contient les éléments qui seront affichés à la fin de l'exécution
* var.tf : ce fichier contient la déclaration de toutes les variables utilisées dans les fichiers précédents.
* variable.auto.tfvars : il permet d'affecter les valeurs souhaitées aux différentes varibles déclarées dans le fichier var.tf
* dossier "module" : comportant les différents modules (vpc,web-s3,nodes,eks et gateway)

## PRÉ-RÉQUIS

* Avoir un compte terraform cloud
* Configurer les variables sensible dans le workspace du compte terraform cloud
* Avoir un compte AWS avec les droits nécessaires

## RECOMMANDATIONS

* Ne pas ajouter les crédentials dans les fichiers même pas dans le fichier variable.auto.tfvars.

## COMANDES

Après configuration des diférents fichiers, Placez vous dans le repertoire où se trouvent ces fichiers et lancer par ORDRE les commandes suivantes

### 1) terraform login
cette commande permet de se loguer à l'organisationet le workspace terraform cloud configuré dan le fichier "0-provider.tf"
il vous redirigera vers votre navigateur pas défaut et générera un token
* copier le token et coler le sur votre terminal et valider

### 2) terraform init 

Cette commande est lancée UNE SEULE FOIS pour initialiser le projet et pour téléchager les dépendance et élements nécessaire pour le provider et la version choisis

### 3) terraform validate

cette commande permet de vérifier la syntaxe des différents fichiers.

### 4) terraform plan
 
Elle sert à férifier la conformité de la syntaxe de vos fichiers et analyser les modifications que vous avez apportées
Elle permet de vous présenter les différences entre l'infra en cours et les mises à jours que vous voulez apporter.
 
 NB: commande à TOUJOURS lancer anvant tout déploiement d'infra (recommandation de bonnes pratiques)

### 5) terraform apply

pour appliquer les modifications apportées et lancer la création automatique de l'infra sur le provider.

NB:     

* il vous sera en suite demandée de confirmer le lancement après cette commande; entrer "yes" pour confirmer.

- Après que le processus d'automatisation soit terminé, connecterz vous sur la console et vous verez le cluster créé. 

### 6) terraform destroy

Cette commande supprime l'infrastructure créée automatiquement.

NB:     
* il vous sera demander de confirmer votre action , entrer "yes" si c'est vraiment l'action que vous voulez effectuer.