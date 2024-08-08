<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="/WEB-INF/views/hn/manager/include/header.jsp" %>
<%@ include file="/WEB-INF/views/hn/manager/include/bs.jsp" %>

<script>

$(function() {
	var eno = '${enquiryVo.eno}'; 

	// 문의사항 데이터 가져오기
    $.ajax({
        type: "get",
        url : "/hn/manager/enquiryDetail/" + eno,
        contentType: "application/json; charset=utf-8",
        success : function(enquiryVo) {
         
 
          
        }
    });
	
	
	// 문의사항 답변 등록하기
	$("#btnReplyRegister").click(function() {
		console.log("Dd");
		
	});

 
});
</script>


</script>

 <!-- Content Row -->

 <div class="row">

     <!-- Area Chart -->
     <div class="col-xl-12 col-lg-12">
         <div class="card shadow mb-4">
             <!-- Card Header - Dropdown -->
             <div
                 class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                 <h6 class="m-0 font-weight-bold text-primary">문의 사항</h6>
                 
             </div>
             <!-- Card Body -->
             <div class="card-body"> 

<div class="row">
	<div class="col-md-12">
		
		<div class="container-fluid">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-12">
            <form id="enquiryForm" role="form" action="/mypage/" method="post">
                <div class="form-group">
                    <label for="user_id">작성자</label>
                    <input value="${enquiryVo.user_id}" type="text" class="form-control" id="user_id" name="user_id" readonly>
                </div>
                <div class="form-group">
                    <label for="enquiry_type">문의 유형</label>
                    <select class="form-select" id="enquiry_type" name="enquiry_type" disabled>
                        <option value="상품문의" <c:if test="${enquiryVo.enquiry_type =='상품문의'}">selected</c:if>>상품문의</option>
                        <option value="배송문의" <c:if test="${enquiryVo.enquiry_type =='배송문의'}">selected</c:if>>배송문의</option>
                        <option value="결제문의" <c:if test="${enquiryVo.enquiry_type =='결제문의'}">selected</c:if>>결제문의</option>
                        <option value="등급문의" <c:if test="${enquiryVo.enquiry_type =='등급문의'}">selected</c:if>>등급문의</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="content">내용</label>
                    <textarea class="form-control" id="content" name="content" rows="10" readonly>${enquiryVo.content}</textarea>
                </div>
                
                    <label for="image">이미지</label>
                    <input type="image"  id="image" name="image">
               
            </form>
        </div>
        <div class="col-md-2"></div>
    </div>
</div>
		
		
		
	</div>
</div>
            </div> <!-- card-body -->
        </div>
    </div>
</div>



<div class="row">

     <!-- Area Chart -->
     <div class="col-xl-12 col-lg-12">
         <div class="card shadow mb-4">
           
             <div class="card-body"> 

<div class="row">
	<div class="col-md-12">

				
				
				<!-- 답변 입력 -->
				
				<div class="row my-2">
					<div >
					
					<textarea rows="7" class="form-control" id="content" name="content" ></textarea>
					</div>
					
				
					<div class="col-md-2" style="top: 20px">
						<button id="btnReplyRegister" type="button" class="btn btn-outline-dark">답변 등록</button>
					</div>
				</div>
				<!-- // 답변 입력 -->
				
				<div class="row my-3">
					<div class="col-md-12">
						<table class="table" id="reply_table">
							
						</table>
					</div>
				</div>
				
				<!-- // 답변 -->
	</div>
</div>
            </div> <!-- card-body -->
        </div>
    </div>
</div>


 <%@ include file="/WEB-INF/views/hn/manager/include/footer.jsp" %>