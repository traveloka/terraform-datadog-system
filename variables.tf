variable "enabled" {
  type        = "string"
  default     = true
  description = "To enable this module"
}

variable "product_domain" {
  type        = "string"
  description = "The name of the product domain"
}

variable "service" {
  type        = "string"
  description = "The name of the service"
}

variable "cluster" {
  type        = "string"
  description = "The name of the cluster"
}

variable "environment" {
  type        = "string"
  default     = "*"
  description = "The name of the environment"
}

variable "tags" {
  type        = "list"
  default     = []
  description = "Additional tags for monitors"
}

variable "recipients" {
  type        = "list"
  default     = []
  description = "Notification recipients when both alert and warning are triggered"
}

variable "alert_recipients" {
  type        = "list"
  default     = []
  description = "Notification recipients when only alert is triggered"
}

variable "warning_recipients" {
  type        = "list"
  default     = []
  description = "Notification recipients when only warning is triggered"
}

variable "renotify_interval" {
  type        = "string"
  default     = "0"
  description = "Time interval in minutes which escalation_message will be sent when monitor is triggered"
}

variable "notify_audit" {
  type        = "string"
  default     = false
  description = "Whether any configuration changes should be notified"
}

variable "cpu_usage_name" {
  type        = "string"
  default     = ""
  description = "The name for CPU Usage Monitor, else use default"
}

variable "cpu_usage_thresholds" {
  type = "map"

  default = {
    critical = 70
    warning  = 50
  }

  description = "The warning and critical thresholds for CPU Usage Monitoring"
}

variable "cpu_usage_message" {
  type        = "string"
  default     = ""
  description = "The message when CPU Usage Monitor triggered"
}

variable "cpu_usage_escalation_message" {
  type        = "string"
  default     = ""
  description = "The escalation message when CPU Usage Monitor isn't resolved for given time"
}

variable "cpu_usage_include_tags" {
  type        = "string"
  default     = true
  description = "The flag to include tags in name for CPU Usage Monitor"
}

variable "disk_device" {
  type        = "string"
  default     = "/dev/xvda1"
  description = "The disk device that will be monitored"
}

variable "disk_usage_name" {
  type        = "string"
  default     = ""
  description = "The name for Disk Usage Monitor, else use default"
}

variable "disk_usage_thresholds" {
  type = "map"

  default = {
    critical = 70
    warning  = 50
  }

  description = "The warning and critical thresholds for Disk Usage Monitoring"
}

variable "disk_usage_message" {
  type        = "string"
  default     = ""
  description = "The message when Disk Usage Monitor triggered"
}

variable "disk_usage_escalation_message" {
  type        = "string"
  default     = ""
  description = "The escalation message when Disk Usage Monitor isn't resolved for given time"
}

variable "disk_usage_include_tags" {
  type        = "string"
  default     = true
  description = "The flag to include tags in name for Disk Usage Monitor"
}

variable "memory_free_name" {
  type        = "string"
  default     = ""
  description = "The name for Free Memory Monitor, else use default"
}

variable "memory_free_thresholds" {
  type = "map"

  default = {
    critical = "No default value"
  }

  description = "The warning and critical thresholds for Free Memory Monitoring"
}

variable "memory_free_message" {
  type        = "string"
  default     = ""
  description = "The message when Free Memory Monitor triggered"
}

variable "memory_free_escalation_message" {
  type        = "string"
  default     = ""
  description = "The escalation message when Free Memory Monitor isn't resolved for given time"
}

variable "memory_free_include_tags" {
  type        = "string"
  default     = true
  description = "The flag to include tags in name for Free Memory Monitor"
}

variable "network_in_name" {
  type        = "string"
  default     = ""
  description = "The name for Network In Monitor, else use default"
}

variable "network_in_thresholds" {
  type = "map"

  default = {
    critical = "No default value"
  }

  description = "The warning and critical thresholds for Network In Monitoring"
}

variable "network_in_message" {
  type        = "string"
  default     = ""
  description = "The message when Network In Monitor triggered"
}

variable "network_in_escalation_message" {
  type        = "string"
  default     = ""
  description = "The escalation message when Network In Monitor isn't resolved for given time"
}

variable "network_in_include_tags" {
  type        = "string"
  default     = true
  description = "The flag to include tags in name for Network In Monitor"
}

variable "network_out_name" {
  type        = "string"
  default     = ""
  description = "The name for Network Out Monitor, else use default"
}

variable "network_out_thresholds" {
  type = "map"

  default = {
    critical = "No default value"
  }

  description = "The warning and critical thresholds for Network Out Monitoring"
}

variable "network_out_message" {
  type        = "string"
  default     = ""
  description = "The message when Network Out Monitor triggered"
}

variable "network_out_escalation_message" {
  type        = "string"
  default     = ""
  description = "The escalation message when Network Out Monitor isn't resolved for given time"
}

variable "network_out_include_tags" {
  type        = "string"
  default     = true
  description = "The flag to include tags in name for Network Out Monitor"
}

variable "open_file_name" {
  type        = "string"
  default     = ""
  description = "The name for Open File Monitor, else use default"
}

variable "open_file_thresholds" {
  type = "map"

  default = {
    critical = "No default value"
  }

  description = "The warning and critical thresholds for Open File Monitoring"
}

variable "open_file_message" {
  type        = "string"
  default     = ""
  description = "The message when Open File Monitor triggered"
}

variable "open_file_escalation_message" {
  type        = "string"
  default     = ""
  description = "The escalation message when Open File Monitor isn't resolved for given time"
}

variable "open_file_include_tags" {
  type        = "string"
  default     = true
  description = "The flag to include tags in name for Open File Monitor"
}

variable "system_load_name" {
  type        = "string"
  default     = ""
  description = "The name for System Load Monitor, else use default"
}

variable "system_load_thresholds" {
  type = "map"

  default = {
    critical = "No default value"
  }

  description = "The warning and critical thresholds for System Load Monitoring"
}

variable "system_load_message" {
  type        = "string"
  default     = ""
  description = "The message when System Load Monitor triggered"
}

variable "system_load_escalation_message" {
  type        = "string"
  default     = ""
  description = "The escalation message when System Load Monitor isn't resolved for given time"
}

variable "system_load_include_tags" {
  type        = "string"
  default     = true
  description = "The flag to include tags in name for System Load Monitor"
}