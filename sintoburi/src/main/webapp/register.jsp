<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="/WEB-INF/views/include/header.jsp" %>
<link href="/resources/css/attach.css" rel="stylesheet">

<script>


$(function() {
	let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	// -> run.exe, smile.zip, ....
	let maxSize = 5242880; // 5MB
	
	function showImage(fileCallPath) {
		console.log("showImage...:", fileCallPath);
		
		$(".bigPictureWrapper").css("display", "flex").show();
		$(".bigPicture").html(`<img src="/display?fileName=\${fileCallPath}">`)
						.animate({
							width: "100%",	
							height: "100%"
						}, 1000, function() {
							// 애니메이션 종료 후 실행 되는 콜백
							alert("이미지 보이기 완료");
						});
						
		setTimeout(function() {
			$(".bigPicture").animate({
					width: "0%",	
					height: "0%"
			}, 1000);
			$(".bigPictureWrapper").fadeOut(1000);
			
		}, 2000);
		
						
	}
	
	function uploadFiles(files) {
		// <form>
		let formData = new FormData();
	
		for (let i = 0; i < files.length; i++) {
			let fileName = files[i].name;
			let fileSize = files[i].size;
			if (!checkExtension(fileName, fileSize)) {
				return false;
			}
			// <input type="file" name="uploadFile" >
			formData.append("uploadFile", files[i]);
		}
		
		console.log(formData);
		
		// 비동기 전송
		// contentType:false, processData:false - multipart/form-data
		$.ajax({
			type: "post",
			url: "/uploadFormAction",
			contentType: false, // "application/json; chartset=utf-8" // x
			processData: false, // &name=hong&age=20 // x
			data: formData,
			success: function(rData) {
				console.log(rData); // List<AttachFileDto>
				$.each(rData, function(index, obj) {
					let imgTag;
					let fileName = `\${obj.uploadPath}/\${obj.uuid}_\${obj.fileName}`;
					if (!obj.image) {
						imgTag = `<a href='/download?fileName=\${obj.uploadPath}/\${obj.uuid}_\${obj.fileName}'>
									<img src='/resources/default.png' width='100'></a>`;
					} 
					else {
						let path = obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName;
						let callPath = obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName;
						imgTag = `<img class="imgImage" src="/display?fileName=\${path}" 
									data-callpath="\${callPath}">`;
					}
					
					let liTag = `<li
									data-filename="\${obj.fileName}"
									data-uploadpath="\${obj.uploadPath}"
									data-uuid="\${obj.uuid}"
									data-image="\${obj.image}"	
									>\${imgTag} <br>\${obj.fileName} <span style="cursor:pointer;"
									data-filename="\${fileName}">&times;</span></li>`;
					$("#uploadedList").append(liTag);
				});
			}
		}); // $.ajax({
	}
	
	function checkExtension(fileName, fileSize) {
		if (fileSize > maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
		
		if (regex.test(fileName)) {
			alert("해당 파일 종류는 업로드 할 수 없습니다.");
			return false;
		}
		
		return true;
	}
	
	$("#divDrop").on("dragenter dragover", function(e) {
		e.preventDefault();
	});
	
	$("#divDrop").on("drop", function(e) {
		e.preventDefault();
		console.log(e.originalEvent.dataTransfer.files);
		let files = e.originalEvent.dataTransfer.files;
		uploadFiles(files);
	});
	
	// 업로드된 파일 중 이미지인 경우 - 이미지 클릭
	$("#uploadedList").on("click", ".imgImage", function() {
		let callPath = $(this).data("callpath"); // data-callpath
		showImage(callPath);
	});
	
	// 첨부파일 삭제
	$("#uploadedList").on("click", "li > span", function() {
		let that = $(this);
	  	let filename = that.data("filename");
		let sData = {fileName: filename};
		console.log("sData:", sData);
		$.ajax({
			type: "delete",
			url: "/delete",
			data: sData,
			success: function(rData) {
				console.log(rData); // success
				that.parent().fadeOut(1000); // <li>
			}
		});
	});
	
	// 등록폼 전송
	$("#frmRegister").submit(function() {
		$("#uploadedList > li").each(function(i) {
			let fileName = $(this).data("filename");
			let uploadPath = $(this).data("uploadpath");
			let uuid = $(this).data("uuid");
			let image = $(this).data("image");
			
			let inputTag = `<input type="hidden" name="attachList[\${i}].fileName" value="\${fileName}">
							 <input type="hidden" name="attachList[\${i}].uploadPath" value="\${uploadPath}">
							 <input type="hidden" name="attachList[\${i}].uuid" value="\${uuid}">
							 <input type="hidden" name="attachList[\${i}].image" value="\${image == true ? 'I' : 'F'}">`;
			
			$("#frmRegister").prepend(inputTag);
		});
// 		return false; // 폼전송 안함
	});
	
	
});
</script>

	
	
        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">글작성</h1>
        
        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">글작성입니다.</h6>
            </div>
            <div class="card-body">
                <div class="row">
					<div class="col-md-12">
						<form id="frmRegister" role="form" action="/board/register" method="post">
							<div class="form-group">
								 
								<label for="title">
									글제목
								</label>
								<input type="text" class="form-control" id="title"
									name="title" />
							</div>
							<div class="form-group">
								 
								<label for="content">
									글내용
								</label>
								<textarea class="form-control" id="content"
									name="content"></textarea>
							</div>
							<div class="form-group">
								 
								<label for="writer">
									작성자
								</label>
								<input type="text" class="form-control" id="writer"
									name="writer" value="${login.user_id}" readonly/>
							</div>
							
							
							<button type="submit" class="btn btn-primary">
								작성완료
							</button>
						</form>
					</div>
				</div>
            </div>
        </div>
        
        <!-- 첨부 파일 -->
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">첨부파일</h6>
	</div>
	<div class="card-body">
		<div class="row">
			<div class="col-md-12">

				<div id="divDrop" onclick="showImage('a');">업로드할 파일을 드래그 &amp;
					드롭하세요.</div>
				<ul id="uploadedList">

				</ul>

			</div>
		</div>
	</div>
</div>
<!-- /첨부 파일 -->
    </div>
    <!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>            