variable "aws_region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "private_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "instance_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "docker_image" {
  type = string
}


variable "cluster_name" {
  type = string
}

variable "cluster_version" {
  type = string
}

variable "desired_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "environment" {
  type = string
}

