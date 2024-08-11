<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

 <%@ include file="/WEB-INF/views/include/top.jsp" %>

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
            <!-- Sidebar -->
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

            <!-- Main Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                   
                    <!-- Title Section -->
                 	 <div class="row mb-4 text-center" style="margin-left: 0px; margin-right: 0px;">
					    <div class="col" style="padding: 0;">
					        <a href="#faq" style="text-decoration: none; color: black; background-color: #D6EFD8; padding: 10px; display: block; margin-bottom: -1px;">
					            <h3 style="margin: 0;">FAQ</h3>
					        </a>
					    </div>
					    <div class="col" style="padding: 0;">
					        <a href="/hn/mypage/enqList" style="text-decoration: none; color: black; background-color: #D6EFD8; padding: 10px; display: block; margin-bottom: -1px;">
					            <h3 style="margin: 0;">1:1 문의사항</h3>
					        </a>
					    </div>
					    <div class="col" style="padding: 0;">
					        <a href="#faq-questions" style="text-decoration: none; color: black; background-color: #D6EFD8; padding: 10px; display: block;">
					            <h3 style="margin: 0;">자주하는 질문</h3>
					        </a>
					    </div>
					</div>

                    <!-- Table Section -->
                    <div class="table-container">
                        <table class="table">
                            <thead>
                                <tr class="text-center">
                                    <th>번호</th>
                                    <th>상품정보</th>
                                    <th>제목</th>
                                    <th>작성일</th>
                                    <th>답변상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${list}" var="vo">
                                    <tr class="text-center">
                                        <td>${vo.eno}</td>
                                        <td>상품</td>
                                        <td><a href="/hn/mypage/enqRead?eno=${vo.eno}">${vo.enquiry_type}</a></td>
                                        <td><fmt:formatDate value="${vo.write_date}" pattern="yyyy-MM-dd"/></td>
                                        <td>${vo.status}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="row">
                            <div class="col-md-10"></div>
                            <div class="col-md-2">
                                <a href="http://localhost/hn/mypage/enqRegisterForm">
                                    <button type="button" class="btn btn-outline-dark">1:1문의하기</button>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>


 <%@ include file="/WEB-INF/views/include/bottom.jsp" %>