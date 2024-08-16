<%@ include file="/WEB-INF/views/include/header.jsp" %>
        
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<script>

$(function(){
	
	getReply();
	// 게시글 삭제버튼
	$("#btnDelete").click(function() {
		console.log("삭제 버튼 클릭");
		$("#frmDelete").append($("#actionForm > input"));

		$("#frmDelete").submit();
	});
	
	
	// 댓글작성 보이기
	$("#viewCommentEdit").click(function(){
		$("#commentEdit").css("display","block");
	});
	
	
	
	$("#replyCommit").click(function(){
		
		let data ={
				"bno":${detail.bno},
				"reply":$("#commentContext").val(),
				"replyer":'유저1'
			
			};
		
		$.ajax({
			type:"POST",
			url:"/ds/reply/commitComment",
			data:JSON.stringify(data), 
			contentType: "application/json; charset=UTF-8",
			async: false,
			success: function(result){
					
				$("#commentContext").val("");


			}
			,error: function(){
				alert("댓글 등록 실패");
			
			}	
	
		});
		
		 getReply();
		
	});
	
	function getReply(){
		let bno={
				"bno":${detail.bno}
		}
		$.ajax({
			type:"POST",
			url:"/ds/reply/getReply",
			data:JSON.stringify(bno), 
			async:false,
			contentType: "application/json; charset=UTF-8",
			success: function(result){
				//alert("댓글 불러오기 성공");
				let tr=null;	// 댓글 보기
				
				for(let i=0; i<result.length; i++){
					 tr += `
					<tr>
						<td>\${result[i].reply}</td>
						<td>\${result[i].replyer}</td>
						<td>\${result[i].replyDate}</td>
						
					</tr>
				  `;
			
					$("#replyView").html(tr);
					
					}
				}
			,error: function(){
				//alert("댓글 불러오기 실패");
			
			}	
	
		});
		
	}
	
});


</script>

<body>

	<!-- 삭제 폼 -->
	<form id="frmDelete" action="/ds/board/delete" method="post">
		<input type="hidden" name="bno" value="${detail.bno}" />
	</form>
	<!-- // 삭제 폼 -->

	<div class="row">
		<div class="col-md-12">
			<form role="form">
			<br>
				<div class="form-group" style="margin-left:px;font-weight:bold;font-size:25px;">
			제목 <input type="text" value="${detail.title}" class="form-control" readonly >		
				</div>
				<hr>
				<div class="form-group">
					 
					<label for="" style="margin-left:px;font-size:20px;margin-bottom:300px;">
							${detail.content}
					</label>
				
				</div>
				<!-- 이모티콘	추가할지 검토 -->
			

				<hr>
				
<!-- 댓글 -->
				<div>
				<h3>
				댓글
				</h3>
				<button type="button" class="btn btn-primary" id="viewCommentEdit">댓글쓰기</button>
				
	<div style="display:none;" id="commentEdit">
	<textarea rows="10" cols="100" id="commentContext"></textarea>
	<button type="button" class="btn btn-primary" id="replyCommit">작성</button>			
	</div>		
				
				<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>
							내용
						</th>
						<th>
							작성자
						</th>
						<th>
							작성일
						</th>
					</tr>
				</thead>
				<tbody id="replyView">
				
					
				</tbody>
			</table>
		</div>
	</div>

		
				</div>
<!-- /댓글 -->				
				
				<div style="margin-left:1680px;">
				<a type="button" class="btn btn-outline-warning" href="/ds/board/modify?bno=${detail.bno}">
					수정
				</a>
				<button type="button" class="btn btn-outline-danger" id="btnDelete">
					삭제
				</button>
				</div>
			</form>
		</div>
	</div>

</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>  