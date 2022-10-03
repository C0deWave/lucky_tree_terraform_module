variable "user_list" {
  type = map(object({
    userid    = string
    username  = string
    is_devops = bool
    user_permission = list(object({
      Action   = list(string)
      Resource = list(string)
      Effect   = string
    }))
  }))
}


variable "devops_group_policy" {
  type = map(object({
    Action   = list(string)
    Resource = list(string)
    Effect   = string
  }))
}

variable "developer_group_policy" {
  type = map(object({
    Action   = list(string)
    Resource = list(string)
    Effect   = string
  }))
}

