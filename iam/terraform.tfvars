user_list = {
  jmjang = {
    userid    = "jmjang"
    username  = "장주명"
    is_devops = true
    user_permission = [{
      Action   = ["*"]
      Resource = ["*"]
      Effect   = "Allow"
    }]
  },
  sheepeatlion = {
    userid          = "sheepeatlion"
    username        = "라이언"
    is_devops       = false
    user_permission = []
  }
}


devops_group_policy = {
  all_permission = {
    Action   = ["*"]
    Resource = ["*"]
    Effect   = "Allow"
  }

  all_permission2 = {
    Action   = ["*"]
    Resource = ["*"]
    Effect   = "Allow"
  }
}

developer_group_policy = {
  all_permission = {
    Action   = ["*"]
    Resource = ["*"]
    Effect   = "Allow"
  }
}
