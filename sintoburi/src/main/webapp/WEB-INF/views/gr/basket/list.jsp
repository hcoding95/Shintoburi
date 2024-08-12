<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/gr/include/top.jsp"%>   
    
 
 <div class="row">
	<div class="col-md-2">
	</div>
		<div class="col-md-8">
			<c:set var="user_id" value="${detailDto.user_id}" />
			 <div>
				${user_id}님의 장바구니입니다. 
			 </div>
			<table class="table">
				<thead>
					<tr class="col-md-8 text-center">
						<th>체크</th>
						<th>상품번호</th>
						<th>상품명</th>
						<th>사진</th>
						<th>개수</th>	
						<th>가격</th>
						<th>총가격</th>	
						<th>담은 날짜</th>	
					</tr>
				</thead>

				<tbody>
				<c:forEach items="${list}" var="detailDto">
					<tr class="col-md-8 text-center">
					    <td>
					    	<input type="checkbox" name="selectedItems" 
					    			value="${detailDto.bdno}"></td>
						<td>${detailDto.pno}</td>
						<td>${detailDto.name}</td>
						<td>${detailDto.img_path}</td>
						<td>
						<input type="text" id="p_count" name="p_count" value="${detailDto.p_count}">
						<button type="button" id ="btnp_count" name="btnp_count">수정</button>
						</td>	
						<td>${detailDto.price}</td>
						<td>${detailDto.total_price}</td>
						<td><fmt:formatDate value="${detailDto.put_date}"
                                		pattern="yyyy-MM-dd"/></td> 
					</tr>
				</c:forEach>	
				</tbody>
			</table>
		<div class="container-fluid">
	
	
	<div class="row">
<!-- 		<div class="col-md-10"> -->
<!-- 		</div> -->
		
		<div class="col-md-2">
<!-- 			<a href="http://localhost/gr/basket/remove"> -->
			<button type="button" class="btn btn-outline-dark">삭제하기</button>
<!-- 			</a> -->
		</div>
		
		<div class="col-md-2">
<!-- 			<a href="http://localhost/gr/basket/remove"> -->
			<button type="button" class="btn btn-outline-dark">주문하기</button>
<!-- 			</a> -->
		</div>
		
		<div class="col-md-2">
<!-- 			<a href="http://localhost/gr/basket/remove"> -->
			<button type="button" class="btn btn-outline-dark">장바구니 비우기</button>
<!-- 			</a> -->
		</div>
		
	</div>
</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
 
 
 
    
    
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<!-- </head> -->
<!-- <body> -->
<%-- ${list} --%>
<!-- </body> -->
</html>
<%@ include file="/WEB-INF/views/gr/include/bottom.jsp"%>