### 목차

> 1. [ERD 구조](#erd-구조)
> 2. [시스템 아키텍처](#시스템-아키텍처)
> 3. [기술 스택](#기술-스택)
> 4. [주요 기능](#주요-기능)
>   + 공통 : [회원가입, 로그인](#회원가입-로그인) | [상품 목록 및 상세 조회](#상품-목록-및-상세-조회) | [블로그 게시글 목록 및 상세 조회](#블로그-게시글-목록-및-상세-조회) | [블로그 게시글 목록 및 상세 조회](#블로그-게시글-목록-및-상세-조회) | [커뮤니티 게시글 목록 및 상세 조회](#커뮤니티-게시글-목록-및-상세-조회) | [공지사항 및 자주하는 질문](#공지사항-및-자주하는-질문)
>   + 사용자 : [상품몰 관리](#상품몰-관리) | [주문 관리 및 장바구니 ](#주문-관리-및-장바구니) | [블로그 관리](#블로그-관리) | [커뮤니티 관리](#커뮤니티-관리) | [마이페이지](#마이페이지)
>   + 관리자 : [회원 및 등급 관리](#회원-및-등급-관리) | [상품 및 카테고리 관리](#상품-및-카테고리-관리) | [공지사항 및 faq 관리](#공지사항-및-faq-관리) | [신고 게시글 및 문의 관리](#신고-게시글-및-문의-관리)
> 5. [API 명세](#api-명세)
> 6. [형상 관리 - Notion, Jira](#형상-관리)
> 7. [팀 문화](#팀-문화)

# 프로젝트 소개


> "신토불이" 프로젝트는 귀농 청년들을 대상으로 농작물 판매를 지원하는 온라인 플랫폼 구축을 목표로 했습니다. 프로젝트는 귀농 청년들이 직면한 판로 확보의 어려움을 해결하고 소비자에게 신선한 농산물을 제공하기 위한 다양한 기능을 포함했습니다.
> 
> SpringMVC를 사용해 기본적인 REST API를 구현하였습니다.
> 
> ### 개발 기간 및 인원
> 24.08.16 ~ 23.09.3 (3주) \
> 백엔드 5명



# ERD 구조

![image](https://github.com/user-attachments/assets/451945ab-b113-4d8f-a7ac-02c7c056a306)



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
    - 상품 목록 및 상세 조회
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
    - 신고 게시글 및 문의 관리
   </td>
  </tr>
</table>

## [ 공통 기능 ]

### 회원가입, 로그인
- 사용자는 개인정보를 입력해 회원가입할 수 있다.
- 회원가입 시 사용한 아이디와 비밀번호를 이용해 로그인할 수 있다.

### 상품 목록 및 상세 조회
- 상품 카테고리 별 상품 목록을 조회할 수 있다.


### 블로그 게시글 목록 및 상세 조회
- 블로그 게시글 목록 및 상세 조회를 할 수 있다.


### 커뮤니티 게시글 목록 및 상세 조회 


### 공지사항 및 자주하는 질문
- 공지사항과 자주하는 질문을 조회 할 수 있다.

## [ 사용자 기능 ]

### 상품몰 관리


### 주문관리 및 장바구니 
언니꺼 


### 블로그 관리


### 커뮤니티 관리


### 마이페이지 관리
- 1:1 문의사항 등록,수정,삭제가 가능하다.
- 회원수정 및 탈퇴가 가능하다.

## [ 관리자 기능 ]

### 회원 및 등급 관리
- 회원 목록 조회 및 상세 정보 확인을 할 수 있다.
- 회원의 등급 수정 및 사업자번호 업데이트를 할 수 있다.
- 등급 변경이 필요한 회원 리스트 조회를 할 수 있다.

### 상품 및 카테고리 관리


### 공지사항 및 faq 관리
- 게시글 목록 조회 및 등록, 수정, 삭제를 할 수 있다.
- 공지사항 항목에 따라 일반/중요/관리자로 나뉘며 상단에 표시 된다.

### 신고 게시글 및 문의 관리
- 신고된 게시글 목록 조회 및 삭제처리를 할 수 있다.
- 상품 및 등급 관련 문의 사항 관리 및 답변처리를 할 수있다.





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

