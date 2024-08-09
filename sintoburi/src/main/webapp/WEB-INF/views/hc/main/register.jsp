<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<head>
    <meta charset="UTF-8">
    <title>작성창</title>
    
<script type="text/javascript">



</script>
   <style>
        body {
            display: flex;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            height: 100vh;
            box-sizing: border-box;
            background-color: white;
        }
        .main {
            display: flex;
            flex-direction: row;
            width: 100%;
            box-sizing: border-box;
        }
       
       
        .side-bar {
            width: 40%;
            border-left: 1px solid black;
            display: flex;
            flex-direction: column;
            padding: 10px;
            box-sizing: border-box;
            background-color: #F2F2F2;
        }
        
        .profile img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
        }
        .content {
            flex-grow: 1;
            margin-bottom: 10px;
        }
        .comments {
            display: flex;
            flex-direction: column;
        }
        .comment-input {
    display: flex;
    align-items: center;  /* 버튼과 텍스트가 중앙에 맞춰지도록 */
    width: 100%;
    border: 1px solid black;
    box-sizing: border-box;
    padding: 10px;
    background-color: white;
    border-radius: 10px;
}

.comment-input textarea {
    flex-grow: 1;  /* textarea가 가능한 모든 공간을 차지하도록 설정 */
    height: 30px; /* 초기 높이 설정 */
    max-height: 90px; /* 최대 3줄 높이 */
    overflow-y: auto; /* 3줄 이상일 때 스크롤 표시 */
    resize: none; /* 사용자가 크기 조절 불가 */
    padding: 5px;
    margin-right: 10px;
    box-sizing: border-box;
    border: 1px solid #ddd;
    border-radius: 5px;
}

.comment-input button {
    height: auto; /* 버튼 높이를 textarea 높이에 맞추도록 설정 */
    padding: 5px 10px;
    box-sizing: border-box;
    flex-shrink: 0; /* 버튼이 줄어들지 않도록 설정 */
}
        .image-area {
            position: relative;
            width: 60%;
            height: 90vh; /* 높이를 전체 화면 높이로 설정 */
            display: flex;
            max-width: 800px; /* 최대 너비 설정 */
            justify-content: center;
            align-items: center;
            overflow: hidden;
            box-sizing: border-box;
            margin-top: 20px;
            margin-left: 20px; 
            margin-right: 20px;
            
        }        

        .carousel-inner {
            width: 100%;
            height: 100%;
        }
        
        .carousel-item img {
            width: 100%;
            height: 100%;
            min-width: 800px; /* 최소 너비 설정 */
            min-height: 600px; /* 최소 높이 설정 */
            object-fit: cover;
        }

        .carousel-control-prev-icon,
        .carousel-control-next-icon {
            background-color: black; /* 화살표 배경색 설정 */
            border-radius: 50%; /* 원형으로 만들기 */
            width: 30px;
            height: 30px;
        }

        .carousel-control-prev-icon {
            background-image: url('data:image/svg+xml;charset=utf8,%3Csvg xmlns%3D"http://www.w3.org/2000/svg" fill%3D"%23ffffff" viewBox%3D"0 0 8 8"%3E%3Cpath d%3D"M4.5 0l-4 4 4 4 1.5-1.5L3 4l2.5-2.5L4.5 0z"/%3E%3C/svg%3E');
        }

        .carousel-control-next-icon {
            background-image: url('data:image/svg+xml;charset=utf8,%3Csvg xmlns%3D"http://www.w3.org/2000/svg" fill%3D"%23ffffff" viewBox%3D"0 0 8 8"%3E%3Cpath d%3D"M3.5 0l4 4-4 4-1.5-1.5L5 4 2.5 1.5 3.5 0z"/%3E%3C/svg%3E');
        }
        
        /* 프로필 */
        .profile-section {
            padding: 10px;
            margin-top : 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
            background-color: #f8f9fa;
        }
        .profile-section h3 {
            border-bottom: 2px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .profile-section div {
            margin-bottom: 10px;
        }
        .profile-section span {
            font-weight: bold;
        }
        
        .text-end {
			border-bottom: 2px solid #ddd; /* 테두리 추가 */
		}
		.comment-box {
		    display: flex;
		    align-items: flex-start;
		    padding: 10px;
		    margin-top: 10px;
		    background-color: #fff;
		    border: 1px solid #ddd;
		    border-radius: 10px;
		}

		 .comment-box img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            margin-right: 10px;
        }
        .comment-box .comment-content {
            background-color: #F2F2F2;
            padding: 10px;
            border-radius: 10px;
            width: 100%;
        }
        .comment-box .comment-content .author {
            font-weight: bold;
        }
        .comment-box .comment-content .author-time {
		    display: flex;
		    justify-content: flex-start;
   		    align-items: center;
		    margin-bottom: 5px;
		}
        .comment-box .comment-content p {
            margin: 0;
        }
        
        .main-content {
		    max-height: 500px;
		    overflow-y: auto; /* 세로 스크롤을 가능하게 설정 */
		    padding: 10px; /* padding을 추가하여 테두리와의 간격을 확보 */
		    box-sizing: border-box; /* 패딩과 보더를 포함하여 크기를 계산 */
		    width: 100%;
		    height: calc(100vh - 160px); /* 화면 높이에서 헤더와 기타 요소의 높이를 뺀 값으로 설정 */
		}
		
		.main-content textarea {
		    width: 100%;
		    height: 100%;
		    border: 1px solid #ddd;
		    padding: 10px;
		    box-sizing: border-box;
		    resize: none; /* 사용자가 크기 조절 불가 */
		    overflow-y: auto; /* 내용이 많을 때 스크롤 표시 */
		    background-color: #f8f9fa;
		    border-radius: 5px;
		}
        
		.head-profile{
			border-radius: 5px;
            border: 1px solid #ddd;
            background-color: #f8f9fa;
            padding-top: 3px;
		}
		
		/* 첨부 파일 꾸미기 */
		
		#divDrop {
    border: 2px dashed #007bff; /* 점선 테두리 */
    border-radius: 10px; /* 둥근 모서리 */
    background-color: #f8f9fa; /* 배경색 */
    padding: 20px; /* 안쪽 여백 */
    text-align: center; /* 텍스트 중앙 정렬 */
    color: #007bff; /* 텍스트 색상 */
    font-size: 18px; /* 텍스트 크기 */
    font-weight: bold; /* 텍스트 두께 */
    transition: background-color 0.3s ease; /* 배경색 전환 효과 */
}

#divDrop:hover {
    background-color: #e7f3ff; /* 마우스 오버 시 배경색 변경 */
}

#divDrop.dragover {
    background-color: #d1ecf1; /* 드래그 중일 때 배경색 변경 */
    border-color: #17a2b8; /* 드래그 중일 때 테두리 색상 변경 */
}
		        
    </style>
</head>
<script type="text/javascript">
$(function () {
	// 파일 타입 확인
	let regex = new RegExp("(.*?)\.(exe|sh|zip|alz|txt)$");
	// run.exe , smile.zip...
	let maxSize = 5242880; // 5MB 업로드 최대 크기 확인
	
	let imageNum = 0;
	
	function checkExtension (fileName, fileSize) {
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
	
	
	function uploadFiles(files) {
		// <form>
		let formData = new FormData();
		for (let i = 0; i < files.length; i++) {
			let fileName = files[i].name;
			let fileSize = files[i].size;
			if(!checkExtension(fileName, fileSize)){
				return false;
			};
			// <input name="전송값">
			formData.append("uploadFiles", files[i]);
		}
		console.log(formData);
		
		// 비동기 전송
		$.ajax({
			type: "post",
			url: "/uploadFormAction",
			contentType: false,
			processData: false,
			data : formData,
			success: function(rData) {
				console.log(rData); // List<attachFileDto>
				$.each(rData,function(index, obj){
					let imgcard;
					let fileName = `\${obj.uploadPath}/\${obj.uuid}_\${obj.fileName}`;
					if(!obj.image){
						imgTag = `<a href='/download?fileName=\${obj.uploadPath}/\${obj.uuid}_\${obj.fileName}'><img src='/resources/default.png' width='100'></a>`;
					} else {
						let path = obj.uploadPath + "/"+ obj.uuid + "_" + obj.fileName;
						let callPath = obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName;
						imgTag = `<img class="d-block w-100" alt="First Image"" src="/display?fileName=\${path}" data-callpath="\${callPath}">`;
					}
					if(imageNum == 0) {
						imgcard =`<div class="carousel-item active"
								   		data-filename="\${obj.fileName}"
										data-uploadpath="\${obj.uploadPath}"
										data-uuid="\${obj.uuid}"
										data-type="\${obj.image}">
										\${imgTag}<span style="cursor:pointer";
									data-filename="\${fileName}">&times;</span>
						            </div>`;					
					} else {
						imgcard =`<div class="carousel-item"
								   		data-filename="\${obj.fileName}"
										data-uploadpath="\${obj.uploadPath}"
										data-uuid="\${obj.uuid}"
										data-type="\${obj.image}">
										\${imgTag}<span style="cursor:pointer";
									data-filename="\${fileName}">&times;</span>
						            </div>`;					
					}											
					imageNum++;
					$("#carousel-list").append(imgcard);
				})
			}
		})
	}
	
	
	
	
	const inputFile = $("input[name=uploadFiles]");
	
	 $("#divDrop").on("dragenter dragover", function(e) {
        e.preventDefault();
        $(this).addClass("dragover");
    });

    $("#divDrop").on("dragleave drop", function(e) {
        e.preventDefault();
        $(this).removeClass("dragover");
    });

	
	$("#divDrop").on("drop", function (e) {
		e.preventDefault();
		console.log(e.originalEvent.dataTransfer.files);
		let files = e.originalEvent.dataTransfer.files;
		uploadFiles(files);
	});
	
	
	// 첨부파일 삭제
	// server.xml 에서<connerct port="80" parseBodyMethods="POST,PUT,PATCH,DELETE">
	$("#uploadedList").on("click", "li > span", function () {
		let that = $(this);
		let filename = that.data("filename");
		let sData = {fileName : filename };
		$.ajax({
			type: "delete",
			url: "/delete",
			data : sData,
			success: function(rData) {
				console.log(rData); 
				that.parent().remove(); // <li>
			}
		});
	});
	
	// 등록폼 전송
	$("#frmRegister").submit(function () {
		$("#uploadedList > li").each(function (i) {
			let fileName = $(this).data("filename");
			let uploadPath = $(this).data("uploadpath");
			let uuid = $(this).data("uuid");
			let image = $(this).data("type");
			
			let inputTag = `<input type="hidden" name="attachList[\${i}].fileName" value="\${fileName}" >
						    <input type="hidden" name="attachList[\${i}].uploadPath" value="\${uploadPath}" >
					 		<input type="hidden" name="attachList[\${i}].uuid" value="\${uuid}" >
					 		<input type="hidden" name="attachList[\${i}].image" value="\${image == true ?'I':'F'}">`;
			$("#frmRegister").prepend(inputTag);
		});
		//return false;
	});
	
	
	
	
	
	
});
</script>
<body>
    <div class="main">
        <div class="image-area">
        <!-- 카루셀 시작 -->
		<!-- 카루셀 아이디에 특정값을 넣을것 같으면 삑남 -->
		<div id="imageCarousel2"  class="carousel slide" data-ride="carousel" data-interval="false">
		    <div id="carousel-list" class="carousel-inner">
		    	<!-- 이미지 시작  -->
		      <!--   <div class="carousel-item active">
		            <img src="/resources/images/black.png" class="d-block w-100" alt="First Image">
		        </div> -->
		        <!-- 더 많은 이미지가 필요하면 이곳에 추가 -->
		    </div>
		    <!-- 여기에 위에 넣은 id 넣을것 아래 2개에  -->
		    <a class="carousel-control-prev" href="#imageCarousel2" role="button" data-slide="prev">
		        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		        <span class="sr-only">Previous</span>
		    </a>
		    <a class="carousel-control-next" href="#imageCarousel2" role="button" data-slide="next">
		        <span class="carousel-control-next-icon" aria-hidden="true"></span>
		        <span class="sr-only">Next</span>
		    </a>
		</div>
		<!-- 카루셀 끝 -->
        
        
        </div>
        <div class="side-bar">
            <div class="container">
			<div class="profile-end">
				<!-- 프로필 -->
				<form id="frmRegister" action="">
				
			 <div class="profile head-profile">
					  <div class="profile ">
				          <h3 ><img src="/resources/images/logo.png" alt="프로필 사진"><input name="userId" value="userId" type="hidden">${login.user_name}님의 스토리</input></h3>
					  </div>
			      </div>
			      <!-- 본문 내용  -->
			      <div class="profile-section main-content">
			          <h3 class="text-end">본문내용</h3>
			          <textarea name="content" id="main-content"></textarea>
			      </div>
			      <!-- 본문 내용끝  -->
			      <!-- 첨부 파일 -->
					<div class="card shadow mb-4">
				        <div class="card-header py-3">
				            <h6 class="m-0 font-weight-bold text-primary">첨부파일</h6>
				        </div>
				        <div class="card-body">
				     	   <div class="row">
								<div class="col-md-12">
								
								<div id="divDrop">
									업로드할 파일을 드래그 &amp; 드롭 하세요.
								</div>
								<ul id="uploadedList">
					
								</ul>
								
								</div>
							</div>
						</div>
					</div>
					<!-- 첨부 파일 끝 -->
		                     
		                     
                    <button type="submit" class="btn btn-success">등록</button>
                    <a href="/hc/main/main" class="btn btn-danger">목록으로</a>
				</form>
	                     
		        </div>
			<!-- 프로필 끝  -->
				</div>
        </div>
    </div>
</body>
</html>