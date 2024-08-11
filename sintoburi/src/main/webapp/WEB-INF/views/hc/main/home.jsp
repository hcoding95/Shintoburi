<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/hc/main.css">
<!-- 글리피콘 -->
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<!-- 이벤트  -->
<div class="row">
	<div class="col-md-12">
		<div class="carousel slide" id="carousel-514190" data-ride="carousel"
			data-interval="5000">
			<ol class="carousel-indicators">
				<li data-slide-to="0" data-target="#carousel-514190" class="active">
				</li>
				<li data-slide-to="1" data-target="#carousel-514190"></li>
				<li data-slide-to="2" data-target="#carousel-514190"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" alt="Carousel Bootstrap First"
						src="https://www.layoutit.com/img/sports-q-c-1600-500-1.jpg" />
					<div class="carousel-caption">
						<h4>First Thumbnail label</h4>
						<p>Cras justo odio, dapibus ac facilisis in, egestas eget
							quam. Donec id elit non mi porta gravida at eget metus. Nullam id
							dolor id nibh ultricies vehicula ut id elit.</p>
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" alt="Carousel Bootstrap Second"
						src="https://www.layoutit.com/img/sports-q-c-1600-500-2.jpg" />
					<div class="carousel-caption">
						<h4>Second Thumbnail label</h4>
						<p>Cras justo odio, dapibus ac facilisis in, egestas eget
							quam. Donec id elit non mi porta gravida at eget metus. Nullam id
							dolor id nibh ultricies vehicula ut id elit.</p>
					</div>
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" alt="Carousel Bootstrap Third"
						src="https://www.layoutit.com/img/sports-q-c-1600-500-3.jpg" />
					<div class="carousel-caption">
						<h4>Third Thumbnail label</h4>
						<p>Cras justo odio, dapibus ac facilisis in, egestas eget
							quam. Donec id elit non mi porta gravida at eget metus. Nullam id
							dolor id nibh ultricies vehicula ut id elit.</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carousel-514190"
				data-slide="prev"><span class="carousel-control-prev-icon"></span>
				<span class="sr-only">Previous</span></a> <a
				class="carousel-control-next" href="#carousel-514190"
				data-slide="next"><span class="carousel-control-next-icon"></span>
				<span class="sr-only">Next</span></a>
		</div>
	</div>
</div>
<div>


</div>
<!-- 이벤트  끝 -->
<style>
/* 부모 요소를 화면의 전체 높이를 차지하도록 설정하고, 세로 중앙 정렬 */
.story-container-wrapper {
    display: flex;
    justify-content: center; /* 가로 중앙 정렬 제거 */
    align-items: center; /* 세로 중앙 정렬 */
    width: 100%;
    box-sizing: border-box;
    margin-bottom: 20px;
}

.story-card {
    display: flex;
    align-items: center;
    padding: 10px 20px;
    width: 400px;
    border-radius: 10px;
    background-color: white;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.story-icon {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 40px;
    height: 40px;
    margin-right: 15px;
    border-radius: 50%;
    background-color: #e7f3ff;
    color: #007bff;
    font-size: 24px;
    font-weight: bold;
}

.story-text {
    display: flex;
    flex-direction: column;
}

.story-text strong {
    font-size: 16px;
    color: #333;
}

.story-text span {
    font-size: 14px;
    color: #666;
}
</style>
<!-- 글쓰기 탭  -->
<div class="story-container-wrapper">	
	<a href="/hc/blog/register">
    <div class="story-card">
        <div class="story-icon">
            <span>+</span>
        </div>
        <div class="story-text">
            <strong>스토리 만들기</strong><br>
            <span>사진을 공유하거나 글을 남겨보세요.</span>
        </div>
    </div>
    </a>
</div>
<!-- 글쓰기 탭 끝 -->



<!-- 메인의 내용 시작 -->
<div class="post-container">
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
     <div class="post-icons">
         <a href="#"><img src="/resources/images/logo.png" alt="Icon 1"></a>
         <a href="#"><img src="/resources/images/logo.png" alt="Icon 1"></a>
         <a href="#"><img src="/resources/images/logo.png" alt="Icon 1"></a>
         <a href="#"><img src="/resources/images/logo.png" alt="Icon 1"></a>
     </div>
     <div class="post-user-info">
  	  <div class="user-details">
       <img src="/resources/images/logo.png" alt="User Image">
       <div class="user-info-text">
           <div><a href="/hc/blog/blog">유저 이름</a></div>
           <div>게시 시간</div>
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
         내용 2줄 이상 길어지면 <a href="#">더보기</a>
    </div>
    <div class="post-actions">
        <button><i class="fa-solid fa-thumbs-up">좋아요</i> </button>
        <button><i class="fa fa-comment">댓글 달기</i></button>
        <button><i class="fa fa-exclamation-triangle">신고하기</i></button>
        <button><a href="/hc/blog/register"><i class="fa fa-pen-to-square">수정하기</i></a></button>
        <!-- <button><a href="/hc/blog/register"><i class="fa fa-pen-to-square">글쓰기</i></a></button> -->
    </div>
    
<!-- 메인 내용 끝 -->

<script>
    let page = 1;
    $(window).scroll(function() {
        if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
            console.log("맨밑 감지");
        }
    });
</script>

<%@ include file="/WEB-INF/views/include/bottom.jsp"%>
