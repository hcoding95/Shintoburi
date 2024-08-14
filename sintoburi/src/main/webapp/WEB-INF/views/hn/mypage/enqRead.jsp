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
		$("#frmDel").submit();
	});
	 
});
  
</script>
	<div id="page-content-wrapper">
		<div class="container-fluid">
		    <div class="row">
		        <div class="col-md-12">
		           <form role="form" action="/hn/mypage/enqMod" method="post" enctype="multipart/form-data">
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
						    <div class="form-group">
						        <label for="image">첨부파일</label>
						        <input class="form-control editable" type="file" id="image" name="image">
						    </div>
						    <div class="row">
						        <div class="col-md-12 text-end">
						            <button id="btnMod" type="button" class="btn btn-warning btn-submit">수정</button>
						            <button id="btnModOk" type="submit" class="btn btn-warning btn-submit" style="display:none">수정완료</button>
						            <button id="btnDel" type="button" class="btn btn-danger btn-submit">삭제</button>
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