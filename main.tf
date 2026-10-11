data "oci_apigateway_gateways" "apigateway_gateways_lookup" {
  for_each = var.apigateway_gateways_lookup

  compartment_id = each.value.compartment_id
  certificate_id = each.value.certificate_id
  display_name   = each.value.display_name
  state          = each.value.state

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

