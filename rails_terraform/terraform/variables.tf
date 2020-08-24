variable "region" {
  description = "Region that the instances will be created"
  type = string
  default = "us-west-2"
}

/*====
environment specific variables
======*/

variable "database_name" {
  description = "The database name for Production"
  type = string
}

variable "database_username" {
  description = "The username for the Production database"
  type = string
}

variable "database_password" {
  description = "The user password for the Production database"
  type = string
}

variable "secret_key_base" {
  description = "The Rails secret key for production"
  type = string
}

variable "domain" {
  default = "The domain of your application"
  type = string
}

variable "rabbit_name" {
  description = "A random environment"
  type = string
}

variable "environment" {
  description = "Environment for the application"
  type = string
}

variable "availability_zones" {
  type = "list"
}
