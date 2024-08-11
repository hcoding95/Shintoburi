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
    <title>디테일 뷰</title>
    
<script type="text/javascript">


$(function () {
    const textarea = document.getElementById('comment-textarea');

    textarea.addEventListener('input', function() {
        this.style.height = 'auto'; // 먼저 높이를 자동으로 설정
        this.style.height = (this.scrollHeight <= 90 ? this.scrollHeight : 90) + 'px'; // 스크롤 높이를 계산하여 3줄까지만 확장
    });
});

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
            /* width: 40%; */
            width: 100%;
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
            /* width: 60%; */
            width : 100%;
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
            min-height: 800px; /* 최소 높이 설정 */
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
        
        .reply {
        	max-height: 300px;
        	overflow-y: auto; /* 세로 스크롤을 가능하게 설정 */
        }
        .main-content{
        	max-height: 400px;
        	overflow-y: auto; /* 세로 스크롤을 가능하게 설정 */
        }
        
        .comment-input {
		     position: sticky;
			 bottom: 10px;
			 background-color: white;
			 padding: 10px;
			 border-top: 2px solid #666666;
			 border: 1px solid black;  /* 전체 테두리를 검은색으로 설정 */
			 z-index: 1;  /* 다른 요소 위에 나타나도록 설정 */
			 width: 100%;  /* 너비를 100%로 설정하여 부모 요소의 너비를 꽉 채움 */
  		     box-sizing: border-box;  /* 패딩과 보더를 포함하여 요소의 전체 너비를 계산 */
  		     border-radius: 10px;
		}
		.head-profile{
			border-radius: 5px;
            border: 1px solid #ddd;
            background-color: #f8f9fa;
            padding-top: 3px;
		}
		        
    </style>
</head>
<body>
    <div class="main">
        <div class="image-area">
        <!-- 카루셀 시작 -->
		<!-- 카루셀 아이디에 특정값을 넣을것 같으면 삑남 -->
		<div id="imageCarousel2"  class="carousel slide" data-ride="carousel" data-interval="false">
		    <div class="carousel-inner">
		        <div class="carousel-item active">
		            <img src="/resources/images/black.png" class="d-block w-100" alt="First Image">
		        </div>
		        <div class="carousel-item">
		            <img src="/resources/images/1.png" class="d-block w-100" alt="Second Image">
		        </div>
		        <div class="carousel-item">
		            <img src="/resources/images/2.png" class="d-block w-100" alt="Third Image">
		        </div>
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
			 <div class="profile head-profile">
					  <div class="profile ">
				          <h3 ><img src="/resources/images/logo.png" alt="프로필 사진">(유저)님의 프로필</h3>
					  </div>
			      </div>
			      <!-- 본문 내용  -->
			      <div class="profile-section main-content">
			          <h3 class="text-end">본문내용</h3>
			          <div><span>전화 번호:</span> 010-1234-5678</div>
			          <div><span>이메일:</span> jane.doe@example.com</div>
			          <div><span>주소:</span> 서울시 강남구</div>
			          <div><span>전화 번호:</span> 010-1234-5678</div>
			          <div><span>이메일:</span> jane.doe@example.com</div>
			          <div><span>주소:</span> 서울시 강남구</div>
			          <div><span>전화 번호:</span> 010-1234-5678</div>
			          <div><span>이메일:</span> jane.doe@example.com</div>
			          <div><span>주소:</span> 서울시 강남구</div>
			          <div><span>전화 번호:</span> 010-1234-5678</div>
			          <div><span>이메일:</span> jane.doe@example.com</div>
			          <div><span>주소:</span> 서울시 강남구</div>
			          <div><span>전화 번호:</span> 010-1234-5678</div>
			          <div><span>이메일:</span> jane.doe@example.com</div>
			          <div><span>주소:</span> 서울시 강남구</div>
			          <div><span>전화 번호:</span> 010-1234-5678</div>
			          <div><span>이메일:</span> jane.doe@example.com</div>
			          <div><span>주소:</span> 서울시 강남구</div>
			          <div><span>전화 번호:</span> 010-1234-5678</div>
			          <div><span>이메일:</span> jane.doe@example.com</div>
			          <div><span>주소:</span> 서울시 강남구</div>
			          <div><span>전화 번호:</span> 010-1234-5678</div>
			          <div><span>이메일:</span> jane.doe@example.com</div>
			          <div><span>주소:</span> 서울시 강남구</div>
			          <div><span>전화 번호:</span> 010-1234-5678</div>
			          <div><span>이메일:</span> jane.doe@example.com</div>
			          <div><span>주소:</span> 서울시 강남구</div>
			      </div>
			      <!-- 본문 내용끝  -->
			        <div class="profile-section reply">
			          <h3 class="text-end">댓글</h3>
					  	<!-- 댓글 시작 -->
					  <div class="comment-box">
				          <img src="/resources/images/commenter.jpg" alt="댓글 작성자 사진">
		                     <div class="comment-content">
		                     	<div class="author-time">
			                       <div class="author">작성자 이름</div>
			                       <div class="time">작성 시간</div>
		                     	</div>
		                       <p>작성 내용</p>
		                     </div>
			          </div>
		                     <!-- 댓글 끝 -->
					  <div class="comment-box">
				          <img src="/resources/images/commenter.jpg" alt="댓글 작성자 사진">
		                     <div class="comment-content">
		                     	<div class="author-time">
			                       <div class="author">작성자 이름</div>
			                       <div class="time">작성 시간</div>
		                     	</div>
		                       <p>작성 내용</p>
		                     </div>
			          </div>
		                     <!-- 댓글 끝 -->
					  <div class="comment-box">
				          <img src="/resources/images/commenter.jpg" alt="댓글 작성자 사진">
		                     <div class="comment-content">
		                     	<div class="author-time">
			                       <div class="author">작성자 이름</div>
			                       <div class="time">작성 시간</div>
		                     	</div>
		                       <p>작성 내용</p>
		                     </div>
			          </div>
		                     <!-- 댓글 끝 -->
					  <div class="comment-box">
				          <img src="/resources/images/commenter.jpg" alt="댓글 작성자 사진">
		                     <div class="comment-content">
		                     	<div class="author-time">
			                       <div class="author">작성자 이름</div>
			                       <div class="time">작성 시간</div>
		                     	</div>
		                       <p>작성 내용</p>
		                     </div>
			          </div>
		                     <!-- 댓글 끝 -->
					  <div class="comment-box">
				          <img src="/resources/images/commenter.jpg" alt="댓글 작성자 사진">
		                     <div class="comment-content">
		                     	<div class="author-time">
			                       <div class="author">작성자 이름</div>
			                       <div class="time">작성 시간</div>
		                     	</div>
		                       <p>작성 내용</p>
		                     </div>
			          </div>
		                     <!-- 댓글 끝 -->
		                     <!-- 댓글 끝 -->
					  <div class="comment-box">
				          <img src="/resources/images/commenter.jpg" alt="댓글 작성자 사진">
		                     <div class="comment-content">
		                     	<div class="author-time">
			                       <div class="author">작성자 이름</div>
			                       <div class="time">작성 시간</div>
		                     	</div>
		                       <p>작성 내용</p>
		                     </div>
			          </div>
		                     <!-- 댓글 끝 -->
		                     <!-- 댓글 끝 -->
					  <div class="comment-box">
				          <img src="/resources/images/commenter.jpg" alt="댓글 작성자 사진">
		                     <div class="comment-content">
		                     	<div class="author-time">
			                       <div class="author">작성자 이름</div>
			                       <div class="time">작성 시간</div>
		                     	</div>
		                       <p>작성 내용</p>
		                     </div>
			          </div>
		                     <!-- 댓글 끝 -->
		                     <!-- 댓글 끝 -->
					  <div class="comment-box">
				          <img src="/resources/images/commenter.jpg" alt="댓글 작성자 사진">
		                     <div class="comment-content">
		                     	<div class="author-time">
			                       <div class="author">작성자 이름</div>
			                       <div class="time">작성 시간</div>
		                     	</div>
		                       <p>작성 내용</p>
		                     </div>
			          </div>
		                     <!-- 댓글 끝 -->
		                     <!-- 댓글 끝 -->
					  <div class="comment-box">
				          <img src="/resources/images/commenter.jpg" alt="댓글 작성자 사진">
		                     <div class="comment-content">
		                     	<div class="author-time">
			                       <div class="author">작성자 이름</div>
			                       <div class="time">작성 시간</div>
		                     	</div>
		                       <p>작성 내용</p>
		                     </div>
			          </div>
		                     <!-- 댓글 끝 -->
		                     <!-- 댓글 끝 -->
					  <div class="comment-box">
				          <img src="/resources/images/commenter.jpg" alt="댓글 작성자 사진">
		                     <div class="comment-content">
		                     	<div class="author-time">
			                       <div class="author">작성자 이름</div>
			                       <div class="time">작성 시간</div>
		                     	</div>
		                       <p>작성 내용</p>
		                     </div>
			          </div>
		                     <!-- 댓글 끝 -->
		                     <!-- 댓글 끝 -->
					  <div class="comment-box">
				          <img src="/resources/images/commenter.jpg" alt="댓글 작성자 사진">
		                     <div class="comment-content">
		                     	<div class="author-time">
			                       <div class="author">작성자 이름</div>
			                       <div class="time">작성 시간</div>
		                     	</div>
		                       <p>작성 내용</p>
		                     </div>
			          </div>
		                     <!-- 댓글 끝 -->
		                     <!-- 댓글 끝 -->
					  <div class="comment-box">
				          <img src="/resources/images/commenter.jpg" alt="댓글 작성자 사진">
		                     <div class="comment-content">
		                     	<div class="author-time">
			                       <div class="author">작성자 이름</div>
			                       <div class="time">작성 시간</div>
		                     	</div>
		                       <p>작성 내용</p>
		                     </div>
			          </div>
		                     <!-- 댓글 끝 -->
		                     <!-- 댓글 끝 -->
					  <div class="comment-box">
				          <img src="/resources/images/commenter.jpg" alt="댓글 작성자 사진">
		                     <div class="comment-content">
		                     	<div class="author-time">
			                       <div class="author">작성자 이름</div>
			                       <div class="time">작성 시간</div>
		                     	</div>
		                       <p>작성 내용</p>
		                     </div>
			          </div>
		                     <!-- 댓글 끝 -->
		                     
		                     
		                     
	                  <div class="comment-input">
	                    <textarea  id="comment-textarea" placeholder="댓글 입력창"></textarea>
	                    <button class="btn btn-success">버튼</button>
	                  </div>
			        </div>
			<!-- 프로필 끝  -->
				</div>
        </div>
    </div>
</body>
</html>