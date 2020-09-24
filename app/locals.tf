locals {
  # Map of AZs
  # { "1" => "us-east-1a", "2" => "us-east-1b" }
  az_map = {for az in var.availability_zones: index(var.availability_zones, az) => az}
}