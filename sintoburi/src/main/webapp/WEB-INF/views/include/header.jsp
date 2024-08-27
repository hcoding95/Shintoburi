<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />

<!--         <title>Shop Homepage - Start Bootstrap Template</title> -->
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
            
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/styles.css" rel="stylesheet" />
        

  <!-- 서머노트(게시판 에디터CDN) -->
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">

 <!-- /서머노트 -->
 
<script>
              
                      
</script>
 
   </head>
    
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
        
            <div class="container px-4 px-lg-5">   
        
        <div>
		<img src="/resources/images/logo.png" alt="농사랑 로고" style="width:56px;height:44px;">
  		<span style="margin-top:20px;font-size:22px;" >신토불이 - 커뮤니티</span>
		</div>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">홈</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">도움말</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">모든상품</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">인기상품</a></li>
                                <li><a class="dropdown-item" href="#!">신상품</a></li>
                            </ul>
                        </li>
                    </ul>
                    
                  
						<a href="/ds/board/register">회원가입</a>
					
                    
                    	<nav class="navbar navbar-light bg-">
						<div class="container-fluid">
							<form class="d-flex">
							
								<input class="form-control me-2" type="search" placeholder="검색"
									aria-label="Search">
								<button class="btn btn-outline-success" type="submit">
									<i class="bi bi-search"></i>
								</button>
							</form>
						</div>
					</nav>
                    <form class="d-flex">
					
			
					<button class="btn btn-outline-success" style="margin-right:10px;" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            장바구니
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                        
                    <div>
               
                    <c:choose>
                      <c:when test="${not empty login.user_id}">
                        <a class="btn btn-outline-danger" href="/ds/user/logout"  id="logout">
                            <i class="bi bi-box-arrow-in-right"></i>
                            로그아웃
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </a>
                      </c:when>
                      <c:otherwise>
                       
                        
                         <a class="btn btn-outline-primary" href="/ds/board/login"  id="login">
                            <i class="bi bi-box-arrow-in-left"></i>
                            로그인
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </a>
                        </c:otherwise>
                      </c:choose>
                         
                      </div> 
                      
                
                      
                    </form>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-success py-1" ">
            <div class="container px-8 px-lg-0.1 my-0.1">
<!-- 커뮤니티 메뉴 -->
<div class="row" style="margin-left:50px; margin-top:12px; " >
		<div class="col-md-12">
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<a href="/ds/board/index" style="color:white;">홈화면</a>
					</li>
<!-- 					<li class="breadcrumb-item"> -->
<!-- 						<a href="#" style="color:white;">자유게시판</a> -->
<!-- 					</li> -->
<!-- 					<li class="breadcrumb-item"> -->
<!-- 						<a href="#" style="color:white;">갤러리</a> -->
<!-- 					</li> -->
					<li class="breadcrumb-item">
						<a href="javascript:void(0);" onclick="openChatPopup();"  style="color:white;">채팅</a>
					</li>
					<li class="breadcrumb-item">
						<a href="javascript:void(0);" onclick="openEventPopup();"   style="color:white;">이벤트</a>
					</li>
					
<!-- 					<li class="breadcrumb-item"> -->
<!-- 					<a href="/ds/board/test" style="color:white;">테스트</a> -->
<!-- 					</li> -->
				</ol>
			</nav>
		</div>
	</div>
<!-- /커뮤니티 메뉴 -->	

<script>
function openEventPopup(){
	
	if(${login.user_id==null}){
		alert("로그인을 해주세요");
		return;
	}
	
    let url = "/ds/board/event";
    let name = "이벤트";
    let option = "width=600,height=700,top=100,left=200"
    window.open(url, name, option);
    console.log("이벤트실행");
    
}


function openChatPopup(){
	if(${login.user_id==null}){
		alert("로그인을 해주세요");
		return;
	}
	
    let url = "/ds/board/chat";
    let name = "채팅";
    let option = "width=600,height=610,top=100,left=200"
    window.open(url, name, option);
    console.log("채팅실행");
    
}




</script>

  </div>
</header>