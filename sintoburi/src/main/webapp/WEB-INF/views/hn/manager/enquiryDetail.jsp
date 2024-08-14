<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/hn/manager/include/header.jsp" %>

<script>

$(function() {
	let eno = '${enquiryVo.eno}'; 
	let status = '${enquiryVo.status}';
    let replyContent = '${replyVo.reply_content}';
	
	// 문의사항 데이터 가져오기
    $.ajax({
        type: "get",
        url : "/hn/manager/enquiryDetail/" + eno,
        contentType: "application/json; charset=utf-8",
        success : function(rData) {
 

        	 if (status === '답변완료') {
                 $("#replyContent").val(replyContent).prop("readonly", true);
                 $("#btnReplyRegister").hide(); // 답변 등록 버튼 숨기기
             } else {
                 $("#replyContent").prop("readonly", false);
                 $("#btnReplyRegister").show(); // 답변 등록 버튼 보이기
                 $("#btnReplyMod").hide();
             }
        }
    });
	
	// 문의사항 답변 등록하기
	$("#btnReplyRegister").click(function() {
		
		let reply_Content = $("#replyContent").val(); 
	    let eno = '${enquiryVo.eno}'; 
	    let user_id = '${enquiryVo.user_id}'; 
	    let manager_id = 'manager';
		
		let sData = {
				"eno": eno,
		        "user_id": user_id,
		       	"reply_content": reply_Content,
		        "manager_id": manager_id
	        };

		
		$.ajax({
			type: "post",
			url : "/hn/reply/registerReply",
			data : JSON.stringify(sData),
			contentType: "application/json; charset=utf-8",
			success : function(rData) {
				console.log(rData);
				console.log(sData);
			    
				$.ajax({
				  	 type: "post",
                     url: "/hn/manager/updateStatus",
                     data: { eno: eno },
                     success: function() {
                         alert("문의사항 상태가 '답변완료'로 업데이트되었습니다.");
                        
                         location.href = "/hn/manager/goodsEnqList";
                     }
			
				});
				
			}
		});
	});
		
	

 
});
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
		
		<div >
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-12">
           
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
                    <input type="file"  id="image" name="image">
               
          
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

					<div class="form-group">
					    <label for="content">답변</label>
					    <textarea class="form-control" id="replyContent" name="replyContent" rows="5"
					    <c:if test="${enquiryVo.status == '답변완료'}">readonly</c:if>
					    ><c:if test="${enquiryVo.status == '답변완료'}">${replyVo.reply_content}</c:if></textarea>
					</div>
					<div class="col-md-2" style="padding-left: 0px;">
					    <button id="btnReplyRegister" type="button" class="btn btn-outline-dark"
					        <c:if test="${enquiryVo.status == '답변완료'}">disabled</c:if>>답변 등록</button>
					    <button id="btnSave" type="button" class="btn btn-outline-success" style="display: none;">저장</button>
					</div>
						
				<!-- // 답변 입력 -->
	</div>
</div>
            </div> <!-- card-body -->
        </div>
    </div>
</div>


 <%@ include file="/WEB-INF/views/hn/manager/include/footer.jsp" %>