<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신토불이</title>
    <link rel="stylesheet" href="/resources/css/styles2.css">
</head>
<body>
    <header class="main-header">
        <div class="top-bar">
            <div class="container">
                <div class="announcement" >
                    <a href="#">공지사항[24/07/22] 당첨자발표 | 7월 고기데이 기획전 경품 당첨자</a>
                </div>
                <div class="user-menu">
                    <a href="#">로그인</a>
                    <a href="#">회원가입</a>
                    <a href="#">마이페이지</a>
                    <a href="#">주문조회</a>
                    <a href="#">고객센터</a>
                </div>
            </div>
        </div>
        <div class="middle-bar">
            <div class="container">
                <div class="logo">
                    <a href="/"><img src="/resources/images/logo.png" alt="농사랑 로고"></a>
                </div>
            </div>
        </div>
        <nav class="main-nav" style="background-color: rgb(120, 140, 90);">
            <div class="container " >
                <ul>
                    <li><a href="#">카테고리</a></li>
                    <li><a href="#">정기배송</a></li>
                    <li><a href="#">베스트</a></li>
                    <li><a href="#">신상품</a></li>
                    <li><a href="#">지역특산물</a></li>
                    <li><a href="#">기획전</a></li>
                    <li><a href="#">푸드체험단</a></li>
                    <li><a href="#">상품후기</a></li>
                </ul>
                <div class="search-bar" >
                    <input type="text" placeholder="건강한 청년 쇼핑몰 신토불이!">
                    <a href="#" class="search-icon" style="font-family: 'Verdana', sans-serif; font-weight: 900;">검색</a>
                    <a href="#" class="cart-icon" style="font-family: 'Verdana', sans-serif; font-weight: 900;">장바구니</a>
                </div>
            </div>
        </nav>
    </header>
    <main>
      
    
    
    <script>
	    // 특정 글자 수로 텍스트 자르기
	    function truncateText(selector, maxLength) {
	        const element = document.querySelector(selector);
	        if (element) {
	            let text = element.textContent;
	            if (text.length > maxLength) {
	                element.textContent = text.substring(0, maxLength) + '...';
	            }
	        }
	    }
	
	    window.addEventListener('DOMContentLoaded', function() {
	        truncateText('.announcement a', 35); // 공지사항 텍스트를 50자로 제한
	    });
	
	    window.addEventListener('scroll', function() {
	        var topBar = document.querySelector('.top-bar');
	        var middleBar = document.querySelector('.middle-bar');
	        var mainNav = document.querySelector('.main-nav');
	
	        if (window.scrollY > 50) {
	            topBar.classList.add('hidden');
	            middleBar.classList.add('hidden');
	            mainNav.classList.add('sticky');
	        } else {
	            topBar.classList.remove('hidden');
	            middleBar.classList.remove('hidden');
	            mainNav.classList.remove('sticky');
	        }
	    });
    </script>
  



