<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@ include file="/WEB-INF/views/hn/manager/include/header.jsp" %>
<script>
$(function(){
	$(".btnMod").click(function(){
		 let $button = $(this);
		let n_no = $(this).data('n_no');
	    let important = $(this).closest('tr').find('select').val();
	    console.log(n_no);
	    console.log(important);
		let sData = {
			"n_no" : n_no,
			"important" :important
		};
		
		
		$.ajax({
			type: "post",
			url : "/hn/manager/notice/updateImportant",
			data : JSON.stringify(sData),
			contentType: "application/json; charset=utf-8",
			 success: function(result) {
	                if (result) {
	                    alert("공지사항 항목이 변경 되었습니다.");
	                } else {
	                    alert("변경 실패 , 다시 시도해 주세요.");
	                }
	            }
		});
		
		
	});
	
	
	
});


</script>



 <div class="row">

     <!-- Area Chart -->
     <div class="col-xl-12 col-lg-12">
         <div class="card shadow mb-4">
             <!-- Card Header - Dropdown -->
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
			    <h6 class="m-0 font-weight-bold text-primary" style="margin-right: 10px;">공지사항</h6>
			   
			</div>
             <!-- Card Body -->
             <div class="card-body"> 
<div class="row">
	<div class="col-md-12">
		<table class="table">
			<thead>
				<tr class="col-md-8 text-center">
					<th>번호</th>
					<th>제목</th>
					<th>작성일</th>
					<th>항목</th>
					<th>수정</th>
					
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${noticeList}" var="vo">

				<tr class="col-md-8 text-center">
					<td>${vo.n_no}</td>
					<td><a href="/hn/manager/notice/noticeDetail/${vo.n_no}">${vo.title}</a></td>

					<td><fmt:formatDate value="${vo.write_date}"
							pattern="yyyy-MM-dd" /></td>
					<td>
                       <select>
						  <option value="N" ${vo.important == 'N' ? 'selected' : 'N'}>일반</option>
    					  <option value="Y" ${vo.important == 'Y' ? 'selected' : 'N'}>중요</option>   
                       </select>
                       </td >
                       <td>
                       <button class="btnMod btn btn-outline-dark btn-sm" data-n_no="${vo.n_no}" style="padding-bottom: 1px; padding-top: 1px;" type=button>수정</button>
					</td>
				</tr>
			</c:forEach>	 
			</tbody>
		</table> 
		<div class="row">
    <div class="col-md-12 text-right">
        <a href="/hn/manager/notice/noticeForm">
            <button class="btn btn-primary btn" type="button">작성하기</button>
        </a>
    </div>
</div>
	</div>
</div>

<!-- Pagination -->
            <div class="row">
				<div class="col-md-12">
					<nav>
						<ul class="pagination justify-content-center">
							<c:if test="${pageMaker.prev == true}">
							<li class="page-item">
								<a  id ="page" class="page-link" href="${pageMaker.startPage - 1}">&laquo;</a>
							</li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage}" 
									   end="${pageMaker.endPage}" 
									   var="v">
							<li class="page-item ${v == pageMaker.cri.pageNum ? 'active' : ''}"> <!-- li -->
								<a class="page-link" href="${v}">${v}</a>
							</li>
							</c:forEach>
							<c:if test="${pageMaker.next == true}">
							<li class="page-item">
								<a class="page-link" href="${pageMaker.endPage + 1}">&raquo;</a>
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

 <%@ include file="/WEB-INF/views/hn/manager/include/footer.jsp" %>