<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="/WEB-INF/views/hn/manager/include/header.jsp" %>
<%@ include file="/WEB-INF/views/hn/manager/include/bs.jsp" %>

<script>

$(function() {

    $.ajax({
        type: "get",
        url : "/hn/manager/enquiryDetail/" + eno,
        contentType: "application/json; charset=utf-8",
        success : function(enquiryVo) {
            console.log(enquiryVo);
         
            $('#user_id').val(enquiryVo.user_id); 
            $('#enquiry_type').val(enquiryVo.enquiry_type); 
            $('#content').val(enquiryVo.content); 
          
        }
    });

 
});
</script>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-12">
            <form id="enquiryForm" role="form" action="/mypage/" method="post">
                <div class="form-group">
                    <label for="user_id">작성자</label>
                    <input type="text" class="form-control" id="user_id" name="user_id" readonly>
                </div>
                <div class="form-group">
                    <label for="enquiry_type">문의 유형</label>
                    <select class="form-select" id="enquiry_type" name="enquiry_type">
                        <option value="배송문의">배송문의</option>
                        <option value="결제문의">결제문의</option>
                        <option value="판매문의">판매문의</option>
                        <option value="구매문의">구매문의</option>
                        <option value="등급문의">등급문의</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="content">내용</label>
                    <textarea class="form-control" id="content" name="content" rows="10"></textarea>
                </div>
                <div class="form-group">
                    <label for="image">이미지 업로드</label>
                    <input type="file" class="form-control-file" id="image" name="image">
                </div>
            </form>
        </div>
        <div class="col-md-2"></div>
    </div>
</div>



 <%@ include file="/WEB-INF/views/hn/manager/include/footer.jsp" %>