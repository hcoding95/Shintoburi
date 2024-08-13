<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
    <style>
      .product img {
            width: 100%;
            height: 150px; 
            object-fit: cover; 
        }
        .card {
            height: 400px; 
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .card h4 {
            font-size: 1.2rem; 
            margin-top: 10px;
        }
        .card p {
            font-size: 1rem; 
        }
        .card .btn {
            margin-bottom: 10px; 
        }
        .content {
        	padding-top: 70px; 
    	}
    </style>
</head>
<body>
   	<!-- product list -->
   	<div class="content">
	   	<div class="container px-4 px-lg-5 mt-5">
<!-- 		    <div class="row gx-5 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center"> -->
		        <div class="row gx-3 gy-4 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
		        <div class="col mb-5">
		            <div class="card h-100 product text-center">
		                <img src="/resources/images/carrot.jpg" alt="당근">
		                <h4>당근</h4>
		                <p>₩5000</p>
		                <div class="text-center"><a class="btn btn-outline-dark " href="#">장바구니 담기</a></div>
		            </div>
		        </div>
		        
		        <div class="col mb-5">
		            <div class="card h-100 product text-center">
		                <img src="/resources/images/brocoli.jpg" alt="브로콜리">
		                <h4>브로콜리</h4>
		                <p>₩7000</p>
		                <div class="text-center"><a class="btn btn-outline-dark " href="#">장바구니 담기</a></div>
		            </div>
		        </div>
		        
		        <div class="col mb-5">
		            <div class="card h-100 product text-center">
		                <img src="/resources/images/garlic.jpg" alt="마늘">
		                <h4>마늘</h4>
		                <p>₩8000</p>
		                <div class="text-center"><a class="btn btn-outline-dark " href="#">장바구니 담기</a></div>
		            </div>
		        </div>
		        
		        <div class="col mb-5">
		            <div class="card h-100 product text-center">
		                <img src="/resources/images/lettuce.jpg" alt="상추">
		                <h4>상추</h4>
		                <p>₩10000</p>
		                <div class="text-center"><a class="btn btn-outline-dark " href="#">장바구니 담기</a></div>
		            </div>
		        </div>
		        
		        <div class="col mb-5">
		            <div class="card h-100 product text-center">
		                <img src="/resources/images/pimento.jpg" alt="피망">
		                <h4>피망</h4>
		                <p>₩9000</p>
		                <div class="text-center"><a class="btn btn-outline-dark " href="#">장바구니 담기</a></div>
		            </div>
		        </div>

		        <div class="col mb-5">
		            <div class="card h-100 product text-center">
		                <img src="/resources/images/potato.jpg" alt="감자">
		                <h4>감자</h4>
		                <p>₩9000</p>
		                <div class="text-center"><a class="btn btn-outline-dark " href="#">장바구니 담기</a></div>
		            </div>
		        </div>
		        
		        <div class="col mb-5">
		            <div class="card h-100 product text-center">
		                <img src="/resources/images/sweetpotato.jpg" alt="고구마">
		                <h4>고구마</h4>
		                <p>₩9000</p>
		                <div class="text-center"><a class="btn btn-outline-dark " href="#">장바구니 담기</a></div>
		            </div>
		        </div>
		        
		        <div class="col mb-5">
		            <div class="card h-100 product text-center">
		                <img src="/resources/images/tomato.jpg" alt="토마토">
		                <h4>토마토</h4>
		                <p>₩9000</p>
		                <div class="text-center"><a class="btn btn-outline-dark " href="#">장바구니 담기</a></div>
		            </div>
		        </div>
		        
		        
		        <!-- 상품 리스트 -->
			</div>
		</div>
	</div>
</body>
    <%@ include file="/WEB-INF/views/include/bottom.jsp"%>
</html>