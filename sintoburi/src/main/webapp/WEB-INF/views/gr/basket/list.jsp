<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/gr/include/top.jsp"%>   

    
<script>
$(function() {
	//개수 수정
	$(".btnp_count").click(function(){
		let bdno =$(this).attr("data-bdno");
		let p_count=$(".p_count").val().trim();
		//console.log("bdno:", bdno);
		//console.log("p_count:", p_count);	
		
		let sData = {
				"bdno" : bdno,
				"p_count" : p_count
		};
		//console.log("sData:", sData);
		
		$.ajax({
			type: "post",
			url : "/gr/basket/modCount",
			data : JSON.stringify(sData),
			contentType: "application/json; charset=utf-8",
			 success: function(result) {
				 if (result) {
	                    let modCount = p_count; // 업데이트
	                    $(".p_count").text(modCount);
	                    alert("수정 완료");
	                } else {
	                    alert("수정 실패");
	                }
	            }
		});
	});
	
	//체크한 것 삭제
	$("#btnRemoveOne").click(function(){
		let bdnos = [];
		let checkedItems = $("[name=selectedItems]:checked");
		$.each(checkedItems, function(idx, val) {
			let bdno = checkedItems.eq(idx).val();
			//console.log("bdno:", bdno);
			bdnos.push(bdno);
		});
		//console.log("bdnos:", bdnos);
		
		let sData = {
				"bdnos" : bdnos
		};
		$.ajax({
			type: "post",
			url : "/gr/basket/removeOne",
			data : JSON.stringify(sData),
			contentType: "application/json; charset=utf-8",
			 success: function(result) {
				 //console.log("result:", result);
				 if (result) {
	                    alert("삭제 완료");
	                    location.reload();
	                } else {
	                    alert("삭제 실패");
	                }
	            }
		});
	});

	//모두 삭제, 장바구니 삭제
	$("#btnRemoveAll").click(function(){
// 	    let bno = 1;
// 	    console.log("bno:", bno);
// 	    let sData = {
// 	        "bno": bno
// 	    };
	    
	    $.ajax({
	        type: "POST",
	        url: "/gr/basket/removeAll",
// 	        data: JSON.stringify(sData),
// 	        contentType: "application/json; charset=utf-8",
	        success: function(result) {
	            if (result) {
	                alert("삭제 성공");
	                location.reload();
	            } else {
	                alert("삭제 실패");
	            }
	        }
	    });
	
	});
	
	//장바구니 담기
	
	
	
	
	//주문하기
	$("#btnOrder").click(function(){
		let bdnos = [];
		let checkedItems = $("[name=selectedItems]:checked");
		$.each(checkedItems, function(idx, val) {
			let bdno = checkedItems.eq(idx).val();
			//console.log("bdno:", bdno);
			bdnos.push(bdno);
		});
		//console.log("bdnos:", bdnos);
		
		let sData = {
				"bdnos" : bdnos
		};
	
	});
	
});
</script>
<%-- ${list} --%>

 <div class="row">
	<div class="col-md-2">
	</div>
		<div class="col-md-8">
			<c:set var="user_id" value="${detailDto.user_id}" />
			 <div>
				${login.user_id}님의 장바구니입니다. 
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

				<tbody >
				<c:forEach items="${list}" var="detailDto">
					<tr class="col-md-8 text-center">
					    <td>
					    	<input type="checkbox" name="selectedItems" 
					    			value="${detailDto.bdno}"></td>
						<td>${detailDto.pno}</td>
						<td>${detailDto.name}</td>
						<td>${detailDto.img_path}</td>
						<td>
						<input type="text" class="p_count" value="${detailDto.p_count}">
						<button type="button" class="btnp_count" data-bdno="${detailDto.bdno}">수정</button>
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
	
	
	<div class="row justify-content-end">
    <div class="col-auto">
        <a href="http://localhost/gr/basket/orderForm">
            <button type="button" id="btnOrder" name="btnOrder" class="btn btn-warning">주문하기</button>
        </a>
    </div>

    <div class="col-auto">
        <button type="button" id="btnRemoveOne" name="btnRemoveOne" class="btn btn-danger" >삭제하기</button>
    </div>

    <div class="col-auto">
        <button type="button" id="btnRemoveAll" name="btnRemoveAll" class="btn btn-secondary">장바구니 비우기</button>
    </div>
	</div>
	
	</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
 
</html>
<%@ include file="/WEB-INF/views/gr/include/bottom.jsp"%>