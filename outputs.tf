output "timeboard_title" {
  value       = "${join(",", datadog_timeboard.system.*.title)}"
  description = "The title of datadog timeboard for System"
}

output "monitor_cpu_usage_name" {
  value       = "${module.monitor_cpu_usage.name}"
  description = "The name of datadog monitor for CPU Usage"
}

output "monitor_disk_usage_name" {
  value       = "${module.monitor_disk_usage.name}"
  description = "The name of datadog monitor for Disk Usage"
}

output "monitor_memory_free_name" {
  value       = "${module.monitor_memory_free.name}"
  description = "The name of datadog monitor for Free Memory"
}

output "monitor_network_in_name" {
  value       = "${module.monitor_network_in.name}"
  description = "The name of datadog monitor for Network In"
}

output "monitor_network_out_name" {
  value       = "${module.monitor_network_out.name}"
  description = "The name of datadog monitor for Network Out"
}

output "monitor_open_file_name" {
  value       = "${module.monitor_open_file.name}"
  description = "The name of datadog monitor for Open File"
}

output "monitor_system_load_name" {
  value       = "${module.monitor_system_load.name}"
  description = "The name of datadog monitor for System Load"
}
