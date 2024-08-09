<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/hn/manager/include/bs.jsp" %>
<%@ include file="/WEB-INF/views/include/top.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<script>

$(function() {
    $("#enquiry_type").on("change", function() {
        var selectedValue = $(this).val();
        var textarea = $("#content");

        if (selectedValue === "등급문의") {
            textarea.attr("placeholder", "판매자로 권한 요청 시 사업자 번호 or 사업자등록증을 첨부해주세요.");
        } else {
            textarea.attr("placeholder", "");
        }
    });
});

</script>


<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<h3 class="container text-center">
				1:1 문의사항
			</h3>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<form role="form" action="/mypage/" method="post" >
			
			<div class="form-group">
					 
					<label for="user_id">
					 작성자
					</label>
					<input value="user00" type="text" class="form-control" id="user_id" name="user_id" readonly/>
					
				</div>
				 <div class="form-group">
				 
					 
					<label for="content">
						문의 유형
					</label>
				<select class="form-select" aria-label="Default select example" id="enquiry_type" name="enquiry_type">
						<option value="상품문의">상품문의</option>
                        <option value="배송문의">배송문의</option>
                        <option value="결제문의">결제문의</option>
                        <option value="등급문의">등급문의</option>
			</select>
				</div>	
				
				<div class="form-group">
					<label for="content">
						내용
					</label>
					<textarea rows="10" class="form-control" id="content" name="content" ></textarea>
			</div>
			
			<div class="form-group">
 			 <label for="formFile" class="form-label"></label>
 			 <input class="form-control" type="file" id="image" name="image">
			</div>
		
		<div class="col-md-2">
		</div>
	</div>
	<div class="row">
		<div class="col-md-9">
		</div>
		<div class="col-md-3">
			<button type="submit" class="btn btn-dark">작성완료</button>
		</div>
			 </form>
	</div>
</div>

 <%@ include file="/WEB-INF/views/include/bottom.jsp" %>