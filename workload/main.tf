resource "newrelic_workload" "foo" {
    name       = var.workload_details.name
    account_id = var.nr_account_id

    entity_guids = var.workload_details.entity_guids

    entity_search_query {
        query = var.workload_details.entity_search_query.query
    }

    scope_account_ids = var.workload_details.scope_account_ids

    description =var.workload_details.description

    dynamic "status_config_automatic" {
        # for_each = var.workload_details.status_config_automatic != null ? [var.workload_details.status_config_automatic] : []
        for_each = try(var.workload_details.status_config_automatic, {})
        content {
            enabled = var.workload_details.status_config_automatic.enabled
            remaining_entities_rule {
                remaining_entities_rule_rollup {
                    strategy        = status_config_automatic.value.remaining_entities_rule.remaining_entities_rule_rollup.strategy
                    threshold_type  = status_config_automatic.value.remaining_entities_rule.remaining_entities_rule_rollup.threshold_type
                    threshold_value = status_config_automatic.value.remaining_entities_rule.remaining_entities_rule_rollup.threshold_value
                    group_by        = status_config_automatic.value.remaining_entities_rule.remaining_entities_rule_rollup.group_by
                }
            }
            rule {
                entity_guids = var.workload_details.rule.entity_guids
                nrql_query {
                    query = var.workload_details.rule.nrql_query.query
                }
                rollup {
                    strategy        = var.workload_details.rule.rollup.strategy
                    threshold_type  = var.workload_details.rule.rollup.threshold_type
                    threshold_value = var.workload_details.rule.rollup.threshold_value
                }
            }
        }
    }

    dynamic "status_config_static" {
        # for_each = var.workload_details.status_config_static != null ? [var.workload_details.status_config_static] : []
        for_each = try(var.workload_details.status_config_static, {})
        content {
            description = status_config_static.value.description
            enabled     = status_config_static.value.enabled
            status      = status_config_static.value.status
            summary     = status_config_static.value.summary
        }
    }


}

