output "all_users" {
  value = aws_iam_user.module_iam_user
}

output "devops_list" {
  value = [for value in var.user_list : { "userid" = value.userid, "permission" = value.user_permission } if value.is_devops == true]
}

output "developer_list" {
  value = [for value in var.user_list : { "userid" = value.userid, "permission" = value.user_permission } if value.is_devops == false]
}
