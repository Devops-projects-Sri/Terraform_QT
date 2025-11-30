# create a webserver

# use existing key pair to login
# associate public key to vms
resource "aws_key_pair" "ntier-key" {
  key_name   = "terraform-key"
  public_key = file("~/.ssh/id_ed25519.pub")
}

# create aws web instances
# use number of public subnets to iterate

resource "aws_instance" "web_instance" {

  ami                         = "ami-0ecb62995f68bb549"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  region                      = var.region
  key_name                    = aws_key_pair.ntier-key.key_name

  count                  = length(var.public_subnet_info)
  availability_zone      = var.public_subnet_info[count.index].availability_zone
  vpc_security_group_ids = [aws_security_group.web.id]
  subnet_id              = aws_subnet.public[count.index].id
  tags = {
    Name = var.public_subnet_info[count.index].name
  }
  depends_on = [aws_key_pair.ntier-key, aws_security_group.web, aws_subnet.public]
}


resource "null_resource" "web_instance" {
  triggers = {
    build_id = var.build_id
  }

  count = length(var.public_subnet_info)
  connection {
    host        = aws_instance.web_instance[count.index].public_ip
    user        = "ubuntu"
    private_key = file("~/.ssh/id_ed25519")
  }
  provisioner "file" {
    source      = "index.html"
    destination = "/tmp/index.html"
  }
  provisioner "remote-exec" {
    script = "nginx.sh"
  }
  depends_on = [aws_instance.web_instance]
}