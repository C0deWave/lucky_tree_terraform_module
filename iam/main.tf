provider "aws" {
  region = "ap-northeast-2"
}

# 운영자 팀
resource "aws_iam_group" "devops-group" {
  name = "devops"
}

# 개발자 팀
resource "aws_iam_group" "develop-group" {
  name = "develop"
}

# 사용자 생성
resource "aws_iam_user" "module_iam_user" {
  for_each = var.user_list
  name     = each.value.userid
}

# is_devops가 true인 사용자를 devops 그룹에 추가한다.
resource "aws_iam_group_membership" "devops-user-list" {
  name  = aws_iam_group.devops-group.name
  users = [for value in var.user_list : value.userid if value.is_devops == true]
  group = aws_iam_group.devops-group.name
}

# is_devops가 false인 사용자를 developer 그룹에 추가한다.
resource "aws_iam_group_membership" "develop-user-list" {
  name  = aws_iam_group.develop-group.name
  users = [for value in var.user_list : value.userid if value.is_devops != true]
  group = aws_iam_group.develop-group.name
}

# devops 팀에 권한을 할당한다.
resource "aws_iam_group_policy" "devops_group_policy" {
  for_each = var.devops_group_policy
  name     = "devops_group_${each.key}_policy"
  group    = aws_iam_group.devops-group.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = each.value.Action
        Effect   = each.value.Effect
        Resource = each.value.Resource
      },
    ]
  })
}

# developer 팀에 권한을 할당한다.
resource "aws_iam_group_policy" "developer_group_policy" {
  for_each = var.developer_group_policy
  name     = "developer_group_${each.key}_policy"
  group    = aws_iam_group.develop-group.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = each.value.Action
        Effect   = each.value.Effect
        Resource = each.value.Resource
      },
    ]
  })
}




# 해당 유저의 암호를 지정하는 방법
# aws iam update-login-profile --user-name jmjang --password [패스워드 값] --passward-reset-required 
# user 정책 할당
resource "aws_iam_user_policy" "user-policy" {
  for_each = { for key, val in var.user_list :
  key => val if length(val.user_permission) > 0 }

  name = "${each.value.userid}_persional_policy"
  user = each.value.userid
  policy = jsonencode({
      Version = "2012-10-17"
      Statement = [ for key, Value in each.value.user_permission :
        {
          Action   = Value.Action
          Effect   = Value.Effect
          Resource = Value.Resource
        }
      ]
    })
}