module "cpu_usage" {
  source  = "github.com/traveloka/terraform-datadog-monitor"
  enabled = "${var.enabled}"

  product_domain = "${var.product_domain}"
  service        = "${var.service}"

  name               = "${var.product_domain} - ${var.cluster} - CPU Usage is High on IP: {{ host.ip }} Name: {{ host.name }}"
  query              = "avg(last_5m):100 - avg:system.cpu.idle{cluster:${var.cluster}} by {host}"
  thresholds         = "${var.cpu_usage_thresholds}"
  message            = "${var.cpu_usage_message}"
  escalation_message = "${var.cpu_usage_escalation_message}"

  recipients = "${var.recipients}"

  renotify_interval = "${var.renotify_interval}"
  notify_audit      = "${var.notify_audit}"
}

module "disk_usage" {
  source  = "github.com/traveloka/terraform-datadog-monitor"
  enabled = "${var.enabled}"

  product_domain = "${var.product_domain}"
  service        = "${var.service}"

  name               = "${var.product_domain} - ${var.cluster} - Disk Usage is High on IP: {{ host.ip }} Name: {{ host.name }}"
  query              = "avg(last_5m):avg:system.disk.in_use{cluster:${var.cluster}} by {host,device} * 100"
  thresholds         = "${var.disk_usage_thresholds}"
  message            = "${var.disk_usage_message}"
  escalation_message = "${var.disk_usage_escalation_message}"

  recipients = "${var.recipients}"

  renotify_interval = "${var.renotify_interval}"
  notify_audit      = "${var.notify_audit}"
}

module "memory_free" {
  source  = "github.com/traveloka/terraform-datadog-monitor"
  enabled = "${var.enabled}"

  product_domain = "${var.product_domain}"
  service        = "${var.service}"

  name               = "${var.product_domain} - ${var.cluster} - Free Memory is Low on IP: {{ host.ip }} Name: {{ host.name }}"
  query              = "avg(last_5m):avg:system.mem.free{cluster:${var.cluster}} by {host}"
  thresholds         = "${var.memory_free_thresholds}"
  message            = "${var.memory_free_message}"
  escalation_message = "${var.memory_free_escalation_message}"

  recipients = "${var.recipients}"

  renotify_interval = "${var.renotify_interval}"
  notify_audit      = "${var.notify_audit}"
}

module "network_in" {
  source  = "github.com/traveloka/terraform-datadog-monitor"
  enabled = "${var.enabled}"

  product_domain = "${var.product_domain}"
  service        = "${var.service}"

  name               = "${var.product_domain} - ${var.cluster} - Network In is High on IP: {{ host.ip }} Name: {{ host.name }}"
  query              = "avg(last_5m):avg:system.net.bytes_rcvd{cluster:${var.cluster}} by {host,device}"
  thresholds         = "${var.network_in_thresholds}"
  message            = "${var.network_in_message}"
  escalation_message = "${var.network_in_escalation_message}"

  recipients = "${var.recipients}"

  renotify_interval = "${var.renotify_interval}"
  notify_audit      = "${var.notify_audit}"
}

module "network_out" {
  source  = "github.com/traveloka/terraform-datadog-monitor"
  enabled = "${var.enabled}"

  product_domain = "${var.product_domain}"
  service        = "${var.service}"

  name               = "${var.product_domain} - ${var.cluster} - Network Out is High on IP: {{ host.ip }} Name: {{ host.name }}"
  query              = "avg(last_5m):avg:system.net.bytes_sent{cluster:${var.cluster}} by {host,device}"
  thresholds         = "${var.network_out_thresholds}"
  message            = "${var.network_out_message}"
  escalation_message = "${var.network_out_escalation_message}"

  recipients = "${var.recipients}"

  renotify_interval = "${var.renotify_interval}"
  notify_audit      = "${var.notify_audit}"
}

module "open_file" {
  source  = "github.com/traveloka/terraform-datadog-monitor"
  enabled = "${var.enabled}"

  product_domain = "${var.product_domain}"
  service        = "${var.service}"

  name               = "${var.product_domain} - ${var.cluster} - Open File is High on IP: {{ host.ip }} Name: {{ host.name }}"
  query              = "avg(last_5m):custom.system.fs.allocated_fh{cluster:${var.cluster}} by {host} - avg:custom.system.fs.allocated_unused_fh{cluster:${var.cluster}} by {host}"
  thresholds         = "${var.open_file_thresholds}"
  message            = "${var.open_file_message}"
  escalation_message = "${var.open_file_escalation_message}"

  recipients = "${var.recipients}"

  renotify_interval = "${var.renotify_interval}"
  notify_audit      = "${var.notify_audit}"
}

module "system_load" {
  source  = "github.com/traveloka/terraform-datadog-monitor"
  enabled = "${var.enabled}"

  product_domain = "${var.product_domain}"
  service        = "${var.service}"

  name               = "${var.product_domain} - ${var.cluster} - System Load is High on IP: {{ host.ip }} Name: {{ host.name }}"
  query              = "avg(last_5m):avg:system.load.1{cluster:${var.cluster}} by {host}"
  thresholds         = "${var.system_load_thresholds}"
  message            = "${var.system_load_message}"
  escalation_message = "${var.system_load_escalation_message}"

  recipients = "${var.recipients}"

  renotify_interval = "${var.renotify_interval}"
  notify_audit      = "${var.notify_audit}"
}
