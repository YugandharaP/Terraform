output "public-ip"{
	value= "${aws_instance.example.public_ip}"
}
output "private-ip"{
	value= "${aws_instance.example.private_ip}"
}