## S3 static web 모듈입니다.

쉽게 s3 static web을 만들 수 있습니다.
다만 파일 업로드를 모두가 읽을 수 있도록 업로드 해야 합니다.

```
module (
    source = "github.com/C0deWave/lucky_tree_terraform_module.git//s3_static_web?ref=v_s3_static_web_1.0.0"
    s3_bucket_name = 
    stage = 
    is_public = 
)
```
