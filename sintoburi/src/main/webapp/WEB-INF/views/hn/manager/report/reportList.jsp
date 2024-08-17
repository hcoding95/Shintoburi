<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--   <%@ include file ="/WEB-INF/views/hn/manager/include/bs.jsp" %> --%>
 <%@ include file="/WEB-INF/views/hn/manager/include/header.jsp" %>

<script>
$(function() {
		
	// 페이지 블럭
	 $("a.page-link").click(function(e) {
	        e.preventDefault(); // 브라우저의 기본 기능 막기
	        
	        let pageNum = $(this).attr("href");
	        console.log(pageNum);
	        $("#actionForm > input[name=pageNum]").val(pageNum);
	        $("#actionForm").attr("action", "/hn/manager/report/reportList");
	        $("#actionForm").submit();
	    });
	
	
	
});
</script>


<div class="row">

     <!-- Area Chart -->
     <div class="col-xl-12 col-lg-12">
         <div class="card shadow mb-4">
             <!-- Card Header - Dropdown -->
             <div
                 class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                 <h6 class="m-0 font-weight-bold text-primary">신고 게시글</h6>
              	 <form method="get">
	            		<select name="type">
	            			<option value="N" ${criteria.type == 'N' ? 'selected' : ''}>게시글번호</option>
	            			<option value="W" ${criteria.type == 'W' ? 'selected' : ''}>게시글작성자</option>
	            			<option value="S" ${criteria.type == 'S' ? 'selected' : ''}>답변상태</option>
	            		</select>
	            		<input type="text" name="keyword"
	            			value="${criteria.keyword}">
	            		
	            		<button type="button" class="btnMod btn btn-outline-dark btn-sm">검색</button>
            		</form>
            	
             </div>
             <!-- Card Body -->
             <div class="card-body"> 

<div class="row">
	<div class="col-md-12">
		
		<table class="table">
    <thead>
        <tr class="text-center">
            <th>번호</th>
            <th>신고게시글</th>
            <th>게시글작성자</th>
            <th>신고유형</th>
            <th>신고일</th>
            <th>처리상태</th>
            <th>답변확인</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${reportList}" var="vo">
            <tr class="text-center">
                <td>${vo.re_no}</td>
                <td>${vo.post_no}</td>
                <td>${vo.post_id}</td>
                <td><a href="/hn/manager/report/reportDetail/${vo.re_no}">${vo.re_reason}</a></td>
                <td><fmt:formatDate value="${vo.re_date}" pattern="yyyy-MM-dd"/></td>
                <td>${vo.status}</td>
                <td>
                    <c:choose>
                        <c:when test="${vo.status == '처리완료'}">
                            <button class="btn btn-sm" type="button" data-toggle="collapse" 
                            data-target="#collapse${vo.eno}" aria-expanded="false">
                                ▼
                            </button>
                        </c:when>
                        <c:otherwise>
                            미처리
                        </c:otherwise>
                    </c:choose>
                </td>
                <td></td>
            </tr>
            <!-- 답변 아코디언 -->
            <tr>
                <td colspan="10"> <!-- Adjust the colspan value as needed -->
                    <div id="collapse${vo.re_no}" class="collapse">
                        <div class="card card-body">
                            <table class="table mb-0">
                                <thead>
                                    <tr class="text-center">
                                        <th>답변 번호</th>
                                        <th>답변 내용</th>
                                        <th>답변 날짜</th>
                                    </tr>
                                </thead>
<!--                                 <tbody> -->
<%--                                     <c:forEach items="${replyList}" var="reply"> --%>
<%--                                          <c:if test="${reply.eno == vo.eno}"> --%>
<!--                                             <tr class="text-center"> -->
<%--                                                 <td>${reply.rno}</td> --%>
<%--                                                 <td>${reply.reply_content}</td> --%>
<%--                                                 <td><fmt:formatDate value="${reply.reply_date}" pattern="yyyy-MM-dd"/></td> --%>
<!--                                             </tr> -->
<%--                                         </c:if> --%>
<%--                                     </c:forEach> --%>
<!--                                 </tbody> -->
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