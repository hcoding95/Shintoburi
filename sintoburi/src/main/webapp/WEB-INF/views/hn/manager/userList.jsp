<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@ include file="/WEB-INF/views/hn/manager/include/header.jsp" %>

<script>
$(function() {
	$(".btnMod").click(function() {
		  let user_id = $(this).attr("data-user-id");
	      let grade = $(this).closest('tr').find('select').val();
	      console.log(user_id);
	      console.log(grade);
	      
			let sData ={
					"user_id" : user_id,
					"grade" : grade
			};

		$.ajax({
			type: "post",
			url : "/hn/manager/modGrade",
			data : JSON.stringify(sData),
			contentType: "application/json; charset=utf-8",
			 success: function(result) {
	                if (result) {
	                    let updatedGrade = grade; // 업데이트된 등급
	                    $(this).closest('tr').find('.current-grade').text(updatedGrade);
	                    alert("수정 완료");
	                } else {
	                    alert("수정 실패");
	                }
	            }
		});
	});
	
	// 회원테이블 페이지 블럭
	 $(".userPage").click(function(e) {
	        e.preventDefault(); // 브라우저의 기본 기능 막기
	        let pageNum = $(this).attr("href");
	        console.log(pageNum);
	        $("#userActionForm > input[name=pageNum]").val(pageNum);
	        $("#userActionForm").attr("action", "/hn/manager/userList");
	        $("#userActionForm").submit();
	    });

	
});
</script>

 <!-- Content Row -->

 <div class="row">
     <!-- Area Chart -->
     <div class="col-xl-12 col-lg-12">
         <div class="card shadow mb-4">
             <!-- Card Header - Dropdown -->
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			    <h6 class="m-0 font-weight-bold text-primary" style="margin-right: 10px;">회원 목록</h6>
			    <form id="searchForm" action="/hn/manager/userList" method="get" style="display: flex; align-items: center;">
			        <select id="selectSearch" name="type" style="margin-right: 10px;">
			        	<option value="W" ${criteria.type == 'W' ? 'selected' : ''}>전체</option>
			            <option value="I" ${criteria.type == 'I' ? 'selected' : ''}>아이디</option>
			            <option value="E" ${criteria.type == 'E' ? 'selected' : ''}>이메일</option>
			            <option value="G" ${criteria.type == 'G' ? 'selected' : ''}>등급</option>
			        </select>
			        <input id="inputSearch" type="text" name="keyword" value="${criteria.keyword}" style="margin-right: 10px;">
			        <button id="btnSearch" type="button" class="btnMod btn btn-outline-dark btn-sm">검색</button>
			    </form>
			</div>
             <!-- Card Body -->
             <div class="card-body"> 
<div class="row">
	<div class="col-md-12">
		<table class="table">
			<thead>
				<tr class="col-md-8 text-center">
					<th >아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>등급</th>
					<th>마지막 로그인 시간</th>
					<th>등급 권한</th>
					<th>확인</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${userList}" var="vo">
			 <c:if test="${vo.grade != '관리자' && vo.grade != '마스터'}">
				<tr class="col-md-8 text-center">
					<td>${vo.user_id}</td>
					<td>${vo.user_name}</td>
					<td>${vo.email}</td>
					 <td class="current-grade">
                  	  ${vo.grade} <c:if test="${vo.business == 1 && vo.grade != '판매자'}">[up]</c:if>
              		  </td>
              		 
					 <td><fmt:formatDate value="${vo.last_login}"
                               		pattern="yyyy-MM-dd"/></td>
                       <td>
                       <select>
						  <option value="구매자" ${vo.grade == '구매자' ? 'selected' : '구매자'}>구매자</option>
    					  <option value="판매자" ${vo.grade == '판매자' ? 'selected' : '구매자'}>판매자</option>   
                       </select>
                       </td >
                       <td>
                       <button class="btnMod btn btn-outline-dark btn-sm" data-user-id="${vo.user_id}" style="padding-bottom: 1px; padding-top: 1px;" type="button">수정</button>
					</td>
				</tr>
				</c:if>
			</c:forEach>	
			</tbody>
		</table>
	</div>
</div>

<!-- Pagination -->
            <div class="row">
				<div class="col-md-12">
					<nav>
						<ul class="pagination justify-content-center">
							<c:if test="${pageMaker.prev}">
						    <li class="page-item">
						        <a class="page-link userPage" href="${pageMaker.startPage - 1}">&laquo;</a>
						    </li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="v">
						    <li class="page-item ${v == pageMaker.cri.pageNum ? 'active' : ''}">
						        <a class="page-link userPage" href="${v}">${v}</a>
						    </li>
						</c:forEach>
						<c:if test="${pageMaker.next}">
						    <li class="page-item">
						        <a class="page-link userPage" href="${pageMaker.endPage + 1}">&raquo;</a>
						    </li>
						</c:if>
						</ul>
					</nav>
				</div>
			</div>
            <!-- // Pagination -->
            </div> <!-- card-body -->
        </div>
    </div>
</div>









<%@ include file="/WEB-INF/views/hn/manager/include/action_form.jsp" %>
<%@ include file="/WEB-INF/views/hn/manager/include/footer.jsp" %>