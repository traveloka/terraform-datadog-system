locals {
  monitor_enabled = "${var.enabled && length(var.recipients) > 0 ? 1 : 0}"
}

resource "datadog_timeboard" "system" {
  count = "${var.enabled}"

  title       = "${var.product_domain} - ${var.cluster} - ${var.environment} - System"
  description = "A generated timeboard for System"

  template_variable = {
    default = "${var.cluster}"
    prefix  = "cluster"
    name    = "cluster"
  }

  template_variable {
    default = "${var.environment}"
    name    = "environment"
    prefix  = "environment"
  }

  template_variable {
    default = "${var.disk_device}"
    name    = "disk_device"
    prefix  = "device"
  }

  graph {
    title     = "CPU Utilization (Rollup: max)"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "100 - avg:system.cpu.idle{$cluster, $environment} by {host}.rollup(min)"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "System Load - 1 Minute (Rollup: max)"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.load.1{$cluster, $environment} by {host}.rollup(max)"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Free Memory"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.mem.free{$cluster, $environment} by {host}"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Free Disk"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:system.disk.free{$cluster, $environment, $disk_device} by {host,device}"
      type = "line"
    }
  }

  graph {
    title     = "% Disk in Use"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.disk.in_use{$cluster, $environment, $disk_device} by {host,device} * 100"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "% Disk Inodes in Use"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.fs.inodes.in_use{$cluster, $environment, $disk_device} by {host,device} * 100"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "% Open Files in Use"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.fs.file_handles.in_use{$cluster, $environment} by {host} * 100"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Open Files Global Limit"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:custom.system.fs.max_fh{$cluster, $environment} by {host}"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Open Files Global Usage and Open Files Limit per Process"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:custom.system.fs.allocated_fh{$cluster, $environment} by {host} - avg:custom.system.fs.allocated_unused_fh{$cluster, $environment} by {host}"
      aggregator = "avg"
      type       = "line"
    }

    request {
      q          = "avg:custom.system.open_file.soft_limit_min{$cluster, $environment} by {host,process_name}"
      aggregator = "avg"
      type       = "line"
    }

    request {
      q          = "avg:custom.system.open_file.soft_limit_max{$cluster, $environment} by {host,process_name}"
      aggregator = "avg"
      type       = "line"
    }

    request {
      q          = "avg:custom.system.open_file.hard_limit_min{$cluster, $environment} by {host,process_name}"
      aggregator = "avg"
      type       = "line"
    }

    request {
      q          = "avg:custom.system.open_file.hard_limit_max{$cluster, $environment} by {host,process_name}"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Process Count"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:custom.system.process.count{$cluster, $environment} by {host,process_name}"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Disk Read Throughput"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:system.io.rkb_s{$cluster, $environment} by {host,device}"
      type = "line"
    }
  }

  graph {
    title     = "Disk Write Throughput"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.io.wkb_s{$cluster, $environment} by {host,device}"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Total Disk Throughput"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.io.rkb_s{$cluster, $environment} by {host} + avg:system.io.wkb_s{$cluster, $environment} by {host}"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Disk Read IOPS"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.io.r_s{$cluster, $environment} by {host,device}"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Disk Write IOPS"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.io.w_s{$cluster, $environment} by {host,device}"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Total Disk IOPS"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "sum:system.io.r_s{$cluster, $environment} by {host} + sum:system.io.w_s{$cluster, $environment} by {host}"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Disk Read Latency"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:system.io.r_await{$cluster, $environment} by {host,device}"
      type = "line"
    }
  }

  graph {
    title     = "Disk Write Latency"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.io.w_await{$cluster, $environment} by {host,device}"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Average Disk Queued Operations"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:system.io.avg_q_sz{$cluster, $environment} by {host,device}"
      type = "line"
    }
  }

  graph {
    title     = "Network Bytes In (Rollup: max)"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.net.bytes_rcvd{$cluster, $environment} by {host,device}.rollup(max)"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Network Bytes Out (Rollup: max)"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.net.bytes_sent{$cluster, $environment} by {host,device}.rollup(max)"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Network Packets In (Rollup: max)"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:system.net.packets_in.count{$cluster, $environment} by {host,device}.rollup(max)"
      type = "line"
    }
  }

  graph {
    title     = "Network Packets Out (Rollup: max)"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.net.packets_out.count{$cluster, $environment} by {host,device}.rollup(max)"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Network Errors In (Rollup: max)"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:system.net.packets_in.error{$cluster, $environment} by {host,device}.rollup(max)"
      type = "line"
    }
  }

  graph {
    title     = "Network Errors Out (Rollup: max)"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.net.packets_out.error{$cluster, $environment} by {host,device}.rollup(max)"
      aggregator = "avg"
      type       = "line"
    }
  }
}

module "monitor_cpu_usage" {
  source  = "github.com/traveloka/terraform-datadog-monitor"
  enabled = "${local.monitor_enabled}"

  product_domain = "${var.product_domain}"
  service        = "${var.service}"
  environment    = "${var.environment}"
  tags           = "${var.tags}"
  timeboard_id   = "${join(",", datadog_timeboard.system.*.id)}"

  name               = "${var.product_domain} - ${var.cluster} - ${var.environment} - CPU Usage is High on IP: {{ host.ip }} Name: {{ host.name }}"
  query              = "avg(last_5m):100 - avg:system.cpu.idle{cluster:${var.cluster}, environment:${var.environment}} by {host} >= ${var.cpu_usage_thresholds["critical"]}"
  thresholds         = "${var.cpu_usage_thresholds}"
  message            = "${var.cpu_usage_message}"
  escalation_message = "${var.cpu_usage_escalation_message}"

  recipients         = "${var.recipients}"
  alert_recipients   = "${var.alert_recipients}"
  warning_recipients = "${var.warning_recipients}"

  renotify_interval = "${var.renotify_interval}"
  notify_audit      = "${var.notify_audit}"
}

module "monitor_disk_usage" {
  source  = "github.com/traveloka/terraform-datadog-monitor"
  enabled = "${local.monitor_enabled}"

  product_domain = "${var.product_domain}"
  service        = "${var.service}"
  environment    = "${var.environment}"
  tags           = "${var.tags}"
  timeboard_id   = "${join(",", datadog_timeboard.system.*.id)}"

  name               = "${var.product_domain} - ${var.cluster} - ${var.environment} - Disk Usage is High on IP: {{ host.ip }} Name: {{ host.name }}"
  query              = "avg(last_5m):avg:system.disk.in_use{cluster:${var.cluster}, environment:${var.environment}, device:${var.disk_device}} by {host,device} * 100  >= ${var.disk_usage_thresholds["critical"]}"
  thresholds         = "${var.disk_usage_thresholds}"
  message            = "${var.disk_usage_message}"
  escalation_message = "${var.disk_usage_escalation_message}"

  recipients         = "${var.recipients}"
  alert_recipients   = "${var.alert_recipients}"
  warning_recipients = "${var.warning_recipients}"

  renotify_interval = "${var.renotify_interval}"
  notify_audit      = "${var.notify_audit}"
}

module "monitor_memory_free" {
  source  = "github.com/traveloka/terraform-datadog-monitor"
  enabled = "${local.monitor_enabled}"

  product_domain = "${var.product_domain}"
  service        = "${var.service}"
  environment    = "${var.environment}"
  tags           = "${var.tags}"
  timeboard_id   = "${join(",", datadog_timeboard.system.*.id)}"

  name               = "${var.product_domain} - ${var.cluster} - ${var.environment} - Free Memory is Low on IP: {{ host.ip }} Name: {{ host.name }}"
  query              = "avg(last_5m):avg:system.mem.free{cluster:${var.cluster}, environment:${var.environment}} by {host} <= ${var.memory_free_thresholds["critical"]}"
  thresholds         = "${var.memory_free_thresholds}"
  message            = "${var.memory_free_message}"
  escalation_message = "${var.memory_free_escalation_message}"

  recipients         = "${var.recipients}"
  alert_recipients   = "${var.alert_recipients}"
  warning_recipients = "${var.warning_recipients}"

  renotify_interval = "${var.renotify_interval}"
  notify_audit      = "${var.notify_audit}"
}

module "monitor_network_in" {
  source  = "github.com/traveloka/terraform-datadog-monitor"
  enabled = "${local.monitor_enabled}"

  product_domain = "${var.product_domain}"
  service        = "${var.service}"
  environment    = "${var.environment}"
  tags           = "${var.tags}"
  timeboard_id   = "${join(",", datadog_timeboard.system.*.id)}"

  name               = "${var.product_domain} - ${var.cluster} - ${var.environment} - Network In is High on IP: {{ host.ip }} Name: {{ host.name }}"
  query              = "avg(last_5m):avg:system.net.bytes_rcvd{cluster:${var.cluster}, environment:${var.environment}} by {host,device} >= ${var.network_in_thresholds["critical"]}"
  thresholds         = "${var.network_in_thresholds}"
  message            = "${var.network_in_message}"
  escalation_message = "${var.network_in_escalation_message}"

  recipients         = "${var.recipients}"
  alert_recipients   = "${var.alert_recipients}"
  warning_recipients = "${var.warning_recipients}"

  renotify_interval = "${var.renotify_interval}"
  notify_audit      = "${var.notify_audit}"
}

module "monitor_network_out" {
  source  = "github.com/traveloka/terraform-datadog-monitor"
  enabled = "${local.monitor_enabled}"

  product_domain = "${var.product_domain}"
  service        = "${var.service}"
  environment    = "${var.environment}"
  tags           = "${var.tags}"
  timeboard_id   = "${join(",", datadog_timeboard.system.*.id)}"

  name               = "${var.product_domain} - ${var.cluster} - ${var.environment} - Network Out is High on IP: {{ host.ip }} Name: {{ host.name }}"
  query              = "avg(last_5m):avg:system.net.bytes_sent{cluster:${var.cluster}, environment:${var.environment}} by {host,device} >= ${var.network_out_thresholds["critical"]}"
  thresholds         = "${var.network_out_thresholds}"
  message            = "${var.network_out_message}"
  escalation_message = "${var.network_out_escalation_message}"

  recipients         = "${var.recipients}"
  alert_recipients   = "${var.alert_recipients}"
  warning_recipients = "${var.warning_recipients}"

  renotify_interval = "${var.renotify_interval}"
  notify_audit      = "${var.notify_audit}"
}

module "monitor_open_file" {
  source  = "github.com/traveloka/terraform-datadog-monitor"
  enabled = "${local.monitor_enabled}"

  product_domain = "${var.product_domain}"
  service        = "${var.service}"
  environment    = "${var.environment}"
  tags           = "${var.tags}"
  timeboard_id   = "${join(",", datadog_timeboard.system.*.id)}"

  name               = "${var.product_domain} - ${var.cluster} - ${var.environment} - Open File is High on IP: {{ host.ip }} Name: {{ host.name }}"
  query              = "avg(last_5m):custom.system.fs.allocated_fh{cluster:${var.cluster}, environment:${var.environment}} by {host} - avg:custom.system.fs.allocated_unused_fh{cluster:${var.cluster}, environment:${var.environment}} by {host} >= ${var.open_file_thresholds["critical"]}"
  thresholds         = "${var.open_file_thresholds}"
  message            = "${var.open_file_message}"
  escalation_message = "${var.open_file_escalation_message}"

  recipients         = "${var.recipients}"
  alert_recipients   = "${var.alert_recipients}"
  warning_recipients = "${var.warning_recipients}"

  renotify_interval = "${var.renotify_interval}"
  notify_audit      = "${var.notify_audit}"
}

module "monitor_system_load" {
  source  = "github.com/traveloka/terraform-datadog-monitor"
  enabled = "${local.monitor_enabled}"

  product_domain = "${var.product_domain}"
  service        = "${var.service}"
  environment    = "${var.environment}"
  tags           = "${var.tags}"
  timeboard_id   = "${join(",", datadog_timeboard.system.*.id)}"

  name               = "${var.product_domain} - ${var.cluster} - ${var.environment} - System Load is High on IP: {{ host.ip }} Name: {{ host.name }}"
  query              = "avg(last_5m):avg:system.load.1{cluster:${var.cluster}, environment:${var.environment}} by {host} >= ${var.system_load_thresholds["critical"]}"
  thresholds         = "${var.system_load_thresholds}"
  message            = "${var.system_load_message}"
  escalation_message = "${var.system_load_escalation_message}"

  recipients         = "${var.recipients}"
  alert_recipients   = "${var.alert_recipients}"
  warning_recipients = "${var.warning_recipients}"

  renotify_interval = "${var.renotify_interval}"
  notify_audit      = "${var.notify_audit}"
}
