region = [ "us-east-1", "us-east-2", "us-west-2", "us-west-2"]

ec2_ins = [
    { instance_type = "t2.micro" ,name = "Ubuntu-virginia" ,count = 1},
    { instance_type = "t2.micro" ,name = "Ubuntu-ohio" ,count = 1 },
    { instance_type = "t2.micro" ,name = "Ubuntu-california" ,count = 1 },
    { instance_type = "t2.micro" ,name = "Ubuntu-oregon" ,count = 1 }
  ]

  port = [
            { from_port = 22, to_port = 22 },
            { from_port = 80, to_port = 80 }
            ]
