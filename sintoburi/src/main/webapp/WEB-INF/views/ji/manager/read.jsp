<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/include/top.jsp"%>


<style>
/* 테스트 섹션 */
#divDrop {
	margin: auto;
	width: 70%;
	height: 100px;
	line-height: 100px;
	background: aquamarine;
	border: 2px dashed Orange;
	text-align: center;
}

.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: #88cccccc;
	z-index: 100;
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

#uploadedList > li {
	list-style-type: none;
	float: left;
}





/* // 테스트 섹션 */
</style>

<script>
// $(document).ready(function() {})
$(function() {
	
	// 수정 버튼
	$("#btnModify").click(function() {
		$(".editable").prop("readonly", false);
		$("h1").text("수정양식");
		$("h6.text-primary").text("수정양식입니다.");
		$(this).fadeOut(1000);
		$(this).next().fadeIn(1000);
	});
	
	// 삭제 버튼
	$("#btnRemove").click(function() {
		console.log("삭제 버튼 클릭");
		$("#frmRemove").append($("#actionForm > input"));
		$("#frmRemove").submit();
	});
	

	// 목록 버튼
// 	$("#a_list").click(function(e) {
// 		e.preventDefault();
// 		$("#actionForm > input[name=pageNum]").val("${criteria.pageNum}");
// 		$("#actionForm > input[name=amount]").val("${criteria.amount}");
// 		$("#actionForm").attr("action", "/board/list");
// 		$("#actionForm").attr("method", "get");
// 		$("#actionForm").submit();
// 	});
	
	// 수정폼 전송
	$("#frmModify").submit(function() {
		$("#frmModify").prepend($("#actionForm > input"));
// 		return false; // 폼 전송 막기
	});
	
	
	
	
	
});
</script>

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">상세보기</h1>
        
        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">상세보기입니다.</h6>
            </div>
            <div class="card-body">
                <div class="row">
					<div class="col-md-12">
						<form id="frmModify" role="form" action="/board/modify" method="post">
							
							
							<div class="form-group">
								 
								<label for="bno">
									글번호
								</label>
								<input type="text" class="form-control" id="bno"
									name="bno" value="${boardVo.bno}" readonly/>
							</div>
							<div class="form-group">
								 
								<label for="title">
									글제목
								</label>
								<input type="text" class="form-control editable" id="title"
									name="title" value="${boardVo.title}" readonly />
							</div>
							<div class="form-group">
								 
								<label for="content">
									글내용
								</label>
								<textarea class="form-control editable" id="content"
									name="content" readonly>${boardVo.content}</textarea>
							</div>
							<div class="form-group">
								 
								<label for="writer">
									작성자
								</label>
								<input type="text" class="form-control editable" id="writer"
									name="writer" value="${boardVo.writer}" readonly/>
							</div>
							
							<div class="form-group">
								 
								<label for="regdate">
									작성일
								</label>
								<input type="text" class="form-control" id="regdate"
									value='<fmt:formatDate value="${boardVo.regdate}" 
										pattern="yyyy-MM-dd"/>' readonly/>
							</div>
							
							<div class="form-group">
								 
								<label for="updatedate">
									수정일
								</label>
								<input type="text" class="form-control" id="updatedate"
									value='<fmt:formatDate value="${boardVo.updatedate}" 
										pattern="yyyy-MM-dd"/>' readonly/>
							</div>
							
							<div class="form-group">
								 
								<label for="updatedate">
									조회수
								</label>
								<input type="text" class="form-control" id="updatedate"
									value="${boardVo.readcnt}" readonly/>
							</div>
							
							<!-- 로그인한 사용자 == 작성자 -->
							<c:if test="${login.user_id == boardVo.writer}">
							<button type="button" class="btn btn-warning"
								id="btnModify">수정</button>
							<button type="submit" class="btn btn-success"
								id="btnModifyOk"
								style="display:none">수정완료</button>
							<button type="button" class="btn btn-danger"
								id="btnRemove">삭제</button>
							</c:if>	
							
							<a id="a_list" href="#" class="btn btn-primary">목록</a>
						</form>
						<!-- 삭제 폼 -->
						<form id="frmRemove" action="/board/remove" method="post">
							<input type="hidden" name="bno"
								value="${boardVo.bno}"/>
						</form>
						<!-- // 삭제 폼 -->
					</div>
				</div>
				
				<!-- 첨부파일 리스트 -->
				<ul id="uploadedList">
				<c:forEach items="${boardVo.attachList}" var="dto">
					<li>
					<c:choose>
						<c:when test="${dto.image == 'I'}">
							<img src="/display?fileName=${dto.uploadPath}/s_${dto.uuid}_${dto.fileName}"/>
						</c:when>
						<c:otherwise>
							<img src="/resources/default.png" width="100"/>
						</c:otherwise>
					</c:choose>
						<br>
						${dto.fileName}
					</li>
				</c:forEach>
				</ul>
				
				
            </div>
        </div>

    <!-- /.container-fluid -->


<%@ include file="/WEB-INF/views/include/bottom.jsp"%>
         