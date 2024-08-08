<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 
 <%@ include file="/WEB-INF/views/hn/manager/include/header.jsp" %>
 <%@ include file="/WEB-INF/views/hn/manager/include/bs.jsp" %>





     
     <div class="col-xl-12 col-lg-12">
         <div class="card shadow mb-4">
             <!-- Card Header - Dropdown -->
             <div
                 class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                 <h6 class="m-0 font-weight-bold text-primary">문의 사항</h6>
                 <div class="col-md-3">
<!--                 <select class="form-control" id="enquiryTypeSelect" onchange="filterEnquiryList(this.value)"> -->
<!--                    	<option value="배송문의">전체</option> -->
<!--                    	<option value="배송문의">배송문의</option> -->
<!-- 					<option value="결제문의">결제문의</option> -->
<!-- 					<option value="판매문의">판매문의</option> -->
<!-- 					<option value="구매문의">구매문의</option> -->
<!-- 					<option value="등급문의">등급문의</option> -->
<!--                     필요한 문의사항 타입 옵션 추가 -->
<!--                 </select> -->
            </div>
             </div>
             <!-- Card Body -->
             <div class="card-body"> 

<div class="row">
<div class="col-md-2">
		</div>
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr class="col-md-8 text-center">
						<th>번호</th>
						<th>상품정보</th>
						<th>제목</th>
						<th>작성일</th>
						<th>답변상태</th>	
						<th>수정</th>	
						
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${enquiryList}" var="vo">
					<tr class="col-md-8 text-center">
						<td>${vo.eno}</td>
					    <td>상품</td>
					    <td><a href="/hn/manager/enquiryDetail/${vo.eno}">${vo.enquiry_type}</a></td>
					    <td><fmt:formatDate value="${vo.write_date}" pattern="yyyy-MM-dd"/></td>
					    <td>
                        <select>
							<option <c:if test="${vo.status =='미답변'}">selected</c:if>>미답변</option>                      
							<option <c:if test="${vo.status =='답변완료'}">selected</c:if>>답변완료</option>                  
							<option <c:if test="${vo.status =='처리완료'}">selected</c:if>>처리완료</option>                  
							<option <c:if test="${vo.status =='미처리'}">selected</c:if>>미처리</option>                  
                        </select>
                        </td >
                        <td>
                       <button style="padding-bottom: 1px; padding-top: 1px;"  type="button" class="btn btn-outline-dark">수정</button>
						</td>
					</tr>
				</c:forEach>	
				</tbody> 
		</table>
		
	</div>
                           
            </div> <!-- card-body -->
        </div>
    </div>
</div>


 <%@ include file="/WEB-INF/views/hn/manager/include/footer.jsp" %>