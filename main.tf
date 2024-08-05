provider "aws"{
  profile = "prasad"
}

resource "aws_vpc" "myvpc" {
 cidr_block = "var.vpc_cidr"
   tags = {
   Name = "testvpc"
 }
}

resource "aws_subnet" "first" {

    vpc_id = aws_vpc.myvpc.id
    cidr_block = "var.subnet1_cidr"
    depends_on = [ aws_vpc.myvpc ]
    lifecycle {
      prevent_destroy = true
    }
  
}

resource "aws_subnet" "second" {
  vpc_id = aws_vpc.myvpc.id
    cidr_block = "var.subnet2_cidr"
    depends_on = [ aws_vpc.myvpc ]
}