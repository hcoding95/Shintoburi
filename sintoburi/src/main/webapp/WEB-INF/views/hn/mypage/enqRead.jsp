<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ include file="/WEB-INF/views/include/top.jsp" %>
  <%@ include file="/WEB-INF/views/hn/mypage/include/myPageSide.jsp" %>
<script>
$(function() {
	// 수정버튼
	$("#btnMod").click(function () {
		$(".editable").prop("readonly", false);
		$(".sEditable").prop("disabled", false);
		$(this).hide();
		$(this).next().show();
	});

	// 삭제폼전송
	$("#btnDel").click(function () {
		 if (confirm("삭제하시겠습니까?")) {
	            // 확인 버튼 클릭 시 삭제 폼 제출
	            $("#frmDel").submit();
	        }
	});
	
	  $("#enqModForm").submit(function(e) {
	        e.preventDefault(); 
	        
	        let formData = new FormData(this); 

	        $.ajax({
	            type: "post",
	            url: $(this).attr("action"),
	            data: formData,
	            contentType: false,
	            processData: false,
	            success: function(response) {
	                
	                alert("문의사항이 수정되었습니다.");
	                
	                window.location.href = '/hn/mypage/enqList'; 
	            },
	            error: function(xhr, status, error) {
	                // 요청이 실패한 경우
	                console.error("등록 실패:", xhr.responseText);
	                alert("등록 실패. 다시 시도해 주세요.");
	            }
	        });
	    });
	 
});
 
</script>

	<div id="page-content-wrapper">
		<div class="container-fluid">
		    <div class="row">
		        <div class="col-md-12">
		           <form id="enqModForm" role="form" action="/hn/mypage/enqMod" method="post" enctype="multipart/form-data">
		          	 <input type="hidden" name="eno" value="${enquiryVo.eno}"/>
						    <div class="form-group">
						        <label for="user_id">작성자</label>
						        <input value="${enquiryVo.user_id}" type="text" class="form-control editable" id="user_id" name="user_id" readonly />
						    </div>
						    <div class="form-group">
						        <label for="enquiry_type">문의 유형</label>
						        <select class="form-select sEditable" aria-label="Default select example" id="enquiry_type" name="enquiry_type" disabled>
						            <option value="상품문의" <c:if test="${enquiryVo.enquiry_type =='상품문의'}">selected</c:if>>상품문의</option>
						            <option value="배송문의" <c:if test="${enquiryVo.enquiry_type =='배송문의'}">selected</c:if>>배송문의</option>
						            <option value="결제문의" <c:if test="${enquiryVo.enquiry_type =='결제문의'}">selected</c:if>>결제문의</option>
						            <option value="등급문의" <c:if test="${enquiryVo.enquiry_type =='등급문의'}">selected</c:if>>등급문의</option>
						        </select>
						    </div>
						    <div class="form-group">
						        <label for="content">내용</label>
						        <textarea rows="10" class="form-control editable" id="content" name="content" readonly>${enquiryVo.content}</textarea>
						    </div>
						    
						    
						    <!-- 첨부파일 리스트 -->
							<div class="form-group" id="uploadedList">
							<c:forEach items="${enquiryVo.imageList}" var="vo">
								<li>
									<img src="/hn/manager/display?fileName=${vo.upload_path}/${vo.uuid}_${vo.image_name}"/>
								</li>
							</c:forEach>
							</div>
						    
						    
						    <div class="row">
						        <div class="col-md-12 text-right">
						     <c:if test="${enquiryVo.status != '처리완료' && enquiryVo.status != '답변완료'}">
					            <button id="btnMod" type="button" class="btn btn-warning btn">수정</button>
					            <button id="btnModOk" type="submit" class="btn btn-warning btn-submit" style="display:none">수정완료</button>
					            <button id="btnDel" type="button" class="btn btn-danger btn">삭제</button>
					        </c:if>
					        <c:if test="${enquiryVo.status == '처리완료' || enquiryVo.status == '답변완료'}">
					           <button type="button" class="btn btn-success btn" onclick="window.location.href='/hn/mypage/enqList'">답변이 완료되었습니다</button>
							
					        </c:if>	
						        </div>
						    </div>
						</form>
			            <!-- 삭제 폼 -->
						<form id="frmDel" action="/hn/mypage/enqDel" method="post">
							<input type="hidden" name="eno" value="${enquiryVo.eno}"/>
						</form>
						<!-- // 삭제 폼 -->
	              </div>
	          </div>
		</div>
	</div>
 <%@ include file="/WEB-INF/views/include/bottom.jsp" %>