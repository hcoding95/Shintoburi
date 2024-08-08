<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 
 <%@ include file="/WEB-INF/views/hn/manager/include/header.jsp" %>
 <%@ include file="/WEB-INF/views/hn/manager/include/bs.jsp" %>


<div class="container mt-4">
    <div class="card shadow mb-4">
        <!-- Card Header -->
        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
            <h6 class="m-0 font-weight-bold text-primary">문의 사항</h6>
        </div>
        <!-- Card Body -->
        <div class="card-body">
            <div class="row">
                <div class="col-md-12">
                    <table class="table">
                        <thead colspan="12">
                            <tr class="col-md-8 text-center" >
                                <th>번호</th>
                                <th>작성 아이디</th>
                                <th>상품정보</th>
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
                                     
                                     <td><c:choose>
                                    <c:when test="${vo.status == '답변완료'}">
                                       <button class="btn btn-outline-dark" style="padding-bottom: 1px; padding-top: 1px;" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapse${vo.eno}">
                                           ▼ 
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                       미답변
                                    </c:otherwise>
                                </c:choose></td>
                                </tr>
                                
                                <!-- 답변 -->
                                <tr>
                                    <td colspan="12"> <!-- Adjust the colspan value as needed -->
                                        <div id="collapse${vo.eno}" class="collapse">
                                            <table class="table mb-0">
                                                <thead>
                                                    <tr class="text-center">
                                                        <th>답변 번호</th>
                                                        <th>답변 내용</th>
                                                        <th>답변 날짜</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%-- 답변 내용 예제 --%>
                                                    <%-- <c:forEach items="${vo.replyList}" var="reply"> --%>
                                                    <%--     <tr class="text-center"> --%>
                                                    <%--         <td>${reply.rno}</td> --%>
                                                    <%--         <td>${reply.reply_content}</td> --%>
                                                    <%--         <td><fmt:formatDate value="${reply.reply_date}" pattern="yyyy-MM-dd"/></td> --%>
                                                    <%--     </tr> --%>
                                                    <%-- </c:forEach> --%>
                                                </tbody>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
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
</div>




 <%@ include file="/WEB-INF/views/hn/manager/include/footer.jsp" %>