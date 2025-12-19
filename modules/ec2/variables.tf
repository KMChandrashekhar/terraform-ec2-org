variable "instances" {
  type = map(object({
    ami           = string
    instance_type = string
    key_name      = string
    tags          = map(string)
  }))
}
