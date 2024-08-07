<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@ include file="/WEB-INF/views/hn/manager/include/bs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container" style="padding-top: 30px; padding-bottom: 30px; margin-left: 400px ">
          <ul class="nav nav-pills">
        <li class="nav-item"><a href="#" class="nav-link " aria-current="page" style="padding:50px; padding-left: 70px; padding-right: 70px; color: black;;">Q&A</a></li>
        <li class="nav-item"><a href="/mypage/enqList" class="nav-link active" style="padding:50px; padding-left: 70px; padding-right: 70px; color: black;" >1:1문의사항</a></li>
        <li class="nav-item"><a href="#" class="nav-link" style="padding:50px; padding-left: 70px; padding-right: 70px; color: black;"">공지사항</a></li>
       
      </ul>
        
    </div >
	
<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<table class="table">
				<thead>
					<tr class="col-md-8 text-center">
						<th>번호</th>
						<th>상품정보</th>
						<th>제목</th>
						<th>작성일</th>
						<th>답변상태</th>	
						
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="vo">
					<tr class="col-md-8 text-center">
						<td>${vo.eno}</td>
						<td>상품</td>
						<td><a href="/mypage/enqRead?eno=${vo.eno}">${vo.enquiry_type}</a></td>
						<td><fmt:formatDate value="${vo.write_date}"
                                		pattern="yyyy-MM-dd"/></td>
                      
                       <td>${vo.status}</td>
                     
					</tr>
				</c:forEach>	
				</tbody>
			</table>
		<div class="container-fluid">
	<div class="row">
		<div class="col-md-10">
		</div>
		<div class="col-md-2">
			<a href="/mypage/enqRegisterForm"><button type="button" class="btn btn-outline-dark">1:1문의하기</button></a>
		</div>
	</div>
</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>

</body>
</html>