locals {
  vm_names = {
    web = "${var.project_name}-${var.environment}-web"
    db = "${var.project_name}-${var.environment}-db"
  }
}