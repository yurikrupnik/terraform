# All settings arrive as one object (values: terraform.tfvars).
# Its schema and validation live once, in the stack: tf-app-dev/stack/variables.tf.
variable "config" {
  type = any
}
