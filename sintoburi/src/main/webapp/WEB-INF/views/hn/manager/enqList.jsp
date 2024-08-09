<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--   <%@ include file ="/WEB-INF/views/hn/manager/include/bs.jsp" %> --%>
 <%@ include file="/WEB-INF/views/hn/manager/include/header.jsp" %>


<div class="row">

     <!-- Area Chart -->
     <div class="col-xl-12 col-lg-12">
         <div class="card shadow mb-4">
             <!-- Card Header - Dropdown -->
             <div
                 class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                 <h6 class="m-0 font-weight-bold text-primary">문의 사항</h6>
                 
             </div>
             <!-- Card Body -->
             <div class="card-body"> 

<div class="row">
	<div class="col-md-12">
		
		<table class="table">
    <thead>
        <tr class="text-center">
            <th>번호</th>
            <th>작성 아이디</th>
            <th>상품</th>
            <th>제목</th>
            <th>작성일</th>
            <th>답변상태</th>
            <th>답변확인</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${enquiryList}" var="vo">
            <tr class="text-center">
                <td>${vo.eno}</td>
                <td>${vo.user_id}</td>
                <td>상품</td>
                <td><a href="/hn/manager/enquiryDetail/${vo.eno}">${vo.enquiry_type}</a></td>
                <td><fmt:formatDate value="${vo.write_date}" pattern="yyyy-MM-dd"/></td>
                <td>${vo.status}</td>
                <td>
                    <c:choose>
                        <c:when test="${vo.status == '답변완료'}">
                            <button class="btn btn-outline-dark collapsed" type="button" data-toggle="collapse" data-target="#collapse${vo.eno}" aria-expanded="false" style="
                                padding-bottom: 0px;
                                padding-top: 0px;
                                padding-left: 10px;
                                padding-right: 10px;">
                                ▼
                            </button>
                        </c:when>
                        <c:otherwise>
                            미처리
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <!-- 답변 아코디언 -->
            <tr>
                <td colspan="7"> <!-- Adjust the colspan value as needed -->
                    <div id="collapse${vo.eno}" class="collapse">
                        <div class="card card-body">
                            <table class="table mb-0">
                                <thead>
                                    <tr class="text-center">
                                        <th>답변 번호</th>
                                        <th>답변 내용</th>
                                        <th>답변 날짜</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${replyList}" var="reply">
                                         <c:if test="${reply.eno == vo.eno}">
                                            <tr class="text-center">
                                                <td>${reply.rno}</td>
                                                <td>${reply.reply_content}</td>
                                                <td><fmt:formatDate value="${reply.reply_date}" pattern="yyyy-MM-dd"/></td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

	</div>
</div>
<!-- Pagination -->
            <div class="row">
				<div class="col-md-12">
					<nav>
						<ul class="pagination justify-content-center">
							<c:if test="${pageMaker.prev == true}">
							<li class="page-item">
								<a class="page-link" href="${pageMaker.startPage - 1}">&laquo;</a>
							</li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage}" 
									   end="${pageMaker.endPage}" 
									   var="v">
							<li class="page-item ${v == pageMaker.cri.pageNum ? 'active' : ''}"> <!-- li -->
								<a class="page-link" href="${v}">${v}</a>
							</li>
							</c:forEach>
							<c:if test="${pageMaker.next == true}">
							<li class="page-item">
								<a class="page-link" href="${pageMaker.endPage + 1}">&raquo;</a>
							</li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
            <!-- // Pagination -->
    </div>
            </div> <!-- card-body -->
        </div>
    </div>
</div>






 <%@ include file="/WEB-INF/views/hn/manager/include/footer.jsp" %>