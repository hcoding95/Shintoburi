### 목차

> 1. [ERD 구조](#erd-구조)
> 2. [시스템 아키텍처](#시스템-아키텍처)
> 3. [기술 스택](#기술-스택)
> 4. [주요 기능](#주요-기능)
>   + 공통 : [회원가입, 로그인](#회원가입-로그인) | [상품 목록 및 상세 조회](#상품-목록-및-상세-조회) | [블로그 게시글 목록 및 상세 조회](#블로그-게시글-목록-및-상세-조회) | [블로그 게시글 목록 및 상세 조회](#블로그-게시글-목록-및-상세-조회)\
>          | [커뮤니티 게시글 목록 및 상세 조회](#커뮤니티-게시글-목록-및-상세-조회) | [공지사항 및 자주하는 질문](#공지사항-및-자주하는-질문)
>   + 사용자 : [장바구니 관리](#장바구니-관리) | [주문 관리](#주문-관리) | [리뷰 관리](#리뷰-관리)
>   + 관리자 : [상품 및 상품 카테고리 관리](#상품-및-상품-카테고리-관리) | [옵션 및 옵션 카테고리 관리](#옵션-및-옵션-카테고리-관리) | [주문 관리](#주문-관리)
> 5. [API 명세](#api-명세)
> 6. [형상 관리 - Notion, Jira](#형상-관리)
> 7. [팀 문화](#팀-문화)

# 프로젝트 소개


> 신토불이는 농작물 판매와 구매를 지원하는 온라인 플랫폼입니다.\
> 사용자에게는 \
> 관리자에게는 
> 
> SpringBoot와 Spring Data JPA를 사용해 기본적인 REST API를 구현하고,\
> Docker, AWS, S3 등을 이용해 서버를 배포했습니다.

> ### 개발 기간 및 인원
> 24.08.16 ~ 23.09.3 (3주) \
> 백엔드 5명

> ### [배포 링크 (Swagger API Test 가능)](http://43.201.95.177:8080/swagger-ui/#) 👈 클릭!

## 팀원

<div align="center">
<table align="center"> <!-- 팀원 표 -->
  <tr>
   <th >
    Backend 고지환
   </th>
   <th>
    Backend 김동석
   </th>
   <th >
    Backend 김효철
   </th>
   <th >
    Backend 이규림
   </th>
   <th >
    Backend 장한나
   </th>
   </tr>
  <tr>
    <td align="center">
        <img src="https://github.com/YesunPark/cafe-bom/assets/108933466/801e2b25-e3fa-4c9e-83e3-43b3b0280a78" width=300px alt="고지환"> 
        <br/>
    </td>
    <td align="center">
        <img src="https://github.com/YesunPark/cafe-bom/assets/108933466/871f84d5-a2da-49e0-927e-8c023f2419ed" width=300px alt="김동석"> 
        <br/>
    </td>
    <td align="center">
        <img src="https://github.com/YesunPark/cafe-bom/assets/108933466/98f1d69f-3890-45af-9c90-2221b478dd7b" width=300px alt="김효철"> 
        <br/>
    </td>
    <td align="center">
        <img src="https://user-images.githubusercontent.com/61264510/220117269-9ca3a740-5483-4c26-83f1-3fe2aa3f957b.png" width=300px alt="이규림"> 
        <br/>
    </td>
    <td align="center">
        <img src="https://github.com/YesunPark/cafe-bom/assets/108933466/77fe609d-7718-434e-b1ca-98dc61a40816" width=300px alt="장한나"> 
        <br/>
    </td>
  </tr>
  <tr>
    <td align="center" class="지환">
        <a href="https://github.com/sunlake123"><img alt="github-link" height="25" src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=GitHub&logoColor=white"/></a>
        <br/>
        <a href="https://velog.io/@sunlake123"><img alt="vlog-link" height="25" src="https://img.shields.io/badge/Tech blog-20C997?style=flat-square&logo=Velog&&logoColor=white"/></a>
   </td>
   <td align="center" class="동석">
        <a href="https://github.com/bingsoo95"><img alt="github-link" height="25" src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=GitHub&logoColor=white"/></a>
   </td>
   <td align="center" class="효철">
        <a href="https://github.com/thsu1084"><img alt="github-link" height="25" src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=GitHub&logoColor=white"/></a>
   </td>
   <td align="center" class="규림">
        <a href="https://github.com/YesunPark"><img alt="github-link" height="25" src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=GitHub&logoColor=white"/></a>
        <br/>
        <a href="https://velog.io/@lynn080"><img alt="vlog-link" height="25" src="https://img.shields.io/badge/Tech blog-20C997?style=flat-square&logo=Velog&&logoColor=white"/></a>
        <br/>   
        <a href="mailto:lynn08082@gmail.com"><img alt="gmail-link" height="25" src="https://img.shields.io/badge/Email-d14836?style=flat-square&logo=Gmail&&logoColor=white"/></a>
   </td>
   <td align="center" class="한나">
        <a href="https://github.com/rkoji"><img alt="github-link" height="25" src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=GitHub&logoColor=white"/></a>
        <br/>   
        <a href="mailto:wl0wn1212@gmail.com"><img alt="gmail-link" height="25" src="https://img.shields.io/badge/Email-d14836?style=flat-square&logo=Gmail&&logoColor=white"/></a>
   </td>
  </tr>

</table>
</div>


# ERD 구조

[👉 ERD Cloud에서 직접 보기](https://www.erdcloud.com/d/pqop6rtCyk7PzkgLD)

![ERD 0913](https://github.com/YesunPark/cafe-bom/assets/108933466/71aefe7c-ab4b-44fb-a7e9-9585f9875e15)



# 시스템 아키텍처

![cafe-bom 시스템 아키텍처](https://github.com/YesunPark/cafe-bom/assets/108933466/abc731cd-b95f-459f-af97-7886f3aca88d)



# 기술 스택

<img width="610" alt="cafe-bom 기술 스택" src="https://github.com/cafe-bom/cafe-bom-yesun/assets/108933466/b505b100-e18e-4851-8937-e851f57369fd">

<br/>
<br/>

# 주요 기능

### 요약

<table align="center"><!-- 팀원 표 -->
  <tr>
   <th>
    공통
   </th>
   <th>
    사용자
   </th>
   <th >
    관리자
   </th>
   </tr>
  <tr>
   <td align="left" width="350px" class="공통">
    - 회원가입, 로그인
    <br/>
    - 상품 목록 및 상세조회
    <br/>
    - 블로그 게시글 목록 및 상세 조회
    <br/>
    - 커뮤니티 게시글 목록 및 상세 조회 
    <br/>
    - 공지사항 및 자주하는 질문
   </td>
    
   <td align="left" width="350px" class="사용자">
    - 상품몰 관리
    <br/>
    - 주문관리 및 장바구니 
    <br/>
    - 블로그 관리
    <br/>
    - 커뮤니티 관리
    <br/>
    - 마이페이지 관리
   </td>

   <td align="left" width="350px" class="관리자">
    - 회원 및 등급 관리
    <br/>
    - 상품 및 카테고리 관리
    <br/>
    - 공지사항 및 faq 관리
    <br/>
    - 신고 및 문의 관리
   </td>
  </tr>
</table>

## [ 공통 기능 ]

### 회원가입, 로그인
- 사용자는 이메일, 비밀번호, 닉네임, 휴대전화번호를 이용해 회원가입할 수 있다.
- 관리자는 이메일, 비밀번호, 관리자 인증코드, 실명을 이용해 회원가입할 수 있다.
- 회원가입 시 사용한 이메일과 비밀번호를 이용해 로그인할 수 있다.

### 상품 목록 및 상품 상세 조회
- 상품 카테고리 별 상품 목록을 조회할 수 있다.
  - 판매중인 상품과 매진된 상품이 전부 조회되며, 카테고리 별 상품이 아닌 전체 상품 목록 조회는 불가능하다.
- 베스트 상품 목록
  - 주문량이 많은 순서대로 5개의 상품들이 조회된다.
- 상품의 상세 정보를 조회할 수 있다. 상세정보에는 상품의 정보와 추가할 수 있는 옵션이 포함되어 있다.


## [ 사용자 기능 ]

### 장바구니 관리
- 장바구니에 상품을 추가한 후, 상품의 수량을 조절하거나 상품을 삭제할 수 있다.

### 주문 관리
- 결제를 하면 장바구니에 담겨있는 모든 상품이 주문 내역으로 생성된다.
- 기본적으로 3개월간의 주문 내역이 조회되고, 기간을 설정할 시 설정한 기간동안의 내역이 조회된다.
- 본인의 모든 주문 내역을 조회할 수 있다.
- 주문한 상품들의 조리가 시작된 후 시간이 얼마나 경과되었는지 조회할 수 있다.
- 관리자가 주문을 수락하기 이전에는 사용자가 주문을 취소할 수 있다.


### 리뷰 관리
- 본인이 주문한 상품에 대해 리뷰 내용, 별점(1~5점), 사진 1장으로 리뷰를 등록할 수 있다.


## [ 관리자 기능 ]

### 상품 및 상품 카테고리 관리
- 상품을 등록할 수 있다.(상품 사진은 1장만 등록할 수 있다.)
- 등록한 상품의 정보를 수정, 삭제할 수 있다.
- 상품 전체 목록을 조회할 수 있고, 상품 하나의 정보도 조회할 수 있다.
- 상품의 품절 여부를 변경할 수 있다.
- 상품 카테고리를 등록할 수 있고, 등록한 상품 카테고리를 수정, 삭제할 수 있다.
- 상품 카테고리 전체 목록을 조회할 수 있고, 상품 카테고리 하나의 정보도 조회할 수 있다.

### 옵션 및 옵션 카테고리 관리
- 옵션 및 옵션 카테고리를 등록할 수 있고, 등록한 옵션을 수정, 삭제할 수 있다.
- 옵션 및 옵션 카테고리의 전체 목록을 조회할 수 있고, 하나의 정보도 조회할 수 있다

### 주문 관리
- 주문이 어떻게 진행되고 있는지 확인할 수 있도록 주문의 상태를 변경할 수 있다.
- 주문이 들어오면 예상 조리 시간을 선택해야 한다.
- 주문이 들어오면 주문을 수락하거나 거절할 수 있다.




# [API 명세](https://woozy-tendency-8e6.notion.site/api-e7184d90ae844aab9b6a84038c1e5155?pvs=4) 
⬆️ 제목(Notion 링크) 클릭해서 자세히보기

| Domain      | URL                                                                        | Http Method                 | description       | 접근 권한 |
|:------------|:---------------------------------------------------------------------------|:----------------------------|:------------------|:------|
| **Auth**    | /signup                                                                    | `POST`                      | 사용자 회원가입          | -     |
|             | /signup/admin                                                              | `POST`                      | 관리자 회원가입          | -     |
|             | /signin                                                                    | `POST`                      | 사용자/관리자 로그인       | -     |
| **Product** | /product/list/{categoryId}                                                 | `GET`                       | 카테고리 별 상품 목록 조회   | -     |
|             | /product/best-list                                                         | `GET`                       | 베스트 상품 목록 조회      | -     |
|             | /product/{productId}                                                       | `GET`                       | 상품 상세 조회          | -     |
|             | /admin/product                                                             | `POST`                      | 상품 등록             | ADMIN |
|             | /admin/product/{productId}                                                 | `GET` `PUT` `DELETE`        | 상품 조회, 수정, 삭제     | ADMIN |
|             | /admin/product?productId={productId}&soldout={soldOutStatus}               | `PUT`                       | 상품 품절 여부 수정       | ADMIN |
|             | /admin/option/{optionId}                                                   | `GET` `PUT` `POST` `DELETE` | 상품 옵션 CRUD        | ADMIN |
|             | /admin/category/{categoryId}                                               | `GET` `PUT` `POST` `DELETE` | 상품 카테고리 CRUD      | ADMIN |
|             | /admin/option-category                                                     | `GET` `PUT` `POST` `DELETE` | 옵션 카테고리 CRUD      | ADMIN |
| **Order**   | /auth/pay/list?viewType={viewType}&startDate={startDate}&endDate={endDate} | `GET`                       | 구매 내역 조회          | USER  |
|             | /auth/order/elapsed-time/{orderId}                                         | `GET`                       | 주문 경과 시간 조회       | USER  |
|             | /auth/order/cancel/{orderId}                                               | `PATCH`                     | 주문 취소             | USER  |
|             | /admin/order/status/{orderId}                                              | `PATCH`                     | 주문 상태 변경          | ADMIN |
|             | /admin/order/cooking-time/{orderId}                                        | `PATCH`                     | 예상 조리 시간 선택       | ADMIN |
|             | /admin/order/receipt-status/{orderId}                                      | `PATCH`                     | 주문 수락 또는 거절       | ADMIN |
| **Cart**    | /auth/cart                                                                 | `GET`                       | 장바구니 상품 목록 조회     | USER  |
|             | /auth/cart/save                                                            | `POST`                      | 장바구니 상품 추가        | USER  |
|             | /auth/cart                                                                 | `POST` `DELETE`             | 장바구니 상품 수량 변경, 삭제 | USER  |
|             | /auth/pay                                                                  | `PUT`                       | 장바구니 전체 결제        | USER  |
| **Review**  | /auth/review                                                               | `POST`                      | 리뷰 등록             | USER  |

<br/>




# 형상 관리

<table align="center"> <!-- 팀원 표 -->
  <tr>
   <th>
      [ Notion ]
      <br/>
      컨벤션, api 명세, 팀 규칙, 미팅 로그 등
      <br/>
      프로젝트 진행에 필요한 전반적인 사항 기록
   </th>
   <th>
      [ Jira ]
      <br/>
      개발을 진행하며 Sprint 단위로 계획한 사항의
      <br/>
      담당자, 마감일, 진행 상황, 세부 사항 기록
   </th>
   </tr>
  <tr>
   <td align="left" width="500px" class="Notion">
      <img src="https://github.com/YesunPark/cafe-bom/assets/108933466/349bfa12-b79b-47f0-88fa-d5b5e87b9133"/>
      <img src="https://github.com/YesunPark/cafe-bom/assets/108933466/cd231c74-2f02-4450-938d-5e413fa335cc"/>
   </td>
   <td align="left" width="500px" class="Jira">
      <img src="https://github.com/YesunPark/cafe-bom/assets/108933466/63d9e02e-49f4-458a-992f-46f490d1da30"/>
  </tr>
</table>

<br/>

