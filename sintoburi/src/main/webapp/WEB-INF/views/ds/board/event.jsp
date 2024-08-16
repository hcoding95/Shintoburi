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
	
	$.ajax({
		type:"POST",
		url:"/ds/game/quizScore",
		contentType: "application/json; charset=UTF-8",
		success: function(result){
			if(result){
				//alert("스코어 불러와짐");
				
				for(let i=0; i<10; i++){
					console.log(result[i].user_name);
					// 등수 표시
					$("#record").append(`<h3>\${i+1}등 :\${result[i].user_name}님 \${result[i].score}점</h3>`);
				}
				
			}
		}
		,error: function(){
			//alert("스코어 불러오기 실패");
		
		}	

	});
})



</script>

<title>이벤트</title>
</head>
<body>

<h2>이벤트 게임에 도전해 포인트를 얻으세요!</h2>

<a href="/ds/board/quizGame">퀴즈게임</a>


<hr>
<h2>랭킹</h2>
<div id="record">

</div>


</body>
</html>