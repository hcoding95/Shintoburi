<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 
 <style>
 body, html {
    height: 100%;
    margin: 0;
}

#wrapper {
    display: flex;
    justify-content: center; /* 수평 중앙 정렬 */
    align-items: flex-start; /* 상단 정렬 */
    min-height: 100vh; /* 전체 화면 높이 */
    padding: 20px; /* 양옆에 여백 추가 */
}

#content-wrapper {
    display: flex;
    width: 100%;
    max-width: 1200px; /* 최대 너비 설정 */
}

#sidebar-wrapper {
    width: 200px; /* 사이드바 너비 */
    background-color: #fff;
    border-end: 1px solid #ddd; /* 사이드바의 오른쪽 경계선 */
}

#page-content-wrapper {
    flex: 1; /* 나머지 공간 차지 */
}

.sidebar-heading {
    font-size: 1.25rem; /* 제목 글씨 크기 조정 */
    font-weight: bold; /* 제목 글씨 두껍게 */
    color: black; /* 제목 색상을 검정색으로 변경 */
    margin-bottom: 20px; /* 제목과 그 아래 항목 사이의 간격 조정 */
}

.list-group-item {
    font-size: 1.25rem; /* 사이드바 항목 글씨 크기 조정 */
    font-weight: bold; /* 사이드바 항목 글씨 두껍게 */
    color: black; /* 사이드바 항목 색상을 검정색으로 변경 */
    margin-bottom: 15px; /* 항목 간의 간격 조정 */
}

.sub-menu {
    list-style: none;
    padding-left: 20px;
}

.sub-menu li {
    margin-bottom: 8px; /* 서브 메뉴 항목 간격 조정 (8px로 설정, 필요에 따라 조정 가능) */
}

.sub-menu a {
    font-size: 1rem; /* 서브 메뉴 항목 글씨 크기 조정 */
    color: black; /* 링크 색상을 검정색으로 변경 */
    text-decoration: none; /* 링크 밑줄 제거 */
}

.sub-menu a:hover {
    color: #333; /* 마우스 오버 시 색상 변경 (선택 사항) */
}



.center-text span {
    font-size: 1.5rem; /* '마이페이지' 글씨 크기 조정 */
    font-weight: bold; /* '마이페이지' 글씨 두껍게 */
    margin-bottom: 20px; /* '마이페이지'와 그 아래 항목 사이의 간격 조정 */
    font-size: 30px;
    padding-left: 16px;
}
</style>

<body>
    <div id="wrapper">
        <div id="content-wrapper">
            <!-- Sidebar-->
            <div id="sidebar-wrapper">
                <div class="center-text">
                    <span >마이페이지</span>
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
            
            
            
 
<%@ include file="/WEB-INF/views/include/bottom.jsp" %>


   