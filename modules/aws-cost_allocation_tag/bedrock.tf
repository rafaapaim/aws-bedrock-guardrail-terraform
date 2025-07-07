resource "aws_ce_cost_allocation_tag" "cost_allocation_tag" {
  tag_key = var.tag_key
  status  = var.status
}