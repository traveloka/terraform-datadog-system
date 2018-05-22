resource "datadog_timeboard" "system" {
  title       = "${var.product_domain} - ${var.cluster} - System"
  description = "A generated timeboard for System"

  template_variable = {
    default = "${var.cluster}"
    prefix  = "cluster"
    name    = "cluster"
  }

  graph {
    title     = "CPU Utilization (Rollup: max)"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "100 - avg:system.cpu.idle{$cluster} by {host}.rollup(min)"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "System Load - 1 Minute (Rollup: max)"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.load.1{$cluster} by {host}.rollup(max)"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Free Memory"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.mem.free{$cluster} by {host}"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Free Disk"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:system.disk.free{$cluster} by {host,device}"
      type = "line"
    }
  }

  graph {
    title     = "% Disk in Use"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.disk.in_use{$cluster} by {host,device} * 100"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "% Disk Inodes in Use"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.fs.inodes.in_use{$cluster} by {host,device} * 100"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "% Open Files in Use"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.fs.file_handles.in_use{$cluster} by {host} * 100"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Open Files Global Limit"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:custom.system.fs.max_fh{$cluster} by {host}"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Open Files Global Usage and Open Files Limit per Process"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:custom.system.fs.allocated_fh{$cluster} by {host} - avg:custom.system.fs.allocated_unused_fh{$cluster} by {host}"
      aggregator = "avg"
      type       = "line"
    }

    request {
      q          = "avg:custom.system.open_file.soft_limit_min{$cluster} by {host,process_name}"
      aggregator = "avg"
      type       = "line"
    }

    request {
      q          = "avg:custom.system.open_file.soft_limit_max{$cluster} by {host,process_name}"
      aggregator = "avg"
      type       = "line"
    }

    request {
      q          = "avg:custom.system.open_file.hard_limit_min{$cluster} by {host,process_name}"
      aggregator = "avg"
      type       = "line"
    }

    request {
      q          = "avg:custom.system.open_file.hard_limit_max{$cluster} by {host,process_name}"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Process Count"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:custom.system.process.count{$cluster} by {host,process_name}"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Disk Read Throughput"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:system.io.rkb_s{$cluster} by {host,device}"
      type = "line"
    }
  }

  graph {
    title     = "Disk Write Throughput"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.io.wkb_s{$cluster} by {host,device}"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Total Disk Throughput"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.io.rkb_s{$cluster} by {host} + avg:system.io.wkb_s{$cluster} by {host}"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Disk Read IOPS"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.io.r_s{$cluster} by {host,device}"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Disk Write IOPS"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.io.w_s{$cluster} by {host,device}"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Total Disk IOPS"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "sum:system.io.r_s{$cluster} by {host} + sum:system.io.w_s{$cluster} by {host}"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Disk Read Latency"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:system.io.r_await{$cluster} by {host,device}"
      type = "line"
    }
  }

  graph {
    title     = "Disk Write Latency"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.io.w_await{$cluster} by {host,device}"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Average Disk Queued Operations"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:system.io.avg_q_sz{$cluster} by {host,device}"
      type = "line"
    }
  }

  graph {
    title     = "Network Bytes In (Rollup: max)"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.net.bytes_rcvd{device:eth0,$cluster} by {host}.rollup(max)"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Network Bytes Out (Rollup: max)"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.net.bytes_sent{device:eth0,$cluster} by {host}.rollup(max)"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Network Packets In (Rollup: max)"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:system.net.packets_in.count{device:eth0,$cluster} by {host}.rollup(max)"
      type = "line"
    }
  }

  graph {
    title     = "Network Packets Out (Rollup: max)"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.net.packets_out.count{device:eth0,$cluster} by {host}.rollup(max)"
      aggregator = "avg"
      type       = "line"
    }
  }

  graph {
    title     = "Network Errors In (Rollup: max)"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:system.net.packets_in.error{device:eth0,$cluster} by {host}.rollup(max)"
      type = "line"
    }
  }

  graph {
    title     = "Network Errors Out (Rollup: max)"
    viz       = "timeseries"
    autoscale = true

    request {
      q          = "avg:system.net.packets_out.error{device:eth0,$cluster} by {host}.rollup(max)"
      aggregator = "avg"
      type       = "line"
    }
  }
}
