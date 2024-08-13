<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/top.jsp" %>

<script>
$(function() {
	/*
    $('#btnUpload').click(function(e) {
    	console.log(e);
    	let files = e.originalEvent.dataTransfer.files;
        var formData = new FormData();
    	formData.append("uploadFiles", files[0]);
//         formData.append('uploadFiles', $('#file').val());
//         formData.append('productImg', $('#productImg')[0].files[0]);

        $.ajax({
            url: '/product/addProduct',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success: function(response) {
                alert('업로드 성공');
            },
            error: function(xhr, status, error) {
                alert('업로드 오류 발생');
            }
        });
    });
	*/
	
	$("#frmRegister").submit(function() {
		let pro = document.getElementById("productImg");
		console.log(pro.value);
		let path = pro.value;
		let name = path.substring(path.lastIndexOf("\\") + 1);
		
		console.log(name);
		return true;
	});
});
</script>    

<!-- 등록 폼 -->
<div class="row justify-content-center pt-5 mt-5">
    <div class="col-md-6">
        <form id="frmRegister" action="/product/addProduct" method="post" role="form" encType="multipart/form-data">
        	<!-- product name -->
            <div class="form-group">
                <label for="name">상품 이름</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="상품 이름 입력"/>
            </div>
            
            <!-- product content -->
            <div class="form-group">
                <label for="content">상품 내용</label>
                <textarea class="form-control" rows="3" id="content" name="content" placeholder="상품 내용 입력"></textarea>
            </div>
            
            <!-- product price -->
            <div class="form-group">
                <label for="price">상품 가격</label>
                <input type="number" class="form-control" id="price" name="price" placeholder="상품 가격 입력"/>
            </div>
            
            <!-- product stock -->
            <div class="form-group">
                <label for="stock">상품 재고수량</label>
                <input type="number" class="form-control" id="stock" name="stock" placeholder="상품 재고 입력"/>
            </div>
            
            <!-- product status -->
            <div>
		        <label for="status">상품 판매 상태:</label><br>
		        <input type="radio" id="statusY" name="status" value="Y" checked>
		        <label for="statusY">판매 중</label><br>
		        <input type="radio" id="statusN" name="status" value="N">
		        <label for="statusN">판매 중지</label>
		    </div>
            
            <!-- product cate -->
            <div class="form-group">
                <label for="cate_no">상품 카테고리</label>
                <select class="form-control form-control-lg" id="cate_no" name="cate_no">
		            <option value="1">쌀</option>
		            <option value="2">잡곡</option>
		            <option value="3">과일</option>
		            <option value="4">채소</option>
		        </select>
            </div>
            
            <!-- product img -->
            <div class="form-group">
             	<label for="productImg">상품 사진</label>
                <input type="file" class="form-control-file" id="productImg" name="productImg" />
            </div>
            
            
            <button type="submit" class="btn btn-primary" id="btnUpload">상품 등록 완료</button>
            
        </form>
    </div>
</div>



<%@ include file="../include/bottom.jsp" %>

