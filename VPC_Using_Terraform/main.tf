resource "aws_vpc" "vpc" {
  cidr_block       = "${var.vpc_cidr_block}"
  instance_tenancy = "${var.instance_tenancy}"
  tags = {
    Name = "custom-vpc-created-by-terraform"
  }
}

resource "aws_subnet" "subnet" {
	count = 2
	vpc_id                  = "${aws_vpc.vpc.id}"
	cidr_block              = "${element(var.subnet_cidr_block,count.index)}"
	tags ={
		Name = "${element(var.subnet_tag, count.index)}"
   }
}

#-----------creating Internet Gateway------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"
	tags = {
		Name = "custom-igw-created-by-terraform"
	}
}

#-----------creating EIP
resource "aws_eip" "elastic_ip" {
  vpc = true
}

#--------Creating NAT Gatway-------------------------
resource "aws_nat_gateway" "ngw" {
  allocation_id = "${aws_eip.elastic_ip.id}"
  subnet_id     = "${aws_subnet.subnet.0.id}"

  tags = {
    Name = "NAT-created-by-terraform"
  }
}


#-------Creating primary/main route table for public subnet--------------------
resource "aws_default_route_table" "main_route_table" {
  default_route_table_id = "${aws_vpc.vpc.default_route_table_id}"
	route {
		cidr_block = "${var.igw_cidr_block}"
		gateway_id = "${aws_internet_gateway.igw.id}"
	}
	tags = {
		Name = "default-route-table-created-by-terraform"
    }
}

resource "aws_route_table_association" "subnet_association" {
  subnet_id      = "${aws_subnet.subnet.0.id}"
  route_table_id = "${aws_default_route_table.main_route_table.id}"
}


#-------Creating secondary route table for private subnet-------------------------
resource "aws_route_table" "secondary_route_table" {
  vpc_id = "${aws_vpc.vpc.id}"
  route{
		cidr_block = "${var.ngw_cidr_block}"
		nat_gateway_id = "${aws_nat_gateway.ngw.id}"
  }
  tags = {
    Name = "secondary-route-table-created-by-terraform"
  }
}

resource "aws_route_table_association" "subnet_association_for_private_subnet" {
  subnet_id      = "${aws_subnet.subnet.1.id}"
  route_table_id = "${aws_route_table.secondary_route_table.id}"
}
















  
  