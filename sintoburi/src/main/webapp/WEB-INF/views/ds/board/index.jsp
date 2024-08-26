<%@ include file="/WEB-INF/views/include/header.jsp" %>
        
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
    
    <script>
    
    $(function(){
    	$("#vegeStory").click(function(){
    		$("#newPost").css("display","none");
    		$("#recipePost").css("display","none");
    		$("#vegePost").css("display","block");
    	});
     	$("#recipeStory").click(function(){
    		$("#newPost").css("display","none");
    		$("#vegePost").css("display","none");
    		$("#recipePost").css("display","block");
    		
    	});
     	
    	$("#newStory").click(function(){
    		$("#vegePost").css("display","block");
    		$("#recipePost").css("display","block");
    		$("#newPost").css("display","block");
    		
    		
    	});
    	
    })
    // gallery보기 list보기
    </script>

     <body> 
     
      <ul class="buttonMenu" style="margin-left:300px;">
         <p style="font-weight:bold; font-size:20px;">둘러보기</p>
            <button type="button" class="btn btn" style="background-color:rgb(247, 247, 247);margin-right:10px;" id="newStory">
            <span style="font-weight:500;">최신글</span>
            </button>
            
            <button type="button" class="btn btn" style="background-color:rgb(247, 247, 247);margin-right:10px;" id="vegeStory">
            <span style="font-weight:500;">농산물 이야기</span>
            </button>
            
            <button type="button" class="btn btn" style="background-color:rgb(247, 247, 247);margin-left:3px;" id="recipeStory">
            <span style="font-weight:500; ">레시피 이야기</span>
            </button>
            
            <c:if test="${not empty login.user_id}">
              <a class="btn btn-outline-primary" style="margin-left:720px;" href="/ds/board/write">
                <i class="bi bi-pencil-square"></i>글쓰기
          	 </a>
          	 </c:if>
         </ul>

        <!-- Section-->
        <section class="py-1" id="newPost">
        
         <div class="container px-4 px-lg-5 mt-5">
          
     
        
         	

                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" >
                    <c:forEach var="i" begin="0" end="7">
					<!-- 리스트가 비어있으면 건너뜀 -->
                    <c:if test="${not empty list[i].bno}">
                    <div class="col mb-5">
                        <div class="card h-10">
                            <!-- Product image-->
<!--                             <img class="card-img-top"  src="/resources/images/vege.jpg" alt="..." /> -->
                            <!-- Product details-->
                            <div class="card-body p-4">
                      
                          <a href="/ds/board/read?bno=${list[i].bno}"><img class="card-img-top" style="width:200px;height:150px;" src="${list[i].thumbnail}" alt="..." /></a> 
                            
                                <div class="text-center">
                                    <!-- Product name-->
                                    <a class="fw-bolder" href="/ds/board/read?bno=${list[i].bno}">${list[i].title}</a>
                                    <br>
                                    <!-- Product price-->
                                    <p>조회수${list[i].view_count}</p>
                                   
                                </div>
                            </div>
                         
                        </div>
                    </div>
                    </c:if>
                        </c:forEach>
                </div>
            </div>
         
        </section>
        
        <!-- Section 농산물-->
        <section class="py-1" id="vegePost">
         <div class="container px-4 px-lg-5 mt-5">
           
         
         <ul class="menu" style="margin-right:50px;">
        
         
          <div>
		<img src="/resources/images/salad.png" alt="농산물 이야기" style="width:56px;height:44px;">
  		<span style="margin-top:20px;font-size:22px;" >농산물 이야기</span>
		</div>
         
            
         </ul>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach var="BoardVo" items="${list}">
                      <c:if test="${BoardVo.category=='농산물 이야기'}">
                    <div class="col mb-5">
                        <div class="card h-10">
                            <!-- Product image-->
<!--                             <img class="card-img-top"  src="/resources/images/vege.jpg" alt="..." /> -->
                            <!-- Product details-->
                            <div class="card-body p-4">
                          <a href="/ds/board/read?bno=${BoardVo.bno}"><img class="card-img-top" style="width:200px;height:150px;" src="${BoardVo.thumbnail}" alt="..." /></a> 
                            
                                <div class="text-center">
                                    <!-- Product name-->
                                    <a class="fw-bolder" href="/ds/board/read?bno=${BoardVo.bno}">${BoardVo.title}</a>
                                    <br>
                                    <!-- Product price-->
                                    <p>조회수${BoardVo.view_count}</p>
                                   
                                </div>
                            </div>
              
                        </div>
                    </div>
                </c:if>
                        </c:forEach>
                    
                   
                </div>
            </div>
        </section>
        
        
        
         <!-- Section 레시피-->
        <section class="py-1" id="recipePost">
         <div class="container px-4 px-lg-5 mt-5">
           
         
         <ul class="menu" style="margin-right:50px;">
        
         
          <div>
		<img src="/resources/images/meet.png" alt="레시피 이야기" style="width:56px;height:44px;">
  		<span style="margin-top:20px;font-size:22px;" >레시피 이야기</span>
		</div>
         
            
         </ul>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                   
                      <c:forEach var="BoardVo" items="${list}">
                      <c:if test="${BoardVo.category=='레시피 이야기'}">
                    <div class="col mb-5">
                        <div class="card h-10">
                            <!-- Product image-->
<!--                             <img class="card-img-top"  src="/resources/images/vege.jpg" alt="..." /> -->
                            <!-- Product details-->
                            <div class="card-body p-4">
                          <a href="/ds/board/read?bno=${BoardVo.bno}"><img class="card-img-top" style="width:200px;height:150px;" src="${BoardVo.thumbnail}" alt="..." /></a> 
                            
                                <div class="text-center">
                                    <!-- Product name-->
                                    <a class="fw-bolder" href="/ds/board/read?bno=${BoardVo.bno}">${BoardVo.title}</a>
                                    <br>
                                    <!-- Product price-->
                                     <p>조회수${BoardVo.view_count}</p>
                                   
                                </div>
                            </div>
                      
                        </div>
                    </div>
                </c:if>
                        </c:forEach>
                  
                   
                    
                    
                </div>
            </div>
        </section>
        
    
<%@ include file="/WEB-INF/views/include/footer.jsp" %>      

    </body>    