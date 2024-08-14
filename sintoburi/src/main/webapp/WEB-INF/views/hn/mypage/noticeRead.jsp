<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ include file="/WEB-INF/views/include/top.jsp" %>
  <%@ include file="/WEB-INF/views/hn/mypage/include/myPageSide.jsp" %>

 
 
  <div class="col-md-8" style="margin-top: 20px;">
	     <div style="display: flex; justify-content: space-between; align-items: center;">
		      <h3 style="margin: 0;">
		        ${noticeVo.title}
		      </h3>
		      <p style="margin: 0;">
		        <fmt:formatDate value="${noticeVo.write_date}" pattern="yyyy-MM-dd"/>
		      </p>
	    </div>
	    
	    <hr style="border: 0; height: 1px; background: #000; margin: 20px 0;">
	    <div class="row">
		     <div class="col-md-12 text-left">
		    	<p>${noticeVo.content}</p>
		    </div>
	  	</div>
	  	
	  	<hr style="border: 0; height: 1px; background: #000; margin: 20px 0;">
	 	 <div class="row">
		     <div class="col-md-12 text-center">
		     	<a href="/hn/mypage/noticeList">
		    	 	<button type="submit" class="btn btn-success btn-submit">목록보기</button>
		    	 </a>
	     	</div>
		 </div>
  
	</div>
   
    

 <%@ include file="/WEB-INF/views/include/bottom.jsp" %>