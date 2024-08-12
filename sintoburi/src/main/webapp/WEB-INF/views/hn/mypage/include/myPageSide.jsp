<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



  <style>
        body, html {
            height: 100%;
            margin: 0;
        }

        #wrapper {
            display: flex;
            min-height: 100vh;
            justify-content: center; /* 수평 중앙 정렬 */
            align-items: flex-start; /* 상단 정렬 */
        }

        #content-wrapper {
            display: flex;
            width: 100%;
            max-width: 1200px; /* 최대 너비 설정 */
        }

        #sidebar-wrapper {
            width: 200px; /* 사이드바 너비 */
            background-color: #fff;
            border-right: 1px solid #ddd; /* 사이드바의 오른쪽 경계선 */
            flex-shrink: 0; /* 사이드바가 줄어들지 않도록 설정 */
        }

        #page-content-wrapper {
            flex: 1; /* 나머지 공간 차지 */
            padding: 20px; /* 콘텐츠 여백 추가 */
            display: flex;
            flex-direction: column;
            align-items: center; /* 수평 중앙 정렬 */
        }

        .center-text span {
            font-size: 30px;
            font-weight: bold;
            padding-left: 16px;
        }

        .sidebar-heading {
            font-size: 1.25rem;
            font-weight: bold;
            color: black;
            margin-bottom: 20px;
        }

        .list-group-item {
            font-size: 1.25rem;
            font-weight: bold;
            color: black;
            margin-bottom: 15px;
        }

        .sub-menu {
            list-style: none;
            padding-left: 20px;
        }

        .sub-menu li {
            margin-bottom: 8px;
        }

        .sub-menu a {
            font-size: 1rem;
            color: black;
            text-decoration: none;
        }

        .sub-menu a:hover {
            color: #333;
        }

        .table-container {
            width: 100%;
            max-width: 1000px; /* 테이블 최대 너비 설정 */
        }

        .table {
            width: 100%; /* 테이블 폭을 부모 컨테이너에 맞춤 */
        }
    </style>
</head>
<body>
    <div id="wrapper">
        <div id="content-wrapper">
            <div id="sidebar-wrapper">
                <div class="center-text">
                    <span>마이페이지</span>
                </div>
                <div class="list-group list-group-flush">
                    <div class="list-group-item list-group-item-action list-group-item-light p-3">
                        마이쇼핑
                    </div>
                    <ul class="sub-menu">
                        <li><a href="#!">주문/배송 조회</a></li>
                        <li><a href="#!">취소/반품/교환 내역</a></li>
                    </ul>
                    <div class="list-group-item list-group-item-action list-group-item-light p-3">
                        마이활동
                    </div>
                    <ul class="sub-menu">
                        <li><a href="/hn/mypage/enqList">1:1문의내역</a></li>
                        <li><a href="#!">리뷰 (<span class="num_review">0</span>)</a></li>
                        <li><a href="#!">이벤트 참여 현황</a></li>
                    </ul>
                    <div class="list-group-item list-group-item-action list-group-item-light p-3">
                        마이정보
                    </div>
                    <ul class="sub-menu">
                        <li><a href="#!">회원정보 수정</a></li>
                        <li><a href="#!">배송지/환불계좌</a></li>
                        <li><a href="#!">회원탈퇴</a></li>
                    </ul>
                </div>
            </div>
<!-- main -->            
       
      
       
       
<!-- main -->


   