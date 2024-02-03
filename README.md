# Prography

> 프로그라피 9기 과제
> 
> Unsplash API를 활용한 사진 어플 과제

<br>

### 🎬 주요기능
- **`메인`** 최신 이미지를 볼 수 있습니다.
- **`북마크`** 마음에 드는 사진을 저장할 수 있습니다..
- **`랜덤포토`** 랜덤으로 카드가 제공되며, 스와이프를 통해 북마크 및 통과를 선택할 수 있습니다.
- **`상세보기`** 사진의 상세정보를 확인할 수 있습니다.

<br>

### 📱구동화면
| **`메인`** | **`북마크`** | **`랜덤포토`** | **`상세보기`** |
| ---- | ---- | ---- | ---- |
| <img src="https://private-user-images.githubusercontent.com/110394722/302065482-a99ad9b4-b2b1-4eb9-a544-1ce1d06497e6.PNG?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDcwMDQ2NDUsIm5iZiI6MTcwNzAwNDM0NSwicGF0aCI6Ii8xMTAzOTQ3MjIvMzAyMDY1NDgyLWE5OWFkOWI0LWIyYjEtNGViOS1hNTQ0LTFjZTFkMDY0OTdlNi5QTkc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwMjAzJTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDIwM1QyMzUyMjVaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT01YmQ2MmZmZjA2OTkzYWM1NGJkY2E5MzRlYjY2ZjgyNWVjYTY5MzMyYWVmMTU1YTA3NGJkNDc4ZTZjZGIxNDEyJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.CS7U46nJILAP_4-x2ZJC1E6ZIQFmVNEo291sZQ0XYtI" width="143" height="300"> | <img src="https://private-user-images.githubusercontent.com/110394722/302065489-e4ec39f8-8cc8-4f22-b20f-2e8aff4d41a3.PNG?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDcwMDEyMzIsIm5iZiI6MTcwNzAwMDkzMiwicGF0aCI6Ii8xMTAzOTQ3MjIvMzAyMDY1NDg5LWU0ZWMzOWY4LThjYzgtNGYyMi1iMjBmLTJlOGFmZjRkNDFhMy5QTkc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwMjAzJTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDIwM1QyMjU1MzJaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT0xODY0NDYyNTVmODJmZDg2M2FiNDNhYzkzMGM2OTEwYjQ5NzM3MWRlOWFkZDk5YjNhMzY0MzUxZDU0MjhhNTI3JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.nxlYXAqakSjukcHHDp9esw9hJV3too_XbwMNi_5Cjq8" width="143" height="300"> | <img src="https://private-user-images.githubusercontent.com/110394722/302065503-54f80208-5198-445c-ae4a-d807cb68dac8.PNG?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDcwMDEyMzIsIm5iZiI6MTcwNzAwMDkzMiwicGF0aCI6Ii8xMTAzOTQ3MjIvMzAyMDY1NTAzLTU0ZjgwMjA4LTUxOTgtNDQ1Yy1hZTRhLWQ4MDdjYjY4ZGFjOC5QTkc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwMjAzJTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDIwM1QyMjU1MzJaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1mMTdlZDU3MTNhYzJlYjE2OTljZjYxYzUyY2Q2MTViZWExM2ZiOGY4YTNlYTEyZmJlNzNiM2NjNjMyNjdkMGJhJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.ovCJgmqp8uIScQPEfkehJ3H6KbCKI3yOG52f7r4GlDQ" width="143" height="300"> | <img src="https://private-user-images.githubusercontent.com/110394722/302065603-71f5e38f-1ad2-441e-8f82-c10a5b325324.PNG?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDcwMDEyMzIsIm5iZiI6MTcwNzAwMDkzMiwicGF0aCI6Ii8xMTAzOTQ3MjIvMzAyMDY1NjAzLTcxZjVlMzhmLTFhZDItNDQxZS04ZjgyLWMxMGE1YjMyNTMyNC5QTkc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwMjAzJTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDIwM1QyMjU1MzJaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1lNTI1NmU1Yzc3MGFhMTgxOTY3ZmJmYjNiNzgzZjEwNjI5MzBiNWFkMDZmZjIwM2FhZjM3ZWU5M2VkYjZhZTNiJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.Uf7yY4si4TScXs8kbRvrqFtM5NAq47u3GBkXy7r1cEM" width="143" height="300"> |


<br>

### 🃏 Point
 랜덤 이미지 확인 시 좌우로 스와이프가 가능합니다.
- 오른쪽으로 넘기면 북마크에 자동 추가됩니다. 
- 팝업 시 애니메이션을 추가하였습니다.
- ProgressView()가 적용되어 있습니다.

| **`Swipe 북마크`** | **`팝업 애니메이션`** | **`좌우 Swipe`** |
| ---- | ---- | ---- |
| <img src="https://blogfiles.pstatic.net/MjAyNDAyMDRfMjQg/MDAxNzA3MDAzNTU4NzA2.lEOJzxtzfUexvDFfoz4nRGTPmPWeGZXobic--y3F9UMg.IK1xVN0Vauj-aZaDPjWTjafJOk0Mn-tBekFiTirT6Vsg.GIF.for_myeon/ddddddddddddddddd.gif" width="143" height="300"> | <img src="https://private-user-images.githubusercontent.com/110394722/302067181-8b22340e-cf48-40eb-b429-a72c7f5049d8.gif?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDcwMDMxMjcsIm5iZiI6MTcwNzAwMjgyNywicGF0aCI6Ii8xMTAzOTQ3MjIvMzAyMDY3MTgxLThiMjIzNDBlLWNmNDgtNDBlYi1iNDI5LWE3MmM3ZjUwNDlkOC5naWY_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwMjAzJTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDIwM1QyMzI3MDdaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1mZmQ2MGYwYjdkNzU2OTgyYjM5ZGExNzc4NGU1ZTZhOGFjMDQ0NTdjZWQ5OTNjNTIxYmY3ZDBkODJmNDkxNDk4JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.-0raBmVizSBaBritWaMwRiK6p7BgkIVYk1VK5wR7Cvg" width="143" height="300"> | <img src="https://blog.kakaocdn.net/dn/sVg82/btsEoJEEJQu/VuzPkX18gSborJ2Hedg3F1/img.gif" width="143" height="300"> |
|  |  |  |



<br>


### 💻 개발 환경, 도구 및 활용한 기술
```
- 개발 환경 : SwiftUI
```
