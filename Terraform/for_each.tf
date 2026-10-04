variable "instance_configs" {
  type = map(object({
    instance_type = string,
    ami = string
  }))


    default = {
      "web" = {
            instance_type = "t2.micro",
            ami = "ami-0c55b159cbfafe1f0"
      }

      "database" = {
            instance_type = "t3.micro",
            ami = "ami-0c55b159caddkje1f0"
      }
    }

}


resource "aws_ec2_instance" "app" {
  for_each = var.instance_configs
  instance_id = each.value.instance_type
  ami = each.value.ami

    tags = {
        Name = each.key,
        type = each.value.instance_type
    }

}