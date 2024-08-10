variable "ec2_ins" {
    description = "EC2 instance configurations"
    type = list(object({
      instance_type = string
      name          = string
      count         = number
    }))
  }
  
  variable "region" {
    description = "List of AWS regions"
    type = list(string)
  }

  variable port {
 type = list(object({
  from_port = number
  to_port   = number
 }))
}
