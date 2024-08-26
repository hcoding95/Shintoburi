<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/gr/include/top.jsp"%> 
<script>

</script> 

<div class="row">
	<div class="col-md-2">
	</div>
		<div class="col-md-8">
			
			<c:set var="user_id" value="${detailDto.user_id}" />
			 <div>
				${login.user_id}님의 주문 상세내역입니다.
			 </div>
			 
			<table class="table">
				<thead>
					<tr class="col-md-8 text-center">
						<th>상품번호</th>
						<th>상품이름</th>
						<th>상품이미지</th>
						<th>상품개수</th>	
						<th>상품가격</th>	
						<th>배송상태</th>
						<th>주문날짜</th>
					</tr>
				</thead>

				<tbody>
				<c:forEach items="${detailList}" var="orderDetailDto">
					<tr class="col-md-8 text-center">
<%-- 					    <td><a href="http://localhost/gr/order/form">${orderDetailDto.odno} </a></td> --%>
						<td>${orderDetailDto.pno}</td>
						<td>${orderDetailDto.name}</td>
						<td>${orderDetailDto.img_path}</td>
						<td>${orderDetailDto.p_count}</td>
						<td>${orderDetailDto.price}</td>
						
						<td>${orderDetailDto.delivery_status}</td>
						<td><fmt:formatDate value="${orderDetailDto.order_date}" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
					
				</tbody>
			</table> 
			
									
		<div class="container-fluid">
			<div class="row justify-content-end">
			    <div class="col-auto">
			        <a href="http://localhost/gr/order/order_list">
			            <button type="button" id="btnDetail" name="btnDetail" class="btn btn-warning">주문하기</button>
			        </a>
			    </div>
			    
			</div>
		</div>
		</div>
		
		
		<div class="col-md-2">
	
		</div>
		
	
	</div>
<%@ include file="/WEB-INF/views/gr/include/action_form.jsp" %>
<%@ include file="/WEB-INF/views/gr/include/bottom.jsp"%>
