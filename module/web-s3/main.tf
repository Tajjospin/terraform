
# création du bucket 

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = "Dev"
  }
}

# déploiement du site web statique

resource "aws_s3_bucket_website_configuration" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}


resource "aws_s3_bucket_policy" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          aws_s3_bucket.s3_bucket.arn,
          "${aws_s3_bucket.s3_bucket.arn}/*",
        ]
      },
    ]
  })
}

resource "aws_s3_bucket_acl" "state-bucket-dev" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "public-read"
}

### pour charger les fichiers du site web dans le bucket créé :
# - installer AWS CLI et entrer la commande suivante :
# aws s3 cp modules/web-s3/www/ s3://$(terraform output -raw website_bucket_name)/ --recursive --profile=beopenIT

### visiter le site web : https://<YOUR BUCKET NAME>.s3-us-west-2.amazonaws.com/index.html 
# site web: https://<website_bucket_name>.<website_bucket_domain>/index.html


### Avant de détruire l'infra, supprimer en avance les fichiers chargés dans le bucket par la commande:
# aws s3 rm s3://$(terraform output -raw website_bucket_name)/ --recursive --profile=beopenIT