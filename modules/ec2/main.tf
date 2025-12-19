resource "aws_instance" "this" {
  for_each = var.instances

  ami           = each.value.ami
  instance_type = each.value.instance_type
  key_name      = each.value.key_name

  tags = merge(
    each.value.tags,
    {
      Name = each.key
    }
  )
}
