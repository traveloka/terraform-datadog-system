module "beical_app_monitor_system" {
  source         = "../../"
  product_domain = "BEI"
  service        = "beical"
  cluster        = "beical-app"

  recipients        = ["slack-bei", "pagerduty-bei", "bei@traveloka.com"]
  renotify_interval = 60
  notify_audit      = false

  cpu_usage_thresholds = {
    critical = 70
    warning  = 50
  }

  cpu_usage_message            = "Monitor is triggered"
  cpu_usage_escalation_message = "Monitor isn't resolved for given interval"

  disk_usage_thresholds = {
    critical = 70
    warning  = 60
  }

  disk_usage_message            = "Monitor is triggered"
  disk_usage_escalation_message = "Monitor isn't resolved for given interval"

  memory_free_thresholds = {
    critical = 1000000000
    warning  = 1500000000
  }

  memory_free_message            = "Monitor is triggered"
  memory_free_escalation_message = "Monitor isn't resolved for given interval"

  network_in_thresholds = {
    critical = 30000000
    warning  = 20000000
  }

  network_in_message            = "Monitor is triggered"
  network_in_escalation_message = "Monitor isn't resolved for given interval"

  network_out_thresholds = {
    critical = 30000000
    warning  = 20000000
  }

  network_out_message            = "Monitor is triggered"
  network_out_escalation_message = "Monitor isn't resolved for given interval"

  open_file_thresholds = {
    critical = 4000
    warning  = 3000
  }

  open_file_message            = "Monitor is triggered"
  open_file_escalation_message = "Monitor isn't resolved for given interval"

  system_load_thresholds = {
    critical = 3
    warning  = 2
  }

  system_load_message            = "Monitor is triggered"
  system_load_escalation_message = "Monitor isn't resolved for given interval"
}
