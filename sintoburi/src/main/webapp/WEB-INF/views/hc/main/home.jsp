<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/hc/main.css">
<!-- 글리피콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
	
	$(document).on("click",".open-modal",function(){
		let blog_no = $(this).data("blog_no");
		$("#myIframe").attr("src", "/hc/blog/detail?blog_no=" + blog_no);
		$(".modal-left").empty();
		$.ajax({
			type : "get",
			url : "/hc/product/getListByBlogNo",
			data : {"blog_no" : blog_no},
			success : function (rData) {
				
				$.each(rData, function (index, obj) {
					let tag = `
						<div class="cover">
	            			<a href="#"><img src="/resources/images/logo.png" alt="Icon 1">\${obj.product_id}</a>
	            		</div>`;
					$(".modal-left").append(tag);
				})
			}
		});
		$("#myModal").modal("show");
	});
	
	// 모달이 열릴 때마다 실행 
    $('#myModal').on('show.bs.modal', function () {
        let iframe = $(this).find('iframe');
        let src = iframe.attr('src'); // 현재 src를 가져와서
        iframe.attr('src', ''); // 잠시 빈 값으로 변경한 후
        iframe.attr('src', src); // 다시 원래 src로 복원하여 새로고침 효과
    });
	
	
	
	
	
});
</script>
<%@ include file="/WEB-INF/views/hc/include/modal.jsp" %>
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
<%--                  <a data-toggle="modal" data-target="#myModal${vo.blog_no}"><img src="/display?file_name=${file.file_path }/${file.uuid}_${file.file_name}" class="d-block w-100" alt="First Image"></a> --%>
                 <a class="open-modal" data-blog_no="${vo.blog_no}"><img src="/display?file_name=${file.file_path }/${file.uuid}_${file.file_name}" class="d-block w-100" alt="First Image"></a>
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
           <div><a href="/hc/blog/blog?user_id=${vo.user_id}">${vo.user_name}</a></div>
           <div><c:choose> <c:when test="${empty vo.updatedate}"><fmt:formatDate value="${vo.regdate}" pattern="yyyy.MM.dd hh:mm"/></c:when>
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
        <button id="likeBtn${vo.blog_no}" class="likeBtn" data-blog_no="${vo.blog_no}" data-liked="${vo.checkLike}"><c:choose>
        	<c:when test="${vo.checkLike eq true }">
        	<i class="fa-solid fa-thumbs-up">좋아요</i>
        	</c:when>
        	<c:otherwise>
        	<i class="fa-regular fa-thumbs-up">좋아요</i>
        	</c:otherwise>
        	</c:choose></button>
        <button><a class="open-modal" data-blog_no="${vo.blog_no}"><i class="fa fa-comment">댓글 달기</i></a></button>
        <button><i class="fa fa-exclamation-triangle">신고하기</i></button>
        <button><c:choose>
        	<c:when test="${vo.user_id eq login.user_id }">
        	<a href="/hc/blog/modify_form?blog_no=${vo.blog_no}"><i class="fa fa-pen-to-square">수정하기</i></a>
        	</c:when>
        	<c:otherwise>
        	<a href="/hc/blog/register"><i class="fa fa-pen-to-square">글쓰기</i></a>
        	</c:otherwise>
        </c:choose></button>
    </div>
</div>

</c:forEach>    
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
