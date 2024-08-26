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
				${login.user_id}님의 주문서입니다. 주문번호를 누르면 상세 내역을 볼 수 있습니다. 
			 </div>
			 
			<table class="table">
				<thead>
					<tr class="col-md-8 text-center">
						<th>주문번호</th>
						<th>수취인 이름</th>
						<th>수취인 전화번호</th>
						<th>배송지</th>
						<th>결제방법</th>
						<th>총상품금액</th>
						<th>배송비</th>
						<th>결제금액</th>
						<th>결제상태</th>
					</tr>
				</thead>

				<tbody>
				<c:forEach items="${orderList}" var="orderDto">
					<tr class="col-md-8 text-center">
					    <td><a href="http://localhost/gr/order/detail/${orderVo.ono}">${orderVo.ono}</a></td>
						<td>${orderVo.user_name}</td>
						<td>${orderVo.user_phone}</td>
						<td>${orderVo.address}</td>
						<td>${orderVo.payment_type}</td>
						<td>${orderVo.sum_total}</td>
						<td>${orderVo.delivery_charge}</td>
						<td>${orderVo.pay_amount}</td>
						<td>${orderVo.payment_state}</td>
						<td><button type="button" id="btnPayment" name="btnPayment" class="btn btn-warning">결제</button></td>
					</tr>
				</c:forEach>
					
				</tbody>
			</table>
									
		</div>
		
		<div class="col-md-2">
		</div>
	</div>

<%@ include file="/WEB-INF/views/gr/include/action_form.jsp" %>
<%@ include file="/WEB-INF/views/gr/include/bottom.jsp"%>