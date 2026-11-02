# All settings arrive as one object (values: terraform.tfvars).
# Its schema and validation live once, in the shared stack: stacks/tf-app/variables.tf.
variable "config" {
  type = any
}
