<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/gr/delivery/include/header.jsp"%>     
<script>
$(function() {
$(".btnMod").click(function() {
       let ono = $(this).attr("data-ono");
//        let grade = $(this).closest('tr').find('select').val();
       console.log(ono);
//        console.log(grade);
       
//        let sData = {
//            "ono": ono,
//            "grade": grade
//        };

//        $.ajax({
//            type: "post",
//            url: 
//            data: JSON.stringify(sData),
//            contentType: "application/json; charset=utf-8",
//            success: function(result) {
//                if (result) {
//                    let updatedGrade = grade; // 업데이트된 등급
//                    $(this).closest('tr').find('.current-grade').text(updatedGrade);
//                    alert(grade + "로 변경 되었습니다.");
//                } else {
//                    alert("변경 실패 , 다시 시도해 주세요.");
//                }
//            }
//        });
   });
});


</script>
  
		  <!-- Card Body -->
             <div class="card-body"> 
<div class="row">
	<div class="col-md-12">
		<table class="table">
			<thead>
				<tr class="col-md-8 text-center">
					<th>주문번호</th>
					<th>수취인 이름</th>
					<th>수취인 전화번호</th>
					<th>배송지</th>
					<th>송장번호</th>
					<th>총상품금액</th>
					<th>결제금액</th>
					<th>배송상태</th>
					<th>결제일</th>
					<th>수정</th>
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
						<td> <button class="btnMod btn btn-outline-dark" data-ono="${orderDto.ono}" type="button">수정</button></td>			    
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
                <c:if test="${pageMaker.prev}">
                    <li class="page-item">
                        <a class="page-link userPage" href="${pageMaker.startPage - 1}">&laquo;</a>
                    </li>
                </c:if>
                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="v">
                    <li class="page-item ${v == pageMaker.cri.pageNum ? 'active' : ''}">
                        <a class="page-link userPage" href="${v}">${v}</a>
                    </li>
                </c:forEach>
                <c:if test="${pageMaker.next}">
                    <li class="page-item">
                        <a class="page-link userPage" href="${pageMaker.endPage + 1}">&raquo;</a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>
</div>
<!-- // Pagination -->
            </div> <!-- card-body -->
    

<%@ include file="/WEB-INF/views/gr/delivery/include/footer.jsp"%> 