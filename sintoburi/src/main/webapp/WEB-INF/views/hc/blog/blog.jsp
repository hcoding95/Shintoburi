<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/hc/main.css">
<!-- 글리피콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

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
            margin-bottom: 10px;
        }
        .profile-section span {
            font-weight: bold;
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
            <h2>이름</h2>
            <div class="profile-text">
                <p>좋아요 갯수 <span>12</span></p>
                <p>팔로워 갯수 <span>121</span></p>
            </div>
        </div>
        <div class="profile-actions ">
             <button>글쓰기</button>
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
					            <p>출신</p>
					            <p>위치</p>
					            <p>이메일</p>
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
							           <div><a href="/hc/blog/blog">${vo.user_id}</a></div>
							           <div><c:choose> <c:when test="${empty vo.updatedate}"><fmt:formatDate value="${vo.regdate}" pattern="yyyy.MM.dd hh:mm"/></c:when>
							           	<c:otherwise><fmt:formatDate value="${vo.updatedate}" pattern="yyyy.MM.dd hh:mm"/>수정</c:otherwise>
							            </c:choose></div>
							       </div>
							     </div>
							     <div class="user-stats">
							       <div><i class="fa fa-thumbs-up">좋아요</i><span>1000</span></div>
							       <!-- 좋아요 눌렀을때 <i class="fa-solid fa-thumbs-up"></i> -->
							       <div><i class="fa fa-handshake">팔로워</i><span>10000</span></div>
							       <!-- 팔로우 눌렀을때<i class="fa-solid fa-handshake"></i> -->
							     </div>
							</div>
							    <div class="post-content">
							         ${vo.blog_content} <a href="#">더보기</a>
							    </div>
							    <div class="post-actions">
							        <button><i class="fa-solid fa-thumbs-up">좋아요</i> </button>
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
						            <h3 class="text-end">(유저)님의 프로필</h3>
						            <div><span>유저 계급:</span> 계급명</div>
						            <div><span>주요 작물:</span> 작물명</div>
						            <div><span>출생연도:</span> 1990년</div>
						            <div><span>생일:</span> 1월 1일</div>
						            <div><span>성별:</span> 여성</div>
						        </div>
						        <div class="profile-section">
						            <h3 class="text-end">연락처</h3>
						            <div><span>전화 번호:</span> 010-1234-5678</div>
						            <div><span>이메일:</span> jane.doe@example.com</div>
						            <div><span>주소:</span> 서울시 강남구</div>
						        </div>
						        <div class="profile-section">
						            <h3 class="text-end">웹사이트 및 소셜 링크</h3>
						            <div><a href="https://example.com" target="_blank">어쩌구 저쩌구 사이트</a></div>
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
							            	<c:forEach items="${list}" var="pictureVo">
							             		<c:if test="${not empty pictureVo.fileList }">
									             <c:forEach items="${pictureVo.fileList}" var="file" varStatus="innerstatus" begin="0" end="0">
									                <div class="photo"><a data-toggle="modal" data-target="#myModal${pictureVo.blog_no}" ><img src="/display?file_name=${file.file_path }/${file.uuid}_${file.file_name}" class="d-block w-100" alt="First Image"></a></div>
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