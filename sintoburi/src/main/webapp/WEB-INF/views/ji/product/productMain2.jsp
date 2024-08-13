<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/include/top.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <body>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row row-cols-1 row-cols-md-4 g-4">
				    <c:forEach items="${list}" var="productVo">
				        <div class="col">
				            <div class="card h-100"> 
				                <!-- Product image -->
				                <a href="/product/productDetail?pno=${productVo.pno}"><img class="card-img-top" src="/resources/images/vegetables/carrot.jpg" alt="${productVo.name}"/></a>
				                <!-- Product details -->
				                <div class="card-body p-4">
				                    <div class="text-center">
				                        <!-- Product name -->
				                        <h5 class="fw-bolder">${productVo.name}</h5>
				                        <!-- Product price -->
				                        ₩${productVo.price}
				                    </div>
				                </div>
				            </div>
				        </div>
				    </c:forEach>
				</div>
            </div>
        </section>
    </body>
<%@ include file="/WEB-INF/views/include/bottom.jsp"%>
</html>
