### 모듈에 버전 추가하는 방법

git tag -a "v0.0.1" -m "First release of vpc module"
git push --follow-tag

### 시멘틱 버전 관리

모듈의 버전은 시멘틱 버전 관리 방법을 사용합니다.

버전 번호의 명명 규칙입니다.

  [MAJOR버전].[MINOR버전].[PATH버전] 의 방법으로 구성되어 있습니다.

  * Major : 호환되지 않는 API 변경시 증가
  
  * Minor : 이전 버전과 호환되는 방식으로 기능을 추가할 때 증가
  
  * Path : 이전 버전과 호환되는 버그 수정시 증가s