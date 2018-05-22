output "cpu_usage_name" {
  value       = "${module.cpu_usage.name}"
  description = "The name of datadog monitor for CPU Usage"
}

output "disk_usage_name" {
  value       = "${module.disk_usage.name}"
  description = "The name of datadog monitor for Disk Usage"
}

output "memory_free_name" {
  value       = "${module.memory_free.name}"
  description = "The name of datadog monitor for Free Memory"
}

output "network_in_name" {
  value       = "${module.network_in.name}"
  description = "The name of datadog monitor for Network In"
}

output "network_out_name" {
  value       = "${module.network_out.name}"
  description = "The name of datadog monitor for Network Out"
}

output "open_file_name" {
  value       = "${module.open_file.name}"
  description = "The name of datadog monitor for Open File"
}

output "system_load_name" {
  value       = "${module.system_load.name}"
  description = "The name of datadog monitor for System Load"
}
