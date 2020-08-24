variable "region" {
  type = string
  description = "Region where we will create our resources"
  default = "us-west-2"
}

variable "azs" {
  type = list(string)
  description = "Availability zones"
}
