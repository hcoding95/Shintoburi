<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/top.jsp"%>



<!-- 		<section class="py-5 "> -->
			<h2>cate_2</h2>
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                
                <c:forEach items="${cate1List}" var="productVo" varStatus="status">
                    <div class="col mb-5">
                        <div class="card h-100">
							<a href="/product/productDetail?pno=${productVo.pno}">
                            <!-- Product image-->
                            <img class="card-img-top" 
<%--                     		src="${pageContext.request.contextPath}/display?fileName=/upload/2024/08/13/${imageList[status.index].uuid}_${imageList[status.index].img_name}" --%>
                    		src="${pageContext.request.contextPath}/display?fileName=/upload/${imageList[status.index].uuid}_${imageList[status.index].img_name}"
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
                    <c:if test="${status.index % 4 == 3}">
		                </div><div class="row gx-4 gx-lg-5">
		            </c:if>
                 </c:forEach>
				    </div>
				
				    <!-- Repeat the above block for other categories -->
				    <h2>Category 2</h2>
				    <div class="row gx-4 gx-lg-5">
				        <c:forEach var="product" items="${cate2Products}" varStatus="status">
				            <!-- Repeat the card structure as above -->
				        </c:forEach>
				    </div>
				
				    <h2>Category 3</h2>
				    <div class="row gx-4 gx-lg-5">
				        <c:forEach var="product" items="${cate3Products}" varStatus="status">
				            <!-- Repeat the card structure as above -->
				        </c:forEach>
				    </div>
				
				    <h2>Category 4</h2>
				    <div class="row gx-4 gx-lg-5">
				        <c:forEach var="product" items="${cate4Products}" varStatus="status">
				            <!-- Repeat the card structure as above -->
				        </c:forEach>
				    </div>
				</div>
<!--         </section> -->
<%@ include file="../include/bottom.jsp"%>
<!-- </html> -->
<!-- --------------------------------------------------------------------------------------------------------------------->

