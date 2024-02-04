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
| <img src="https://private-user-images.githubusercontent.com/110394722/302116009-2c414ef4-42fe-4539-b47d-100dc2f4107c.PNG?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDcwNjM0MjcsIm5iZiI6MTcwNzA2MzEyNywicGF0aCI6Ii8xMTAzOTQ3MjIvMzAyMTE2MDA5LTJjNDE0ZWY0LTQyZmUtNDUzOS1iNDdkLTEwMGRjMmY0MTA3Yy5QTkc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwMjA0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDIwNFQxNjEyMDdaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT03ZTY4YmQ2OTdmMzhjYjExMzkyYjA1MzQwODg0OWIwMzBkOWU4MzUwMjU2OThmOGI4YjM5MDJlYmU4ZGMwNGE5JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.bfU4nNy7nYqItZeS2XTW8hNkvDthkeLDOUAnhSW9_iY" width="143" height="300"> | <img src="https://private-user-images.githubusercontent.com/110394722/302116331-ae73d648-82c0-4b19-bd76-78f05ef18e96.PNG?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDcwNjM1NTgsIm5iZiI6MTcwNzA2MzI1OCwicGF0aCI6Ii8xMTAzOTQ3MjIvMzAyMTE2MzMxLWFlNzNkNjQ4LTgyYzAtNGIxOS1iZDc2LTc4ZjA1ZWYxOGU5Ni5QTkc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwMjA0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDIwNFQxNjE0MThaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1hMjRjZTQ4NjJhMjQwNWIzNjA1NmEwMmZmNmRjZTY1NGY0YWRjZjY0Njg1ZmQ0ZGI0MjQ0MzRlNmE0YmY0NmIzJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.a0RDtx0-FaUF56kyqx05ZE8SZwN_ZmarbPOUX0p4SGw" width="143" height="300"> | <img src="https://private-user-images.githubusercontent.com/110394722/302116304-bccfc11f-aacb-49d4-a4b4-bdb0ef8f0797.PNG?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDcwNjM1MjksIm5iZiI6MTcwNzA2MzIyOSwicGF0aCI6Ii8xMTAzOTQ3MjIvMzAyMTE2MzA0LWJjY2ZjMTFmLWFhY2ItNDlkNC1hNGI0LWJkYjBlZjhmMDc5Ny5QTkc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwMjA0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDIwNFQxNjEzNDlaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT02OWYwMWVkNjkwNmFmN2Q3ZDc1N2IxMTQ0OWY0NjVkOTI2OTY4NmI4ZTJjNjAzMDgwZWRmZjQ3OTBkOGU0NDQ2JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.4j32fbddHxTr665KQITvGtN5s4QrcNvgL69yonuIvEM" width="143" height="300"> | <img src="https://private-user-images.githubusercontent.com/110394722/302116255-18020af8-c2ee-43f4-bbf2-eac769ba8308.PNG?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MDcwNjM0NzEsIm5iZiI6MTcwNzA2MzE3MSwicGF0aCI6Ii8xMTAzOTQ3MjIvMzAyMTE2MjU1LTE4MDIwYWY4LWMyZWUtNDNmNC1iYmYyLWVhYzc2OWJhODMwOC5QTkc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwMjA0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDIwNFQxNjEyNTFaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT03NzJkOTY3ZjY3NGU0MTk1ZDViMDNlZDllNmVjNWNkNmY0NjZiMGMxOTdhYzU3NzA0NGY0ZjBjOWY5ZDY4ODE3JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.6Xa4wrYl8cyvNoV2nucVVpByBFVbGAxuTou8u67mkkE" width="143" height="300"> |




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
