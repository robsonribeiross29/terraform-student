output "public_ip_2k12r2" {
  value = "${aws_instance.AD-2K12.public_ip}"
}
output "public_ip_2k16" {
  value = "${aws_instance.AD-2K16.public_ip}"
}
output "password-instance-2k12" {
  value = "${rsadecrypt(aws_instance.AD-2K12.password_data, file("${var.key-pair}"))}"
}
output "password-instance-2k16" {
  value = "${rsadecrypt(aws_instance.AD-2K16.password_data, file("${var.key-pair}"))}"
}
