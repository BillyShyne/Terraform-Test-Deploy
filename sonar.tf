resource "aws_instance" "mySonarInstance1" {
      ami           = "ami-0e472ba40eb589f49"

      key_name = var.key_name
      instance_type = "t2.micro"
      security_groups= [ "security_sonarw_group_2022"]
      tags= {
        Name = "sonar_instance"
      }
    }

 resource "aws_security_group" "security_sonarw_group_2022" {
      name        = "security_sonarw_group_2022"
      description = "security group for Sonar"

      ingress {
        from_port   = 9000
        to_port     = 9000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }

     ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }

     # outbound from Sonar server
      egress {
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }

      tags= {
        Name = "security_sonar"
      }
    }

# Create Elastic IP address for Sonar instance
resource "aws_eip" "mySonarInstance1" {
  vpc      = true
  instance = aws_instance.mySonarInstance1.id
tags= {
    Name = "sonar_elastic_ip"
  }
}
