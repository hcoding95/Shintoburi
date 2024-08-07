<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/hc/main.css">
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f1f1f1;
    display: flex;
    flex-direction: column;
    align-items: center;
}


.header {
    width: 100%;
    max-width: 1200px;
    min-width: 1200px;
    background-color: #ffffff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    padding: 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.logo-container {
    width: 100%;
    display: flex;
    justify-content: center;
    margin-bottom: 20px; /* 로고와 프로필 섹션 사이에 20px 간격 추가 */
    
}

.logo-container img {
    max-width: 100%;
    height: auto;
}

.header-content {
    width: calc(100% - 200px); /* 좌우 100px씩 마진 적용을 위한 너비 설정 */
    max-width: 1000px;
    min-width: 1000px; /* 최소 너비 설정 */
    display: flex;
    align-items: center;
    margin-top: 20px; /* 로고와 프로필 섹션 사이에 간격 추가 */
    margin-left: 100px; /* 왼쪽 끝단에서 100px 이동 */
    padding-right: 300px; /* 오른쪽 끝단에서 100px 이동 */
    padding-bottom: 20px;
    
}
.profile-end {
	max-width: 1100px;
    min-width: 1100px; /* 최소 너비 설정 */
	border-bottom: 2px solid #ddd; /* 테두리 추가 */
}

.text-end {
	border-bottom: 2px solid #ddd; /* 테두리 추가 */
}

.profile-picture {
    width: 100px;
    height: 100px;
    background-color: #bbb;
    border-radius: 50%;
    margin-right: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 24px;
    color: white;
    flex-shrink: 0;
}

.profile-info {
    display: flex;
    flex-direction: column;
    flex-grow: 1;
}

.profile-info h2 {
    margin: 0;
    font-size: 24px;
}

.profile-text {
    font-size: 14px;
    color: #666;
    margin-top: 5px;
}

.profile-text p {
    margin: 2px 0;
}

.profile-text span {
    font-weight: bold;
    margin-left: 5px;
}

.profile-actions {
    display: flex;
    margin-top: 10px;
}

.profile-actions button {
    margin-right: 10px;
    padding: 10px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: white;
    cursor: pointer;
}

.profile-actions button:last-child {
    background-color: #28a745;
    margin-right: 0;
}

/* 위에는 상단 탭부분 아래부터는 그 밑에꺼  */
.container {
    display: flex;
    width: 1200px;
    margin-top: 20px;
    align-items: flex-start; /* 아이템들이 같은 곳에서 시작하도록 설정 */
}

.sidebar {
    width: 300px;
    margin-right: 20px;
}

.sidebar .section {
    margin-bottom: 20px;
    padding: 10px;
    background-color: #f9f9f9;
    border: 1px solid #ddd; /* 테두리 추가 */
    border-radius: 5px;
}

.photo-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 5px;
}

.photo-grid .photo {
    background-color: #ccc;
    height: 100px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.blog-main-content {
    flex-grow: 1;
    margin-top: 0; /* 사이드바와 같은 높이에서 시작하도록 설정 */
}
/* 섹션 구분용 */
.blog-control {
	padding: 10px;
    background-color: #fff;
    border: 1px solid #ddd; /* 테두리 추가 */
    border-radius: 5px;
    margin-bottom: 20px;
}

.posts-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
    border-bottom: 2px solid #ddd;
    padding-bottom: 10px;
}

.posts {
    height: 500px;
    overflow-y: auto;
}

.post {
    background-color: #fff;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
}
.filters {
    float: right; /* 오른쪽 끝에 붙이기 */
  
}
#filterBtn {
  	padding: 5px 5px; /* 버튼의 크기 조정 */
    font-size: 12px;   /* 버튼 텍스트 크기 조정 */
}
</style>
    
<!-- 사진 상단 부분  -->
<div class="header">
    <div class="logo-container profile-end">
        <img src="/resources/images/logo.png" alt="Logo">
    </div>
    
    <div class="header-content">
        <div class="profile-picture">사진</div>
        <div class="profile-info">
            <h2>이름</h2>
            <div class="profile-text">
                <p>좋아요 갯수 <span>12</span></p>
                <p>팔로워 갯수 <span>121</span></p>
            </div>
        </div>
        <div class="profile-actions ">
             <button>쪽지 보내기</button>
             <button>좋아요</button>
        </div>
    </div>
	<div class="profile-end">
		<p></p>
	</div>
</div>
<!-- 사진 프로필 끝  -->
<!-- 탭팬 부분 -->
<div class="row" style="margin-top: 20px;">
	<div class="col-md-12">
		<div class="tabbable" id="tabs-62401">
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a class="nav-link active" href="#tab1" data-toggle="tab">게시물</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#tab2" data-toggle="tab">프로필 정보</a>
				</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tab1">
				<!-- 탭팬 1내용 -->
					<div class="container">
				        <div class="sidebar">
				        	<div class="blog-control">
					            <h3 class="text-end">소개</h3>
					            <p>출신</p>
					            <p>위치</p>
					            <p>이메일</p>
				        	</div>
				        	<div class="blog-control">
					            <h3 class="text-end">사진</h3>
					            <div class="photo-grid">
					                <div class="photo">A</div>
					                <div class="photo">A</div>
					                <div class="photo">A</div>
					                <div class="photo">A</div>
					                <div class="photo">A</div>
					                <div class="photo">A</div>
					            </div>
				        	</div>
				        </div>
				        <div class="blog-main-content">
				        	<div class="blog-control">
					            <h3 class="text-end">게시물 <div class="filters"><button id="filterBtn" class="btn btn-primary">필터</button></div></h3>
				        	</div>
				            <div class="posts blog-control">
				                <div class="post">게시물 1</div>
				                <div class="post">게시물 2</div>
				                <div class="post">게시물 3</div>
				                <div class="post">게시물 4</div>
				                <div class="post">게시물 5</div>
				                <div class="post">게시물 5</div>
				                <div class="post">게시물 5</div>
				                <div class="post">게시물 5</div>
				                <div class="post">게시물 5</div>
				                <div class="post">게시물 5</div>
				                <div class="post">게시물 5</div>
				                <div class="post">게시물 5</div>
				                <div class="post">게시물 5</div>
				                <div class="post">게시물 5</div>
				                <div class="post">게시물 5</div>
				                <div class="post">게시물 5</div>
				                <div class="post">게시물 5</div>
				                <div class="post">게시물 5</div>
				            </div>
				        </div>
				    </div>
				</div>
				<!-- 탭팬 1내용끝 -->
				<div class="tab-pane" id="tab2">
					<p>
						Howdy, I'm in Section 2.
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 탭팬 부분끝  -->
     

<%@ include file="/WEB-INF/views/include/bottom.jsp"%>