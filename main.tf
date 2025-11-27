provider "aws" {
    region = "ap-south-1"
}
resource "aws-instance" "example" {
    ami = "ami1082080fnr"
    instance-type = "t2.micro"
    tags = {
        Name = "UbuntuInstance"
    }
}