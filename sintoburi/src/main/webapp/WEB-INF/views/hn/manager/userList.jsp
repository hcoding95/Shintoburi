<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 
 <%@ include file="/WEB-INF/views/hn/manager/include/header.jsp" %>
 <%@ include file="/WEB-INF/views/hn/manager/include/bs.jsp" %>
<script>
$(function() {
	$("#btnMod").click(function() {
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
			success : function(rData) {
				console.log(sData);
				console.log(rData);
				 let updatedGrade = response.grade; // 서버에서 받은 업데이트된 등급
	                $(this).closest('tr').find('.current-grade').text(updatedGrade);
	                
	                alert("수정 완료");
			}
		});
		
	});
	
});
</script>

 <!-- Content Row -->

 <div class="row">

     <!-- Area Chart -->
     <div class="col-xl-12 col-lg-12">
         <div class="card shadow mb-4">
             <!-- Card Header - Dropdown -->
             <div
                 class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                 <h6 class="m-0 font-weight-bold text-primary">회원 목록</h6>
                 
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
			 <c:if test="${vo.grade != '관리자'}">
				<tr class="col-md-8 text-center">
					<td>${vo.user_id}</td>
					<td>${vo.user_name}</td>
					<td>${vo.email}</td>
					<td  class="current-grade">${vo.grade}${vo.business == 1 ? '[up]' : ''}</td>
					 <td><fmt:formatDate value="${vo.last_login}"
                               		pattern="yyyy-MM-dd"/></td>
                       <td>
<<<<<<< HEAD
                      <select name="grade" class="gradeSelect">
						<option value="buyer">구매자</option>	                        
						<option value="seller">판매자</option>	                        
=======
                       <select>
						  <option value="구매자" ${vo.grade == '구매자' ? 'selected' : '구매자'}>구매자</option>
    					  <option value="판매자" ${vo.grade == '판매자' ? 'selected' : '구매자'}>판매자</option>                      
>>>>>>> branch 'hanna' of https://github.com/hcoding95/Shintoburi
                       </select>
                       </td >
                       <td>
                       <button class="btnMod btn btn-outline-dark" data-user-id="${vo.user_id}" style="padding-bottom: 1px; padding-top: 1px;" type="button">수정</button>
					</td>
				</tr>
				</c:if>
			</c:forEach>	
			</tbody>
		</table>
	</div>
</div>
            </div> <!-- card-body -->
        </div>
    </div>
</div>


 <%@ include file="/WEB-INF/views/hn/manager/include/footer.jsp" %>