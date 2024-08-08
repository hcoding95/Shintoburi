<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/hc/main.css">
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
<!-- 메인 보여줄것 -->
<div class="post-container">
     <!-- 카루셀 시작 -->
     <div id="imageCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
         <div class="carousel-inner">
             <div class="carousel-item active">
                 <img src="/resources/images/logo.png" class="d-block w-100" alt="First Image">
             </div>
             <div class="carousel-item">
                 <img src="/resources/images/1.png" class="d-block w-100" alt="Second Image">
             </div>
             <div class="carousel-item">
                 <img src="/resources/images/2.png" class="d-block w-100" alt="Third Image">
             </div>
             <!-- 더 많은 이미지가 필요하면 이곳에 추가 -->
         </div>
         <a class="carousel-control-prev" href="#imageCarousel" role="button" data-slide="prev">
             <span class="carousel-control-prev-icon" aria-hidden="true"></span>
             <span class="sr-only">Previous</span>
         </a>
         <a class="carousel-control-next" href="#imageCarousel" role="button" data-slide="next">
             <span class="carousel-control-next-icon" aria-hidden="true"></span>
             <span class="sr-only">Next</span>
         </a>
     </div>
     <!-- 카루셀 끝 -->
     <div class="post-icons">
         <a href="#"><img src="path_to_icon1.jpg" alt="Icon 1"></a>
         <a href="#"><img src="path_to_icon2.jpg" alt="Icon 2"></a>
         <a href="#"><img src="path_to_icon3.jpg" alt="Icon 3"></a>
         <a href="#"><img src="path_to_icon4.jpg" alt="Icon 4"></a>
     </div>
     <div class="post-user-info">
  	  <div class="user-details">
       <img src="/resources/images/logo.png" alt="User Image">
       <div class="user-info-text">
           <div>유저 이름</div>
           <div>게시 시간</div>
       </div>
     </div>
     <div class="user-stats">
       <div>좋아요(기호) <span>좋아요 갯수</span></div>
       <div>팔로워 수 <span>팔로워 수</span></div>
     </div>
</div>
    <div class="post-content">
         내용 2줄 이상 길어지면 <a href="#">더보기</a>
    </div>
    <div class="post-actions">
        <button>좋아요</button>
        <button>댓글 달기</button>
        <button>신고하기</button>
        <button>공유하기</button>
    </div>
</div>
<!-- 메인 컨텐츠 끝 -->

<script>
    let page = 1;

   /*  function loadMoreContent() {
        $.ajax({
            url: 'load_more_content.php', // 서버 스크립트 경로
            type: 'GET',
            data: { page: page },
            success: function(response) {
                $('#content').append(response);
                page++;
            }
        });
    } */

    $(window).scroll(function() {
        if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
            //loadMoreContent();
            console.log("맨밑 감지");
        }
    });
</script>

<%@ include file="/WEB-INF/views/include/bottom.jsp"%>
