<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="/WEB-INF/views/include/header.jsp" %>
<link href="/resources/css/attach.css" rel="stylesheet">
<script src="/resources/js/myscript.js"></script>
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
// 		$("#frmRemove > input[name=pageNum]").val("${criteria.pageNum}");
// 		$("#frmRemove > input[name=amount]").val("${criteria.amount}");
		$("#frmRemove").submit();
	});
	
// 	$("#frmModify").submit(function() {
		// 유효성 체크
		// return false; // 폼전송 안함
// 	});

	// 목록 버튼
	$("#a_list").click(function(e) {
		e.preventDefault();
		$("#actionForm > input[name=pageNum]").val("${criteria.pageNum}");
		$("#actionForm > input[name=amount]").val("${criteria.amount}");
		$("#actionForm").attr("action", "/board/list");
		$("#actionForm").attr("method", "get");
		$("#actionForm").submit();
	});
	
	// 수정폼 전송
	$("#frmModify").submit(function() {
		$("#frmModify").prepend($("#actionForm > input"));
// 		$("#frmModify > input[name=pageNum]").val("${criteria.pageNum}");
// 		$("#frmModify > input[name=amount]").val("${criteria.amount}");
// 		return false; // 폼 전송 막기
	});
	
	// 댓글 보기 버튼
	$("#btnReplyList").click(function() {
		$.get("/reply/list/${boardVo.bno}", function(rData) {
			console.log(rData);
			// 기존 데이터 가져온 부분 삭제
			$("#reply_table").empty();
			$.each(rData, function(index, value) {
				let obj = value;
				let tr = `<tr>
								<td>\${obj.reply}</td>
								<td>\${obj.replyer}</td>
								<td>\${toDateString(obj.replyDate)}</td>
								<td>\${toDateString(obj.updateDate)}</td>
							`;
							if(obj.replyer == "${login.user_id}"){
								tr += 	`<td><button class="btn btn-sm btn-warning btnReplyModify" data-rno="\${obj.rno}">수정</button></td>
										<td><button class="btn btn-sm btn-danger btnReplyRemove" data-rno="\${obj.rno}">삭제</button></td>
										`;
							
							}
								
								
							tr += `</tr>`;
				$("#reply_table").append(tr);
			});
		});
	}); // 댓글 보기 버튼
	
	// 댓글 등록 버튼
	$("#btnRegisterReply").click(function() {
		let reply = $("#reply").val();
		let replyer = $("#replyer").val();
		let sData = {
				"reply"   : reply,
				"replyer" : replyer,
				"bno"	  : ${boardVo.bno}
		};
		console.log("sData", sData);
		
// 		$.post('/reply/register', sData, function(rData) {
// 			console.log(rData);
// 		})
		$.ajax({
			type: "post",
			url : "/reply/register",
			data : JSON.stringify(sData),
			contentType: "application/json; charset=utf-8",
			success : function(rData) {
				console.log(rData);
				// 댓글보기 버튼 클릭 시킴
				$("#btnReplyList").trigger("click");
				let strCnt = $("#btnReplyList > span").text();
				let cnt = parseInt(strCnt) + 1;
				$("#btnReplyList > span").text(cnt);
			}
		});
	}); // 댓글 등록 버튼
	
	// 댓글 수정 버튼
// 	$(".btnReplyModify").click(function() {
	// -> .ready(f) 에서는 .btnReplyModify 가 없음
	// -> 로딩시에 소스보기 상태에서 보이는 엘리먼트에 이벤트 설정을 한다.
	$("#reply_table").on("click", ".btnReplyModify", function() {
		console.log("댓글 수정 버튼 클릭");
		console.log($(this));
		let reply = $(this).parent().parent().find("td").eq(0).text().trim();
		let replyer = $(this).parent().parent().find("td").eq(1).text().trim();
		let rno = $(this).attr("data-rno");
		$("#modalReply").val(reply);
		$("#modalReplyer").val(replyer);
		$("#btnModalOk").attr("data-rno", rno);
		$("#modal-reply").modal("show");
	}); // 댓글 수정 버튼
	
	// 댓글 수정 완료 버튼
	$("#btnModalOk").click(function() {
		let reply = $("#modalReply").val();
		let replyer = $("#modalReplyer").val();
		let rno = $(this).attr("data-rno");
		let sData = {
				"reply" : reply,
				"replyer" : replyer,
				"rno" : rno
		};
		
		$.ajax({
			type: "put",
			url : "/reply/modify",
			data : JSON.stringify(sData),
			contentType : "application/json; charset=utf-8",
			success : function(rData) {
				console.log(rData);
				// 댓글 보기 버튼 클릭 시킴
				$("#btnReplyList").trigger("click");
				// 모달창 닫음
				$("#modal-reply").modal("hide");
			}
		});
		
	}); // 모달창 수정 완료 버튼
	
	// 댓글 삭제 버튼
	$("#reply_table").on("click", ".btnReplyRemove", function() {
		let that = $(this);
		let rno = that.attr("data-rno");
		$.ajax({
			type: "delete",
			url : "/reply/remove/" + rno + "/${boardVo.bno}",
			success : function(rData) {
				console.log(rData);
				// 댓글 버튼을 클릭 시켜도 되고
				// 해당 tr을 삭제
				that.parent().parent().fadeOut(1000);
				let strCnt = $("#btnReplyList > span").text();
				let cnt = parseInt(strCnt) - 1;
				$("#btnReplyList > span").text(cnt);
			}
		});
		
	});
	$("#btnLike").click(function() {
	    let user_id = "${login.user_id}";
	    let bno = "${boardVo.bno}";
	    let isLiked = ${likeMap.isLiked}; 
	    console.log("Current isLiked value:", isLiked); 
		let sData = {
				"user_id" : user_id,
				"bno" : bno,
				"isLiked" : isLiked
			};	
		// -> {user_id: 'user00', bno: '2'} : 자바 스크립트 객체 - 자바는 얘가 뭔지 모름
		console.log("sData:", sData);
		// $.post("/board/doLike", sData, function(rData) {});
		$.ajax({
			type: "post",
			url : "/board/doLike",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(sData),  // '{"user_id": "user00", "bno": "2"}' : 문자열
			success: function(rData) {
				console.log("rData:", rData);
				let likeCount = parseInt($("#spanCount").text())
				
	            if (isLiked === true) {
	            	$("#spanColor").css("color", "white");
	            	$("#spanCount").text(--likeCount);
 	             	isLiked = false;
 	               console.log("Updated isLiked value:", isLiked); 
	            	
	            }else{
	            	$("#spanColor").css("color","red");
	            	$("#spanCount").text(++likeCount);
	            	 isLiked = true;
	            	  console.log("Updated isLiked value:", isLiked); 
	            }
			}
	        
		});
	
	});
	
});
</script>

<!-- 댓글 모달창 -->
<div class="row">
	<div class="col-md-12">
		<div class="modal fade" id="modal-reply" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="myModalLabel">
							댓글 수정
						</h5> 
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="my-3">
							<input type="text" class="form-control"
								id="modalReply">
						</div>
						<div>
							<input type="text" class="form-control"
								id="modalReplyer">
						</div>
					</div>
					<div class="modal-footer">
						 
						<button type="button" class="btn btn-primary"
							id="btnModalOk">
							수정 완료
						</button> 
						<button type="button" class="btn btn-secondary" data-dismiss="modal">
							닫기
						</button>
					</div>
				</div>
				
			</div>
			
		</div>
		
	</div>
</div>
<!-- // 댓글 모달창 -->


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
							
							<!--  로그인한 사용자 == 작성자 -->
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
				<!-- 좋아요 -->
<%-- 				<c:if test="${not empty login}"> --%>
				<div  style="clear: both; text-align:center;">
					<button id="btnLike" type="button" class="btn btn-primary">
						<span  id="spanColor" style="color:${likeMap.isLiked == true ? 'red' : 'white'}; font-size:30px">♥</span>
						<span id="spanCount" style="margin-left:10px; font-size:30px">${likeMap.likeCount}</span>
					</button>
				</div>
<%-- 				</c:if> --%>
				<!-- 댓글 -->
				<div class="row my-4"> 
					<div class="col-md-12">
						<button type="button" id="btnReplyList"
							class="btn btn-dark">댓글보기 <span class="badge badge-danger">${boardVo.replycnt}</span></button>
					</div>
				</div>
				
				<!-- 댓글 입력 -->
				<c:if test="${not empty login}">
				<div class="row my-3">
					<div class="col-md-8">
						<input type="text" class="form-control" id="reply"
							placeholder="댓글내용"/>
					</div>
					<div class="col-md-3">
						<input type="text" class="form-control"
							placeholder="댓글러" id="replyer" value="${login.user_id}" readonly/>
					</div>
					<div class="col-md-1">
						<button type="button" class="btn btn-sm btn-primary"
							id="btnRegisterReply">등록</button>
					</div>
				</div>
				</c:if>
				<!-- // 댓글 입력 -->
				
				<div class="row my-3">
					<div class="col-md-12">
						<table class="table" id="reply_table">
							
						</table>
					</div>
				</div>
				
				<!-- // 댓글 -->
				
            </div>
        </div>

    </div>
    <!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
<%@ include file="/WEB-INF/views/include/action_form.jsp" %>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>            