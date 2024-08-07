<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 
 <%@ include file="/WEB-INF/views/hn/manager/include/header.jsp" %>
 <%@ include file="/WEB-INF/views/hn/manager/include/bs.jsp" %>
<script>
$(function() {
	  let user_id = $(this).data("user-id");
      // 가장 가까운 tr에서 gradeSelect 클래스의 값 가져오기
      let grade = $(this).closest('tr').find('select').val();
      
	let sData ={
			"user_id" : user_id,
			"grade" : grade
	};
	$("#btnMod").click(function() {
		
		$.ajax({
			type: "post",
			url : "hn/manager/modGrade",
			data : JSON.stringify(sData),
			contentType: "application/json; charset=utf-8",
			success : function(rData) {
				console.log(sData);
				console.log(rData);
				alert("Dd");
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
					<td>${vo.grade}${vo.business == 1 ? '[up]' : ''}</td>
					 <td><fmt:formatDate value="${vo.last_login}"
                               		pattern="yyyy-MM-dd"/></td>
                       <td>
                       <select>
						<option value="buyer">구매자</option>	                        
						<option value="seller">판매자</option>	                        
                       </select>
                       </td >
                       <td>
                       <button id="btnMod" class="btnMod btn btn-outline-dark" data-user-id="${vo.user_id}" style="padding-bottom: 1px; padding-top: 1px;" type="button">수정</button>
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