module "workflow" {
    source = "./workload"
    for_each = var.workload_details
    nr_account_id = var.nr_account_id
    providers = {
      newrelic = newrelic
    }

    workload_details = each.value
}       