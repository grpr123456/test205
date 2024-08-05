provider "aws"{
  profile = "prasad"
}

resource "aws_vpc" "myvpc" {
 cidr_block = var.vpccidr
   tags = {
   Name = "testvpc"
 }
}

resource "aws_subnet" "first" {

    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.subnet1cidr
    depends_on = [ aws_vpc.myvpc ]
    lifecycle {
      prevent_destroy = false
    }
  
}

resource "aws_subnet" "second" {
  vpc_id = aws_vpc.myvpc.id
    cidr_block = var.subnet2cidr
    depends_on = [ aws_vpc.myvpc ]
}