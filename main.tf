resource "aws_cloudfront_distribution" "cloudfront" {
  comment    = "${var.env}-${var.project_name}-distribution"
  enabled             = true
  is_ipv6_enabled     = true
  retain_on_delete    = true
  default_root_object = "index.html"
  price_class         = "PriceClass_All"
  aliases = [
    "${var.domain}",
      "*.${var.domain}"
  ]

  web_acl_id = var.enable_waf ? var.waf_cloudfront : null

  origin {
    origin_id   = var.alb_name
    domain_name = var.alb_dns_name
    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_keepalive_timeout = "60"
      origin_protocol_policy   = "https-only"
      origin_read_timeout      = "30"
      origin_ssl_protocols     = ["TLSv1.2"]
    }
    # custom_header {
    #   name  = var.from_restriction_cloudfront.key
    #   value = var.from_restriction_cloudfront.value
    # }
  }
  default_cache_behavior {
    target_origin_id = var.alb_name
    allowed_methods  = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods   = ["GET", "HEAD"]
    compress         = true
    forwarded_values {
      headers      = ["*"]
      query_string = true
      cookies {
        forward = "all"
      }
    }
    min_ttl                = 0
    max_ttl                = 0
    default_ttl            = 0
    viewer_protocol_policy = "redirect-to-https"
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    acm_certificate_arn            = var.acm_certificate_global
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2021"
    cloudfront_default_certificate = "false"
  }
}