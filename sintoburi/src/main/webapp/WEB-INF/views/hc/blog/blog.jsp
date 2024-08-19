<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/hc/main.css">
<!-- 글리피콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!-- 스윗 얼럿  -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
$(function () {
	$(".likeBtn").click(function () {
		let that = $(this);
		let login_id = '${login.user_id}';
		let blog_no = that.attr("data-blog_no");
		let liked = that.attr("data-liked");
		let sData = {
			'user_id' : login_id,
			'blog_no' : blog_no
		};
		console.log(sData);
		console.log(liked);
		if (liked == "true") {
			$.ajax({
				type : "post",
				url : "/hc/like/removeLike",
				data : JSON.stringify(sData),
				contentType : "application/json; charset=utf-8",
				success : function (rData) {
					alert("좋아요 취소");
					let container = that.closest(".post-container");
					let countLike = container.find(".sumLike");
					let count = parseInt(countLike.text(), 10);
					countLike.text(count - 1);
					that.attr("data-liked", "false"); // data-liked 값을 "false"로 변경
					that.html('<i class="fa-regular fa-thumbs-up">좋아요</i>');
				} 
			});
		} else {
			$.ajax({
				type : "post",
				url : "/hc/like/addLike",
				data : JSON.stringify(sData),
				contentType : "application/json; charset=utf-8",
				success : function (rData) {
					alert("좋아요 클릭");
					let container = that.closest(".post-container");
					let countLike = container.find(".sumLike");
					let count = parseInt(countLike.text(), 10);
					countLike.text(count + 1);
					that.attr("data-liked", "true"); // data-liked 값을 "true"로 변경
					that.html('<i class="fa-solid fa-thumbs-up">좋아요</i>');
				} 
			});
		}
	});
	
	$("#followBtn").click(function () {
		let that = $(this);
		let login_id = '${login.user_id}';
		let followed_id = that.attr("data-followedId");
		let check = that.attr("data-check");
		let sData = {
			'user_follower' : login_id,
			'user_following' : followed_id
		};
		console.log(sData);
		console.log(check);
		if (check == "true") {
			$.ajax({
				type : "post",
				url : "/hc/follow/removeFollow",
				data : JSON.stringify(sData),
				contentType : "application/json; charset=utf-8",
				success : function (rData) {
					alert("팔로우 취소");
					location.reload();
				} 
			});
		} else {
			$.ajax({
				type : "post",
				url : "/hc/follow/addFollow",
				data : JSON.stringify(sData),
				contentType : "application/json; charset=utf-8",
				success : function (rData) {
					alert("팔로우 클릭");
					location.reload();
				} 
			});
		}
	});
	
	$(".btn-setting-insert").click(function () {
		let area = $(this).data("area");
		//let user_id = "${login.user_id}";
		let user_id = "user02";
		Swal.fire({
		  title: '카테고리 추가',
		  html:
		    '<input id="config-name" class="swal2-input" placeholder="세팅 이름">' +
		    '<input id="config-value" class="swal2-input" placeholder="세팅 내용">',
		  focusConfirm: false,
		  preConfirm: () => {
		    let config_name = Swal.getPopup().querySelector('#config-name').value;
		    let config_value = Swal.getPopup().querySelector('#config-value').value;
		    if (!config_name || !config_value) {
		      Swal.showValidationMessage(`빈칸없이 둘다 입력하세요`);
		    }
		    return { config_name : config_name, config_value : config_value };
		  }
		}).then((result) => {
		  if (result.isConfirmed) {
		    let { config_name, config_value } = result.value;
		    let sData = {
		    	"user_id" : user_id,
		    	"blog_category" : area,
		    	"config_name" : config_name,
		    	"config_value" : config_value
		    };
		    $.ajax({
		    	type : "post",
		    	url : "/blogSetting/insert",
		    	data : JSON.stringify(sData),
		    	contentType : "application/json; charset=utf-8",
		    	success : function (rData) {
					alert("등록완료");
				}
		    })
		  }
		});
		
	})
	
	$(".config-modify-btn").click(function () {
		let that = $(this).closest(".profile-content");
		let c_name = that.find(".config-name").text().trim();
		let c_value = that.find(".config-value").text().trim();
		Swal.fire({
		  title: '카테고리 수정',
		  html:
		    `<input id="config-name" class="swal2-input" value="\${c_name}" placeholder="세팅 이름">` +
		    `<input id="config-value" class="swal2-input" value="\${c_value}" placeholder="세팅 내용">`,
		  focusConfirm: false,
		  preConfirm: () => {
		    let config_name = Swal.getPopup().querySelector('#config-name').value;
		    let config_value = Swal.getPopup().querySelector('#config-value').value;
		    if (!config_name || !config_value) {
		      Swal.showValidationMessage(`빈칸없이 둘다 입력하세요`);
		    }
		    return { config_name : config_name, config_value : config_value };
		  }
		}).then((result) => {
		  if (result.isConfirmed) {
		    let { config_name, config_value } = result.value;
		    
		    that.find(".config-name").text(config_name);
		    that.find(".config-value").text(config_value);
		  }
		});
	
		
		
	});

	
});
</script>
<style>
.header-top {
    
    display: flex;
    flex-direction: column;
    align-items: center;
    padding-top: 30px;
    border: none;
    border-radius: 5px;
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
    width: 500px;
    margin-right: 20px;
    position: -webkit-sticky; /* Safari 지원을 위한 접두사 */
    position: sticky;
    top: 50px; /*
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
    height: 120px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 5px; /* 이미지에 둥근 모서리 추가 */
}

.photo-grid .photo img {
    width: 100%;
    height: 100%;
    object-fit: cover; /* 이미지가 컨테이너를 채우도록 조정 */
    border-radius: 5px; /* 이미지에 둥근 모서리 추가 */
    cursor: pointer;
}
.product-photo-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 5px;
}

.product-photo-grid .photo {
    background-color: #ccc;
    height: 120px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 5px; /* 이미지에 둥근 모서리 추가 */
}

.product-photo-grid .photo img {
    max-width: 100%;
    max-height: 100%;
    object-fit: cover; /* 이미지가 컨테이너를 채우도록 조정 */
    border-radius: 5px; /* 이미지에 둥근 모서리 추가 */
}

.photo-main-grid {
    display: grid;
    grid-template-columns: repeat(6, 1fr);
    gap: 5px;
}

.photo-main-grid .photo {
    background-color: #ccc;
    height: 120px; /* 이미지 높이를 줄임 */
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 5px; /* 이미지에 둥근 모서리 추가 */
    overflow: hidden; /* 이미지를 컨테이너 내로 자르기 위해 overflow를 hidden으로 설정 */
}
.photo-main-grid .photo img {
    max-width: 100%;
    max-height: 100%;
    object-fit: contain; /* 이미지가 컨테이너를 채우도록 조정 */
    border-radius: 5px; /* 이미지에 둥근 모서리 추가 */
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
    overflow-y: visible;
}

.post {
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
}
.filters {
    float: right; /* 오른쪽 끝에 붙이기 */
  
}

.btn-standard {
  	padding: 5px 5px; /* 버튼의 크기 조정 */
    font-size: 12px;   /* 버튼 텍스트 크기 조정 */
}

/* 프로필 부분 */
 .profile-section {
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 5px;
    margin-bottom: 20px;
    background-color: #f8f9fa;
}
.profile-section h3 {
    border-bottom: 2px solid #ddd;
    padding-bottom: 10px;
    margin-bottom: 20px;
}
.profile-section div {
    margin-bottom: 1px;
}

.profile-content {
    display: flex;
    align-items: center;
    justify-content: space-between; /* 각 요소를 양 끝으로 정렬 */
}


.profile-content input {
    margin-left: 10px; /* 체크박스와 텍스트 사이의 간격 */
    transform: scale(1.2); /* 체크박스 크기 조정 (선택 사항) */
}

.checkbox-group {
    display: flex;
    align-items: center;
    gap: 20px; /* 체크박스 그룹 간의 간격 조절 */
}

.checkbox-group label {
    display: flex;
    align-items: center;
    font-size: 14px;
}

.checkbox-group input {
    margin-right: 5px; /* 체크박스와 라벨 텍스트 사이의 간격 */
}

.config-name {
	font-weight: bold;
}

.config-value {
	flex-grow: 1; /* 계급명이 남은 공간을 차지하도록 설정 */
    margin-right: auto; /* 계급명을 왼쪽에 고정 */
    margin-left: 5px;
}

.config-modify-btn, .config-delete-btn {
    font-size: 14px;
    padding: 2px 5px; /* 버튼의 패딩을 줄여 크기를 조정 */
    line-height: 1.5; /* 버튼 내 텍스트의 높이를 조정 */
}


</style>
    
<!-- 사진 상단 부분  -->
<div class="header-top">
<div class="header">
    <div class="logo-container profile-end blog-control" >
        <img src="/resources/images/logo.png" alt="Logo">
    </div>
    
    <div class="header-content">
        <div class="profile-picture">사진</div>
        <div class="profile-info">
            <h2>${blog_userVo.user_name}(${blog_userVo.user_id})님</h2>
            <div class="profile-text">
                <p>팔로워 수 <span>${blog_userVo.sumFollow}</span></p>
            </div>
        </div>
        <div class="profile-actions ">
             <button>쪽지 보내기</button>
             <c:if test="${blog_userVo.user_id ne login.user_id }">
             	<c:choose>
		          <c:when test="${blog_userVo.checkFollow eq true }">
		          	<button id="followBtn" class="btn btn-danger" data-followedId="${blog_userVo.user_id}" data-check="${blog_userVo.checkFollow }"><i class="fa fa-handshake">취소(<span>${blog_userVo.sumFollow}</span>)</i></button>
		          </c:when>
		          <c:otherwise>
		          	<button id="followBtn" class="btn btn-primary" data-followedId="${blog_userVo.user_id}" data-check="${blog_userVo.checkFollow }"><i class="fa fa-handshake">팔로우(<span>${blog_userVo.sumFollow}</span>)</i></button>
		          </c:otherwise>
	         	</c:choose>
             </c:if> 
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
					<a class="nav-link active" id="main-tab1" href="#tab1" data-toggle="tab">게시물</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="main-tab2" href="#tab2" data-toggle="tab">프로필 정보</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="main-tab3" href="#tab3" data-toggle="tab">사진</a>
				</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tab1">
				<!-- 탭팬 1내용 -->
					<div class="container">
				        <div class="sidebar">
				        	<div class="blog-control">
					            <h3 class="text-end">소개<div class="filters"><a id="filterBtn" href="#tab2" data-toggle="tab" data-tab="#main-tab2" class="btn btn-primary btn-standard">더보기</a></div></h3>
					            <c:forEach items="${blog_setting}" var="set">
					            <c:if test="${set.isMain eq 'T' and set.isVisible eq 'T' }">
					            <div class="profile-content">
						            <span class="config-name">${set.config_name }</span>
						            <span> : </span>
						            <span class="config-value">${set.config_value }</span>
					            </div>
					            </c:if>
					            </c:forEach>
				        	</div>
				        	<div class="blog-control">
					            <h3 class="text-end">사진<div class="filters"><a id="filterBtn" href="#tab3" data-toggle="tab" data-tab="#main-tab3" class="btn btn-primary btn-standard">더보기</a></div></h3>
					            <div class="photo-grid">
					            	<!-- 더 많은 이미지가 필요하면 이곳에 추가 -->
					            	<c:forEach items="${list}" var="pictureVo" begin="0" end="5" step="1">
					             		<c:if test="${not empty pictureVo.fileList }">
							             <c:forEach items="${pictureVo.fileList}" var="file" varStatus="innerstatus" begin="0" end="0">
							                <div class="photo"><a data-toggle="modal" data-target="#myModal${pictureVo.blog_no}" ><img src="/display?file_name=${file.file_path }/${file.uuid}_${file.file_name}" class="d-block w-100" alt="First Image"></a></div>
							             </c:forEach>
						             	</c:if>
					            	</c:forEach>
					            </div>
				        	</div>
				        	<div class="blog-control">
					            <h3 class="text-end">브랜드몰<div class="filters"><a id="filterBtn" href="#" class="btn btn-primary btn-standard">상품몰로</a></div></h3>
					            <div class="product-photo-grid">
					                <div class="photo"><a href="#"><img src="/resources/images/logo.png"></a></div>
					                <div class="photo"><a href="#"><img src="/resources/images/logo.png"></a></div>
					                <div class="photo"><a href="#"><img src="/resources/images/logo.png"></a></div>
					            </div>
				        	</div>
				        </div>
				        <div class="blog-main-content">
				        	<div class="blog-control">
					            <h3 class="text-end">게시물 <div class="filters "><button id="filterBtn" class="btn btn-primary btn-standard">필터</button></div></h3>
				        	</div>
				            <div class="posts">
				            <!-- 메인의 내용 시작 -->
							<c:forEach items="${list}" var="vo" varStatus="status">
							<div class="post-container">
								<c:if test="${not empty vo.fileList }">
							     <!-- 카루셀 시작 -->
							     <!-- 카루셀 아이디에 특정값을 넣을것 같으면 삑남 -->
							     <div id="imageCarousel2${status.index }"  class="carousel slide" data-ride="carousel" data-interval="false">
							         <div class="carousel-inner">
							             <!-- 더 많은 이미지가 필요하면 이곳에 추가 -->
							             <c:forEach items="${vo.fileList}" var="file" varStatus="innerstatus">
							             <div class="carousel-item ${innerstatus.index == 0 ? 'active' : '' }">
							                 <a data-toggle="modal" data-target="#myModal${vo.blog_no}"><img src="/display?file_name=${file.file_path }/${file.uuid}_${file.file_name}" class="d-block w-100" alt="First Image"></a>
							             </div>
							             </c:forEach>
							         </div>
							         <!-- 여기에 위에 넣은 id 넣을것 아래 2개에  -->
							         <a class="carousel-control-prev" href="#imageCarousel2${status.index }" role="button" data-slide="prev">
							             <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							             <span class="sr-only">Previous</span>
							         </a>
							         <a class="carousel-control-next" href="#imageCarousel2${status.index }" role="button" data-slide="next">
							             <span class="carousel-control-next-icon" aria-hidden="true"></span>
							             <span class="sr-only">Next</span>
							         </a>
							     </div>
							     <!-- 카루셀 끝 -->
							     </c:if>
							     <c:if test="${not empty vo.productTagList }">
							     <div class="post-icons">
							     	<c:forEach items="${vo.productTagList }" var="tag" >
							         <a href="#"><img src="/resources/images/logo.png" alt="Icon 1">${tag.product_id}</a>
							     	</c:forEach>
							     </div>
							     </c:if>
							     <div class="post-user-info">
							  	  <div class="user-details">
							       <img src="/resources/images/logo.png" alt="User Image">
							       <div class="user-info-text">
							           <div><a href="/hc/blog/blog?user_id=${vo.user_id }">${vo.user_name}</a></div>
							           <div><c:choose>
							           <c:when test="${empty vo.updatedate}"><fmt:formatDate value="${vo.regdate}" pattern="yyyy.MM.dd hh:mm"/></c:when>
							           	<c:otherwise><fmt:formatDate value="${vo.updatedate}" pattern="yyyy.MM.dd hh:mm"/>수정</c:otherwise>
							            </c:choose></div>
							       </div>
							     </div>
							     <div class="user-stats">
							       <div><i class="fa fa-thumbs-up"> 좋아요<span class="sumLike" id="sumLike${vo.blog_no }">${vo.sumLike }</span></i></div>
							       <div><i class="fa fa-handshake">팔로워<span class="sumFollow" id="sumFollow${vo.blog_no }">${vo.sumFollower }</span></i></div>
							     </div>
							</div>
							    <div class="post-content">
							         ${vo.blog_content} <a href="#">더보기</a>
							    </div>
							    <div class="post-actions">
							        <button class="likeBtn" data-blog_no="${vo.blog_no}" data-liked="${vo.checkLike}"><c:choose>
							        	<c:when test="${vo.checkLike eq true }">
							        	<i class="fa-solid fa-thumbs-up">좋아요</i>
							        	</c:when>
							        	<c:otherwise>
							        	<i class="fa-regular fa-thumbs-up">좋아요</i>
							        	</c:otherwise>
							        	</c:choose></button>
							        <button><a data-toggle="modal" data-target="#myModal${vo.blog_no}"><i class="fa fa-comment">댓글 달기</i></a></button>
							        <button><i class="fa fa-exclamation-triangle">신고하기</i></button>
							        <button><c:choose>
							        	<c:when test="${vo.user_id eq login.user_id }"><a href="/hc/blog/modify_form?blog_no=${vo.blog_no}"><i class="fa fa-pen-to-square">수정하기</i></a></c:when>
							        	<c:otherwise><a href="/hc/blog/register"><i class="fa fa-pen-to-square">글쓰기</i></a></c:otherwise>
							        </c:choose></button>
							    </div>
							</div>
							<c:set var="detailVo" value="${vo}"></c:set>
							<%@ include file="/WEB-INF/views/hc/include/modal.jsp" %>
							<script type="text/javascript">
							// 모달창이 실행될때마다 초기화 해줌 좋아요반응
							$(function() {
							    // 모달이 열릴 때마다 실행
							    $('#myModal${detailVo.blog_no}').on('show.bs.modal', function () {
							        let iframe = $(this).find('iframe');
							        let src = iframe.attr('src'); // 현재 src를 가져와서
							        iframe.attr('src', ''); // 잠시 빈 값으로 변경한 후
							        iframe.attr('src', src); // 다시 원래 src로 복원하여 새로고침 효과
							    });
							});
							</script>
							</c:forEach> 
							<!-- 메인 내용 끝 -->
				            </div>
				        </div>
				    </div>
				</div>
				<!-- 탭팬 1내용끝 -->
					<div class="tab-pane" id="tab2">
						<div class="container">
							 <div class="profile-end">
							 	<!-- 프로필 -->
								 <div class="profile-section">
						            <h3 id="profile-top" class="text-end">(${blog_userVo.user_name})님의 프로필
						            <button class="btn btn-primary blog-setting-btn" ><i class="fa fa-pen-to-square">수정</i></button>
						            <button class="btn btn-success blog-setting-btn"><i class="fa fa-pen-to-square">수정완료</i></button>
						            <button class="btn btn-info blog-setting-btn btn-setting-insert" data-area="T"><i class="fa fa-pen-to-square">추가하기</i></button>
						            </h3>
						            <c:forEach items="${blog_setting}" var="set">
						            <c:if test="${set.blog_category eq 'T' }">
						            <div class="profile-content">
							            <span class="config-name">${set.config_name }</span>
							            <span> : </span>
							            <span class="config-value">${set.config_value }</span>
							            <span class="checkbox-group">
									        <label><input type="checkbox" 
									        <c:if test="${set.isVisible eq 'T' }">checked="checked"</c:if> 
									        > 숨기기</label>
									        <label><input type="checkbox"
									        <c:if test="${set.isMain eq 'T' }">checked="checked"</c:if> 
									        > 메인노출여부</label>
									        <label><button class="btn btn-success config-modify-btn" data-area="${set.blog_category }">수정</button></label>
									        <label><button class="btn btn-danger config-delete-btn" data-user_id="${set.user_id}" data-config_name="${set.config_name}">삭제</button></label>
									    </span>
						            </div>
						            </c:if>
						            </c:forEach>
						        </div>
						        <div id="profile-middle" class="profile-section">
						            <h3 class="text-end">연락처
						            <button class="btn btn-primary blog-setting-btn" ><i class="fa fa-pen-to-square">수정</i></button>
						            <button class="btn btn-success blog-setting-btn"><i class="fa fa-pen-to-square">수정완료</i></button>
						            <button class="btn btn-info blog-setting-btn btn-setting-insert" data-area="M"><i class="fa fa-pen-to-square">추가하기</i></button>
						            </h3>
						            <c:forEach items="${blog_setting}" var="set">
						            <c:if test="${set.blog_category eq 'M' }">
						            <div class="profile-content">
							            <span class="config-name">${set.config_name }</span>
							            <span> : </span>
							            <span class="config-value">${set.config_value }</span>
							            <span class="checkbox-group">
									        <label><input type="checkbox" 
									        <c:if test="${set.isVisible eq 'T' }">checked="checked"</c:if> 
									        > 숨기기</label>
									        <label><input type="checkbox"
									        <c:if test="${set.isMain eq 'T' }">checked="checked"</c:if> 
									        > 메인노출여부</label>
									        <label><button class="btn btn-success config-modify-btn" data-area="${set.blog_category }">수정</button></label>
									        <label><button class="btn btn-danger config-delete-btn" data-user_id="${set.user_id}" data-config_name="${set.config_name}">삭제</button></label>
									    </span>
						            </div>
						            </c:if>
						            </c:forEach>
						        </div>
						        <div id="profile-bottom" class="profile-section">
						            <h3 class="text-end">웹사이트 및 소셜 링크
						            <button class="btn btn-primary blog-setting-btn" ><i class="fa fa-pen-to-square">수정</i></button>
						            <button class="btn btn-success blog-setting-btn"><i class="fa fa-pen-to-square">수정완료</i></button>
						            <button class="btn btn-info blog-setting-btn btn-setting-insert" data-area="B"><i class="fa fa-pen-to-square">추가하기</i></button>
						            </h3>
						            <c:forEach items="${blog_setting}" var="set">
						            <c:if test="${set.blog_category eq 'B' }">
						            <div class="profile-content">
							            <span class="config-name">${set.config_name }</span>
							            <span> : </span>
							            <span class="config-value"><a href="${set.config_value }">${set.config_value }</a></span>
							            <span class="checkbox-group">
									        <label><input type="checkbox" 
									        <c:if test="${set.isVisible eq 'T' }">checked="checked"</c:if> 
									        > 숨기기</label>
									        <label><input type="checkbox"
									        <c:if test="${set.isMain eq 'T' }">checked="checked"</c:if> 
									        > 메인노출여부</label>
									        <label><button class="btn btn-success config-modify-btn" data-area="${set.blog_category }">수정</button></label>
									        <label><button class="btn btn-danger config-delete-btn" data-user_id="${set.user_id}" data-config_name="${set.config_name}">삭제</button></label>
									    </span>
						            </div>
						            </c:if>
						            </c:forEach>
						        </div>
								<!-- 프로필 끝  -->
							</div>
						</div>
					</div>
					<div class="tab-pane" id="tab3">
						<div class="container">
							 <div class="profile-end">
						       	<div class="blog-control">
						       		<div class="blog-control">
							            <h3 class="text-end">사진</h3>
							            <div class="photo-main-grid">
							            	<!-- 더 많은 이미지가 필요하면 이곳에 추가 -->
							            	<c:forEach items="${list}" var="pictureVo2">
							             		<c:if test="${not empty pictureVo2.fileList }">
									             <c:forEach items="${pictureVo2.fileList}" var="file" varStatus="innerstatus" begin="0" end="0">
									                <div class="photo"><a data-toggle="modal" data-target="#pictureModal${pictureVo2.blog_no}" ><img src="/display?file_name=${file.file_path }/${file.uuid}_${file.file_name}" class="d-block w-100" alt="First Image"></a></div>
									                <c:set var="detailVo" value="${pictureVo2}"></c:set>
													<%@ include file="/WEB-INF/views/hc/include/picture_modal.jsp" %>
									             </c:forEach>
								             	</c:if>
							            	</c:forEach>
							            </div>
				        			</div>
					            </div>
						     </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 탭팬 부분끝  -->
</div>



<script>
$(function () {
	// 더보기 버튼 클릭 이벤트 설정
    $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
        // 기존 활성화된 탭에서 active 클래스 제거
        $('.nav-link').removeClass('active');
        // 클릭한 탭에 active 클래스 추가
        let targetTab = $(this).attr("data-tab");
        $(targetTab).addClass('active');
    });

    // 더보기 버튼 클릭 이벤트 재설정 함수
    function setMoreButtonEvents() {
        $('a[data-tab]').off('click').on('click', function (e) {
            e.preventDefault();
            let targetTab = $(this).attr("data-tab");
            $(targetTab).tab('show');
        });
    }

    // 페이지 로드 시 및 탭 전환 시 더보기 버튼 클릭 이벤트 설정
    setMoreButtonEvents();
    $('a[data-toggle="tab"]').on('shown.bs.tab', function () {
        setMoreButtonEvents();
    });
});
</script>


<%@ include file="/WEB-INF/views/include/bottom.jsp"%>