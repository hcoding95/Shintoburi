<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/gr/delivery/include/header.jsp"%>     
    
   <div class="col-md-8">
		   <form action="#" method="post">
						 
			<table class="table">
				<thead>
					<tr class="col-md-8 text-center">
						<th>주문번호</th>
						<th>수취인 이름</th>
						<th>수취인 전화번호</th>
						<th>배송지</th>
						<th>총상품금액</th>
						<th>배송비</th>
						<th>결제금액</th>
						<th>배송상태</th>
						<th>결제일</th>
					</tr>
				</thead>

				<tbody>
				<c:forEach items="${deliveryList}" var="orderDto">
				    <tr class="col-md-8 text-center">
				        <td><a href="http://localhost/gr/order/detail/${orderDto.ono}">${orderDto.ono}</a></td>
				        <td>${orderDto.user_name}</td>
				        <td>${orderDto.user_phone}</td>
				        <td>${orderDto.address}</td>
				        <td>${orderDto.sum_total}</td>
				        <td>${orderDto.delivery_charge}</td>
				        <td>${orderDto.pay_amount}</td>
				        <td>
				            <select name="delivery_status_${orderDto.ono}">
				                <option value="배송전" ${orderDto.delivery_status == '배송전' ? 'selected' : ''}>배송전</option>
				                <option value="배송준비중" ${orderDto.delivery_status == '배송준비중' ? 'selected' : ''}>배송준비중</option>
				                <option value="배송중" ${orderDto.delivery_status == '배송중' ? 'selected' : ''}>배송중</option>
				                <option value="배송완료" ${orderDto.delivery_status == '배송완료' ? 'selected' : ''}>배송완료</option>
				            </select>
				        </td>
				        <td><fmt:formatDate value="${orderDto.order_date}" pattern="yyyy-MM-dd"/></td>
				    </tr>
				</c:forEach>
					
				</tbody>
			</table>
		</form>							
		</div> 
    

<%@ include file="/WEB-INF/views/gr/delivery/include/footer.jsp"%> 