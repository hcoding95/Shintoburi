<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script>

$(function(){
	
$("#chatInput").focus();

	
	

	$(document).keyup(function(e){
			
			if(e.keyCode==13&&$("#chatInput").val()!=""){	// 엔터
				console.log("엔터");
				$("#chatContext").append($("#chatInput").val()+"<br>");
				
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
				
				
				
				$("#chatInput").val("");
			}
			
			
			
			
		});

});




</script>



<title>채팅</title>

</head>
<body>

<h2>실시간 채팅</h2>
<hr>

<div id="chatContext">



</div>

  
<!-- <ul>  -->

<!-- <li class="d-flex flex-row-reverse align-items-end my-3"> -->
<!--   <span class="chat-box mine ms-1">내용</span> -->
<!--   <span class="tx-small text-end"> -->
<!--     날짜  -->
<!--   </span> -->
<!-- </li> -->

<!-- <li class="d-flex flex-row align-items-end my-3"> -->
<!--   <span class="chat-box me-1">내용</span> -->
<!--   <span class="tx-small"> -->
<!--     날짜 -->
<!--   </span> -->
<!-- </li> -->

<!-- </ul>  -->

<div style="">
          <input type="text" class="form-control" id="chatInput">
</div>


</body>
</html>