# create a webserver

resource "aws_key_pair" "ntier-key" {
  key_name = "terraform-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "web_instance" {
    count = length(var.public_subnet_info)
    region = var.region
    ami = "ami-02521d90e7410d9f0"
    instance_type               = "t2.micro"
    key_name = aws_key_pair.ntier-key.key_name
    vpc_security_group_ids = [ aws_security_group.web.id ]
    subnet_id = aws_subnet.public[count.index].id
    associate_public_ip_address = true
    tags = {
      name = ""
    }
  depends_on = [ aws_key_pair.ntier-key, aws_security_group.web, aws_subnet.public ]
}

resource "aws_instance" "web" {
  ami                         = "ami-02521d90e7410d9f0"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.ntier.key_name
  vpc_security_group_ids      = [aws_security_group.web.id]
  subnet_id                   = aws_subnet.subnets[0].id
  associate_public_ip_address = true
  tags = {
    Name = "web1"
  }
  depends_on = [aws_key_pair.ntier, aws_subnet.subnets, aws_security_group.web]
}


resource "null_resource" "web" {
  triggers = {
    build_id = var.build_id
  }
  connection {
    host        = aws_instance.web.public_ip
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
  }
  provisioner "file" {
    source      = "index.html"
    destination = "/tmp/index.html"
  }
  provisioner "remote-exec" {
    script = "nginx.sh"
  }
  depends_on = []
}