module "beical_app_monitor_system" {
  source         = "../../"
  product_domain = "BEI"
  service        = "beical"
  cluster        = "beical-app"

  recipients = ["slack-bei", "pagerduty-bei", "bei@traveloka.com"]

  cpu_usage_thresholds = {
    critical = 70
    warning  = 50
  }

  disk_usage_thresholds = {
    critical = 70
    warning  = 60
  }

  memory_free_thresholds = {
    critical = 1000000000
    warning  = 1500000000
  }

  network_in_thresholds = {
    critical = 30000000
    warning  = 20000000
  }

  network_out_thresholds = {
    critical = 30000000
    warning  = 20000000
  }

  open_file_thresholds = {
    critical = 4000
    warning  = 3000
  }

  system_load_thresholds = {
    critical = 3
    warning  = 2
  }
}
