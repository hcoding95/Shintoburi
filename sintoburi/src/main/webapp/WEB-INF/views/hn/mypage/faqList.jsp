<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

 <%@ include file="/WEB-INF/views/include/top.jsp" %>
 <%@ include file="/WEB-INF/views/hn/mypage/include/myPageSide.jsp" %>

<style>
/* 아코디언 카드 전체 테두리 제거 */
.card {
    border: none; /* 카드의 테두리 제거 */
}

/* 카드 헤더의 가로 옆 테두리 제거 */
.card-header {
    border-left: none; /* 왼쪽 테두리 제거 */
    border-right: none; /* 오른쪽 테두리 제거 */
    border-top: none; /* 위쪽 테두리 제거 (선택적) */
    border-bottom: 1px solid #ddd; /* 아래쪽 테두리만 유지 (선택적) */
}

/* 아코디언 토글 스타일 조정 */
.accordion-toggle {
    cursor: pointer;
    padding: 8px; /* 세로 길이 조정 */
    background-color: #ffffff; /* 하얀색 배경 */
    color: black;
    text-decoration: none;
    border: none; /* 테두리 제거 */
    box-shadow: none; /* 그림자 제거 (선택적) */
    font-size: 14px; /* 글씨 크기 조정 */
}

.accordion-toggle:hover {
    background-color: #f8f9fa; /* 호버 시 배경색 변경 */
}

</style>
            <!-- Main Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                   
                    <!-- Title Section -->
                 	  <div class="row mb-4 text-center" style="margin-left: 0px; margin-right: 0px;">
					    <div class="col" style="padding: 0;">
					        <a href="/hn/mypage/noticeList" style="text-decoration: none; color: black; background-color: #D6EFD8; padding: 10px; display: block; margin-bottom: -1px;">
					            <h3 style="margin: 0;">공지사항</h3>
					        </a>
					    </div>
					    <div class="col" style="padding: 0;">
					        <a href="/hn/mypage/enqList" style="text-decoration: none; color: black; background-color: #D6EFD8; padding: 10px; display: block; margin-bottom: -1px;">
					            <h3 style="margin: 0;">1:1 문의사항</h3>
					        </a>
					    </div>
					    <div class="col" style="padding: 0;">
					        <a href="/hn/mypage/faqList" style="text-decoration: none; color: black; background-color: #D6EFD8; padding: 10px; display: block;">
					            <h3 style="margin: 0;">자주하는 질문</h3>
					        </a>
					    </div>
					</div>
			
			
			<div id="accordion">
			    <c:forEach items="${faqList}" var="vo">
			        <div class="card">
			            <div class="card-header" id="heading${vo.f_no}">
			                <h5 class="mb-0">
			                    <div class="accordion-toggle" data-toggle="collapse" data-target="#collapse${vo.f_no}" aria-expanded="true" aria-controls="collapse${vo.f_no}">
			                     ${vo.title}
			                    </div>
			                </h5>
			            </div>
			            <div id="collapse${vo.f_no}" class="collapse" aria-labelledby="heading${vo.f_no}" data-parent="#accordion">
			                <div class="card-body">
			                    ${vo.content}
			                </div>
			            </div>
			        </div>
			    </c:forEach>
			</div>
    </div>
</div>

 <%@ include file="/WEB-INF/views/include/bottom.jsp" %>