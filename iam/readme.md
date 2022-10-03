## iam 모듈입니다.

사용자 그룹의 경우 dev 그룹과 ops 그룹으로 나누어 두었습니다. 참고 바랍니다.

```
module (
    source = "github.com/C0deWave/lucky_tree_terraform_module.git//iam?ref=v_iam_1.0.1"
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
)
```

---

1.0.1 변경 사항

 - depends_on 을 추가하여 유저가 없을 때 policy 할당이 안되는 종속성문제를 해결했습니다. 