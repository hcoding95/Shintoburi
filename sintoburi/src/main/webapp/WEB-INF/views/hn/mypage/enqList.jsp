<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

 <%@ include file="/WEB-INF/views/include/top.jsp" %>


<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<table class="table">
				<thead>
					<tr class="col-md-8 text-center">
						<th>번호</th>
						<th>상품정보</th>
						<th>제목</th>
						<th>작성일</th>
						<th>답변상태</th>	
						
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="vo">
					<tr class="col-md-8 text-center">
						<td>${vo.eno}</td>
						<td>상품</td>
						<td><a href="http://localhost/hn/mypage/enqRead?eno=${vo.eno}">${vo.enquiry_type}</a></td>
						<td><fmt:formatDate value="${vo.write_date}"
                                		pattern="yyyy-MM-dd"/></td>
                      
                       <td>${vo.status}</td>
                     
					</tr>
				</c:forEach>	
				</tbody>
			</table>
		<div class="container-fluid">
	<div class="row">
		<div class="col-md-10">
		</div>
		<div class="col-md-2">
			<a href="http://localhost/hn/mypage/enqRegisterForm"><button type="button" class="btn btn-outline-dark">1:1문의하기</button></a>
		</div>
	</div>
</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>



 <%@ include file="/WEB-INF/views/include/bottom.jsp" %>