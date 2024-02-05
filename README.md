# Prography

> 프로그라피 9기 과제
> 
> Unsplash API를 활용한 사진 어플 과제

<br>

### 🎬 주요기능
- **`메인`** 최신 이미지를 볼 수 있습니다.
- **`북마크`** 마음에 드는 사진을 저장할 수 있습니다.
- **`랜덤포토`** 랜덤으로 카드가 제공되며, 스와이프를 통해 북마크 및 통과를 선택할 수 있습니다.
- **`상세보기`** 사진의 상세정보를 확인할 수 있습니다.

<br>

### 📱구동화면
| **`메인`** | **`북마크`** | **`랜덤포토`** | **`상세보기`** |
| ---- | ---- | ---- | ---- |
| <img src="https://private-user-images.githubusercontent.com/110394722/302251968-937416ed-5ac7-4076-bfa7-0c20b46563a0.PNG?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDcxMjgyMDUsIm5iZiI6MTcwNzEyNzkwNSwicGF0aCI6Ii8xMTAzOTQ3MjIvMzAyMjUxOTY4LTkzNzQxNmVkLTVhYzctNDA3Ni1iZmE3LTBjMjBiNDY1NjNhMC5QTkc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwMjA1JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDIwNVQxMDExNDVaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1jYmM0Y2E5NjNkNzQ3MTQ0OWEzNWFjMzQ5MDRhYTE1ZTFiYjMyY2FiMDQ2N2YxMzg3Zjc5NmVjZmQ5MjEzMWQxJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.FPzOod4vvxB3tJ5YYJ7KfIUQcmLJkKQGoi8Qnzr_3Jg" width="143" height="300"> | <img src="https://private-user-images.githubusercontent.com/110394722/302252220-d3a52b12-1a98-4e9c-91ff-5bfb7dffcebe.PNG?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDcxMjgyNDUsIm5iZiI6MTcwNzEyNzk0NSwicGF0aCI6Ii8xMTAzOTQ3MjIvMzAyMjUyMjIwLWQzYTUyYjEyLTFhOTgtNGU5Yy05MWZmLTViZmI3ZGZmY2ViZS5QTkc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwMjA1JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDIwNVQxMDEyMjVaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT01YTA5NTczYzU2MzExMzA4MDY4NTY2ZWFmYzI4NWRjMzg0ZmExYmI5MzJkYjk4NzAxZjE2OWIwMjFkMjllYWFmJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.7SfypM-AdBat6z-k-TGENMkOBGyFVttg5fEdYmHKryQ" width="143" height="300"> | <img src="https://private-user-images.githubusercontent.com/110394722/302252270-e153bdd0-0e5d-44e6-9c7c-c44f52336c27.PNG?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDcxMjgyNTQsIm5iZiI6MTcwNzEyNzk1NCwicGF0aCI6Ii8xMTAzOTQ3MjIvMzAyMjUyMjcwLWUxNTNiZGQwLTBlNWQtNDRlNi05YzdjLWM0NGY1MjMzNmMyNy5QTkc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwMjA1JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDIwNVQxMDEyMzRaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT01YzZkOWVmMWUxMDEwMjBlN2E3NWFhZDc4MzM2OWExNTVhYWQ3ODc3MmJkYzY2YWQ0NGYzYzIyN2FmZmExMTIzJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.sN8z-OXkvLFiiYPNavLCY1yP85ZRNWQatSzuSPWRk9Q" width="143" height="300"> | <img src="https://private-user-images.githubusercontent.com/110394722/302252086-94b5c214-cd85-432d-88b4-ee6e1f3605be.PNG?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDcxMjgyMjcsIm5iZiI6MTcwNzEyNzkyNywicGF0aCI6Ii8xMTAzOTQ3MjIvMzAyMjUyMDg2LTk0YjVjMjE0LWNkODUtNDMyZC04OGI0LWVlNmUxZjM2MDViZS5QTkc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwMjA1JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDIwNVQxMDEyMDdaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT01MmI4ZGViYjhjODUxN2QzNGFjZjFhOWExZDQ1YmM5Y2RlZDU3OTE1OGRkN2JkZmZkY2JiMDlhY2MwMTYwYjcxJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.ZlpIvdSIwjNj69grBg6yKx4p45XMxj6wzeRLva2Jbog" width="143" height="300"> |




<br>

### 🃏 Point
 랜덤 이미지 확인 시 좌우로 스와이프가 가능합니다.
- 오른쪽으로 넘기면 북마크에 자동 추가됩니다. 
- 팝업 시 애니메이션을 추가하였습니다.
- ProgressView가 적용되어 있습니다.


<br>


### 💻 개발 환경, 도구 및 활용한 기술
```
- 개발 환경 : SwiftUI
```
