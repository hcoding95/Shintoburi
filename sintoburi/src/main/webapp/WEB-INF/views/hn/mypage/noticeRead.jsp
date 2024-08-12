<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/hn/manager/include/bs.jsp" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ include file="/WEB-INF/views/include/top.jsp" %>
  <%@ include file="/WEB-INF/views/hn/mypage/include/myPageSide.jsp" %>
 
<!--                <div id="page-content-wrapper"> -->
<!--                 <div class="container-fluid"> -->
<!--                     <div class="row"> -->
<!--                         <div class="col-md-12"> -->
<!--                             <form role="form" action="/hn/mypage/enqRegister" method="post" enctype="multipart/form-data"> -->
<!--                                 <div class="form-group"> -->
<!--                                     <label for="title">제목</label> -->
<%--                                     <input value="${noticeVo.title}" type="text" class="form-control" id="title" name="title" readonly /> --%>
<!--                                 </div> -->

<!--                                 <div class="form-group"> -->
<!--                                     <label for="content">내용</label> -->
<%--                                     <textarea rows="10" class="form-control" id="content" name="content" readonly>${noticeVo.content}</textarea> --%>
<!--                                 </div> -->

<!--                                 <div class="form-group"> -->
<!--                                     <label for="image">첨부파일</label> -->
<!--                                     <input class="form-control" type="file" id="image" name="image"> -->
<!--                                 </div> -->

                               
<!--                             </form> -->
<!--                         </div> -->
<!--                     </div> -->
<!--  			</div> -->
<!--  </div> -->
 
 
 
 <div class="col-md-8">
      <h3 class="pb-4 mb-4 fst-italic border-bottom">
        ${noticeVo.title}
      </h3>
    

      <article class="blog-post">
        <p>${noticeVo.content}</p>
      </article>
    </div>

     

    </div>
    

 <%@ include file="/WEB-INF/views/include/bottom.jsp" %>