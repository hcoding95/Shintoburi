<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/hn/manager/include/bs.jsp" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
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
			<form role="form" action="/mypage/enqMod" method="post" >
			
			<div class="form-group">
					 
					<label for="user_id">
					 작성자
					</label>
					<input value="user00" type="text" class="form-control" id="user_id" name="user_id" readonly/>
					
				</div>
				 <div class="form-group">
				 
					 
					<label for="enquiry_type">
						문의 유형
					</label>
				<select class="form-select" aria-label="Default select example" id="enquiry_type" name="enquiry_type">
				    <option value="배송문의" <c:if test="${enquiryVo.enquiry_type == '배송문의'}">selected</c:if>>배송문의</option>
				    <option value="결제문의" <c:if test="${enquiryVo.enquiry_type == '결제문의'}">selected</c:if>>결제문의</option>
				    <option value="판매문의" <c:if test="${enquiryVo.enquiry_type == '판매문의'}">selected</c:if>>판매문의</option>
				    <option value="구매문의" <c:if test="${enquiryVo.enquiry_type == '구매문의'}">selected</c:if>>구매문의</option>
				    <option value="등급문의" <c:if test="${enquiryVo.enquiry_type == '등급문의'}">selected</c:if>>등급문의</option>
				</select>
				</div>	
				
				<div class="form-group">
					<label for="content">
						내용
					</label>
					<textarea rows="10" class="form-control" id="content" name="content"  > ${enquiryVo.content}</textarea>
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
			<button type="submit" class="btn btn-dark">수정완료</button>
			<button type="submit" class="btn btn-dark">ㅇㅇ</button>
		</div>
		
			 </form>
	</div>
</div>





</body>
</html>