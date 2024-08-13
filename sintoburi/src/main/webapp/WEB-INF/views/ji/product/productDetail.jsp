<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<%@ include file="../include/top.jsp"%>



        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6">
                    <!-- Product image -->
                    <c:forEach var="image" items="${images}">
    					<c:if test="${image.pno == product.pno}">
                    		<img class="card-img-top mb-5 mb-md-0" 
<%--                     	src="${pageContext.request.contextPath}/display?fileName=/upload/${images[0].uuid}_${images[0].img_name}"  --%>
<%--                     	 		src="${pageContext.request.contextPath}/display?fileName=/upload/2024/08/13/${image.uuid}_${image.img_name}"  --%>
                    	 		src="${pageContext.request.contextPath}/display?fileName=/upload/${image.uuid}_${image.img_name}" 
                    			alt="${product.name}" />
                    	</c:if>
       				 </c:forEach>
                    </div>
                    <div class="col-md-6">
                        <h1 class="display-5 fw-bolder">${product.name}</h1>
                        <div class="fs-5 mb-5">
                            <span class="text-decoration-line-through">${product.price}원</span>
                        </div>
                        <p class="lead">${product.content}</p>
                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                장바구니 담기
                            </button>
                            <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                <i class="bi-cart-fill me-1"></i>
                                바로구매>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- //Product section-->
        
        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">판매자 연관 상품</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image -->
                            <img class="card-img-top" src="/resources/images/carrot.jpg" alt="..." />
                            <!-- Product details -->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name -->
                                    <h5 class="fw-bolder">! 연관 상품 !</h5>
                                    <!-- Product price -->
                                    ! 상품 가격 !
                                </div>
                            </div>
                            <!-- Product actions -->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col mb-5">
                        <div class="card h-100" > <!-- 여기에 이동 링크 추가 -->
                            <!-- Product image -->
                            <a href="#"><img class="card-img-top" src="/resources/images/carrot.jpg" alt="당근"/></a>
                            <!-- Product details -->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name -->
                                    <h5 class="fw-bolder">신선한 당근</h5>
                                    <!-- Product price -->
                                    ₩5000
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </section>
        <!-- Related items section -->
        
        <div class="row align-items-center">
			<div class="col-md-12">
				<div class="tabbable" id="tabs-358860">
					<ul class="nav nav-tabs">
						<li class="nav-item">
							<a class="nav-link" href="#tab1" data-toggle="tab">상품상세</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active show" href="#tab2" data-toggle="tab">상품평</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active show" href="#tab3" data-toggle="tab">후기</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active show" href="#tab4" data-toggle="tab">배송/교환/반품 안내</a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="panel-352714">
							<p>
								상품상세
							</p>
						</div>
						<div class="tab-pane" id="tab2">
							<p>
								상품평
							</p>
						</div>
						<div class="tab-pane" id="tab3">
							<p>
								상품문의
							</p>
						</div>
						<div class="tab-pane" id="tab4">
							<p>
								배송/교환/반품 안내
							</p>
						</div>
					</div>
				</div>
			</div>
		</div> -->
        
<%@ include file="../include/bottom.jsp"%>
</html>
