locals {
  product_domain = "BEI"
  cluster        = "beical-app"
  environment    = "production"
}

module "system" {
  source         = "../../"
  product_domain = "${local.product_domain}"
  service        = "beical"
  cluster        = "${local.cluster}"
  environment    = "${local.environment}"
  tags           = ["tag1", "tag2"]

  recipients         = ["bei@traveloka.com"]
  alert_recipients   = ["pagerduty-bei"]
  warning_recipients = ["slack-bei"]
  renotify_interval  = 0
  notify_audit       = false

  cpu_usage_name = "${local.product_domain} - ${local.cluster} - ${local.environment} - CPU Usage is High"
  cpu_usage_thresholds = {
    critical = 70
    warning  = 50
  }

  cpu_usage_message            = "Monitor is triggered"
  cpu_usage_escalation_message = "Monitor isn't resolved for given interval"
  cpu_usage_include_tags       = false

  disk_usage_name = "${local.product_domain} - ${local.cluster} - ${local.environment} - Disk Usage is High"
  disk_usage_thresholds = {
    critical = 70
    warning  = 60
  }

  disk_usage_message            = "Monitor is triggered"
  disk_usage_escalation_message = "Monitor isn't resolved for given interval"
  disk_usage_include_tags       = false

  memory_free_name = "${local.product_domain} - ${local.cluster} - ${local.environment} - Memory Free is High"
  memory_free_thresholds = {
    critical = 1000000000
    warning  = 1500000000
  }

  memory_free_message            = "Monitor is triggered"
  memory_free_escalation_message = "Monitor isn't resolved for given interval"
  memory_free_include_tags       = false

  network_in_name = "${local.product_domain} - ${local.cluster} - ${local.environment} - Network In is High"
  network_in_thresholds = {
    critical = 30000000
    warning  = 20000000
  }

  network_in_message            = "Monitor is triggered"
  network_in_escalation_message = "Monitor isn't resolved for given interval"
  network_in_include_tags       = false

  network_out_name = "${local.product_domain} - ${local.cluster} - ${local.environment} - Network Out is High"
  network_out_thresholds = {
    critical = 30000000
    warning  = 20000000
  }

  network_out_message            = "Monitor is triggered"
  network_out_escalation_message = "Monitor isn't resolved for given interval"
  network_out_include_tags       = false

  open_file_name = "${local.product_domain} - ${local.cluster} - ${local.environment} - Open File is High"
  open_file_thresholds = {
    critical = 4000
    warning  = 3000
  }

  open_file_message            = "Monitor is triggered"
  open_file_escalation_message = "Monitor isn't resolved for given interval"
  open_file_include_tags       = false

  system_load_name = "${local.product_domain} - ${local.cluster} - ${local.environment} - System Load is High"
  system_load_thresholds = {
    critical = 3
    warning  = 2
  }

  system_load_message            = "Monitor is triggered"
  system_load_escalation_message = "Monitor isn't resolved for given interval"
  system_load_include_tags       = false
}
