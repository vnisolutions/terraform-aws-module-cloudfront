/**
 * Access Web service
 */
resource "aws_route53_record" "route53_record" {
  name    = var.domain
  type    = "A"
  zone_id = var.zone_id_route53
  alias {
    name                   = aws_cloudfront_distribution.cloudfront.domain_name
    zone_id                = aws_cloudfront_distribution.cloudfront.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "route53_record_www" {
  name    = var.domain_wwww
  type    = "A"
  zone_id = var.zone_id_route53
  alias {
    name                   = aws_cloudfront_distribution.cloudfront.domain_name
    zone_id                = aws_cloudfront_distribution.cloudfront.hosted_zone_id
    evaluate_target_health = false
  }
}
