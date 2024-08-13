<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@ include file="/WEB-INF/views/hn/manager/include/header.jsp" %>

 <div class="row">

     <!-- Area Chart -->
     <div class="col-xl-12 col-lg-12">
         <div class="card shadow mb-4">
             <!-- Card Header - Dropdown -->
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			    <h6 class="m-0 font-weight-bold text-primary" style="margin-right: 10px;">자주하는질문</h6>
			   
			</div>
             <!-- Card Body -->
             <div class="card-body"> 
<div class="row">
	<div class="col-md-12">
		<table class="table">
			<thead>
				<tr class="col-md-8 text-center">
					<th>번호</th>
					<th>제목</th>
					<th>작성일</th>
					
				</tr>
			</thead>
			<tbody>
<%-- 			<c:forEach items="${userList}" var="vo"> --%>
<%-- 			 <c:if test="${vo.grade != '관리자'}"> --%>
<!-- 				<tr class="col-md-8 text-center"> -->
<%-- 					<td>${vo.user_id}</td> --%>
<%-- 					<td>${vo.user_name}</td> --%>
<%-- 					<td>${vo.email}</td> --%>
<!-- 					 <td class="current-grade"> -->
<%--                   	  ${vo.grade} <c:if test="${vo.business == 1 && vo.grade != '판매자'}">[up]</c:if> --%>
<!--               		  </td> -->
<%-- 					 <td><fmt:formatDate value="${vo.last_login}" --%>
<%--                                		pattern="yyyy-MM-dd"/></td> --%>
<!--                        <td> -->
<!--                        <select> -->
<%-- 						  <option value="구매자" ${vo.grade == '구매자' ? 'selected' : '구매자'}>구매자</option> --%>
<%--     					  <option value="판매자" ${vo.grade == '판매자' ? 'selected' : '구매자'}>판매자</option>    --%>
<!--                        </select> -->
<!--                        </td > -->
<!--                        <td> -->
<%--                        <button class="btnMod btn btn-outline-dark btn-sm" data-user-id="${vo.user_id}" style="padding-bottom: 1px; padding-top: 1px;" type="button">수정</button> --%>
<!-- 					</td> -->
<!-- 				</tr> -->
<%-- 				</c:if> --%>
<%-- 			</c:forEach>	 --%>
			</tbody>
		</table>
		
		<div class="row">
		    <div class="col-md-12 text-right">
		        <a href="/hn/manager/noticeForm">
		            <button class="btnMod btn btn-outline-dark btn-sm" type="button">작성하기</button>
		        </a>
		    </div>
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
								<a  id ="page" class="page-link" href="${pageMaker.startPage - 1}">&laquo;</a>
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
            </div> <!-- card-body -->
        </div>
    </div>
</div>
 <%@ include file="/WEB-INF/views/hn/manager/include/action_form.jsp" %>
 <%@ include file="/WEB-INF/views/hn/manager/include/footer.jsp" %>