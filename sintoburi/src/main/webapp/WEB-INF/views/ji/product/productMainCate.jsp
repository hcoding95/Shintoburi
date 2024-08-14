<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- <%@ include file="../include/top.jsp"%> --%>
<%@ include file="../test/top2.jsp"%>



		<section class="py-5 product-list">
<!--             	<div class="btn test"> -->
<!--             		<button class="btn btn-outline"> 테스트 버튼</button> -->
<!--             	</div> -->
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <c:forEach items="${cate1List}" var="productVo" varStatus="status" begin="0" end="3">
                    <div class="col mb-5">
                        <div class="card h-100">
							<a href="/product/productDetail?pno=${productVo.pno}">
                            <!-- Product image-->
                            <img class="card-img-top" 
                    		src="${pageContext.request.contextPath}/display?fileName=/upload/${imageList1[status.index].uuid}_${imageList1[status.index].img_name}"
                    		alt="${productVo.name}"/> 
                            </a>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${productVo.name}</h5>
                                    <!-- Product price-->
                                    ${productVo.price} 원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">사용자 아이디(추가예정)</a></div>
                            </div>
                        </div>
                    </div>
                 </c:forEach>
			     </div>
		     </div>
			     
			     <!-- testSection -->
			     <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <c:forEach items="${cate2List}" var="productVo" varStatus="status" begin="0" end="3">
                    <div class="col mb-5">
                        <div class="card h-100">
							<a href="/product/productDetail?pno=${productVo.pno}">
                            <!-- Product image-->
                            <img class="card-img-top" 
                    		src="${pageContext.request.contextPath}/display?fileName=/upload/${imageList2[status.index].uuid}_${imageList2[status.index].img_name}"
                    		alt="${productVo.name}"/> 
                            </a>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${productVo.name}</h5>
                                    <!-- Product price-->
                                    ${productVo.price} 원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">사용자 아이디(추가예정)</a></div>
                            </div>
                        </div>
                    </div>
                 </c:forEach>
			     </div>
		     </div>
			     <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <c:forEach items="${cate3List}" var="productVo" varStatus="status" begin="0" end="3">
                    <div class="col mb-5">
                        <div class="card h-100">
							<a href="/product/productDetail?pno=${productVo.pno}">
                            <!-- Product image-->
                            <img class="card-img-top" 
                    		src="${pageContext.request.contextPath}/display?fileName=/upload/${imageList3[status.index].uuid}_${imageList3[status.index].img_name}"
                    		alt="${productVo.name}"/> 
                            </a>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${productVo.name}</h5>
                                    <!-- Product price-->
                                    ${productVo.price} 원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">사용자 아이디(추가예정)</a></div>
                            </div>
                        </div>
                    </div>
                 </c:forEach>
			     </div>
		     	 </div>
			     <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <c:forEach items="${cate4List}" var="productVo" varStatus="status" begin="0" end="3">
                    <div class="col mb-5">
                        <div class="card h-100">
							<a href="/product/productDetail?pno=${productVo.pno}">
                            <!-- Product image-->
                            <img class="card-img-top" 
                    		src="${pageContext.request.contextPath}/display?fileName=/upload/${imageList4[status.index].uuid}_${imageList4[status.index].img_name}"
                    		alt="${productVo.name}"/> 
                            </a>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${productVo.name}</h5>
                                    <!-- Product price-->
                                    ${productVo.price} 원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">사용자 아이디(추가예정)</a></div>
                            </div>
                        </div>
                    </div>
                 </c:forEach>
			     </div>
			     <!-- // testSection -->
				</div>
        </section>
        
<%-- <%@ include file="../include/bottom.jsp"%> --%>
<%@ include file="../test/bottom2.jsp"%>

