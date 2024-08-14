<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

 <%@ include file="/WEB-INF/views/include/top.jsp" %>
<%@ include file="/WEB-INF/views/hn/mypage/include/myPageSide.jsp" %>

            <!-- Main Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                   
                    <!-- Title Section -->
                 	 <div class="row mb-4 text-center" style="margin-left: 0px; margin-right: 0px;">
					    <div class="col" style="padding: 0;">
					        <a href="/hn/mypage/noticeList" style="text-decoration: none; color: black; background-color: #D6EFD8; padding: 10px; display: block; margin-bottom: -1px;">
					            <h3 style="margin: 0;">공지사항</h3>
					        </a>
					    </div>
					    <div class="col" style="padding: 0;">
					        <a href="/hn/mypage/enqList" style="text-decoration: none; color: black; background-color: #D6EFD8; padding: 10px; display: block; margin-bottom: -1px;">
					            <h3 style="margin: 0;">1:1 문의사항</h3>
					        </a>
					    </div>
					    <div class="col" style="padding: 0;">
					        <a href="/hn/mypage/faqList" style="text-decoration: none; color: black; background-color: #D6EFD8; padding: 10px; display: block;">
					            <h3 style="margin: 0;">자주하는 질문</h3>
					        </a>
					    </div>
					</div>

                    <!-- Table Section -->
                    <div class="table-container">
                        <table class="table">
                            <thead>
                                <tr class="text-center">
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>작성일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${noticeList}" var="vo">
                                    <tr class="text-center">
                                        <td>${vo.n_no}</td>
                                        <td><a href="/hn/mypage/noticeRead?n_no=${vo.n_no}" style="color: black;">${vo.title}</a></td>
                                        <td><fmt:formatDate value="${vo.write_date}" pattern="yyyy-MM-dd"/></td>
                                        
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="row">
                            <div class="col-md-10"></div>
                            <div class="col-md-2">
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
 
 
 
 
 



 <%@ include file="/WEB-INF/views/include/bottom.jsp" %>