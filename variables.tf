variable "domain" {
  description = "Domain will add to cloudfront"
  type        = string
}

variable "domain_wwww" {
  description = "Domain will add to cloudfront"
  type        = string
}

variable "region" {
  description = "The region for create resource aws"
  type        = string
}

variable "env" {
  description = "Enviroment for application such as prod, stg, dev"
  type        = string
}

variable "project_name" {
  description = "Project name application"
  type        = string
}

variable "enable_waf" {
  description = "Enable waf to cloudfront"
  type        = bool
  default     = false
}

variable "acm_certificate_global" {
  description = "ACM arm global"
  type        = string
}

variable "waf_cloudfront" {
  description = "waf arm global"
  type        = string
  default     = "false"
}

variable "alb_name" {
  description = "Name alb will add to cloudfront origin"
  type        = string
}

variable "alb_dns_name" {
  description = "Name alb will add to cloudfront origin"
  type        = string
}

variable "zone_id_route53" {
  description = "Zone ID of route53"
  type        = string
}
