region = "US"

workload_details = {
  "0" = {
        name = "workload01"
        entity_guids = []

        entity_search_query = {
            query = "name LIKE '%DESKTOP%' OR name LIKE '%desktop%' OR name LIKE '%relicstaurants%'"
        }

        scope_account_ids = []

        description = "Description"

        # status_config_automatic = {
        #     enabled = true
        #     remaining_entities_rule = {
        #         remaining_entities_rule_rollup = {
        #             strategy        = "BEST_STATUS_WINS"
        #             threshold_type  = "FIXED"
        #             threshold_value = 100
        #             group_by        = "ENTITY_TYPE"
        #         }
        #     }
        #     rule = {
        #         entity_guids = ["MjUyMDUyOHxBUE18QVBQTElDQVRJT058MjE1MDM3Nzk1"]
        #         nrql_query = {
        #             query = "name like '%Example application2%'"
        #         }
        #         rollup = {
        #             strategy        = "BEST_STATUS_WINS"
        #             threshold_type  = "FIXED"
        #             threshold_value = 100
        #         }
        #     }
        # }

        # status_config_static = {
        #     description = "test"
        #     enabled     = true
        #     status      = "OPERATIONAL"
        #     summary     = "summary of the status"
        # }
        
    }
}