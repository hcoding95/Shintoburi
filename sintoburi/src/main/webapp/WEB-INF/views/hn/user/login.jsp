<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/include/top.jsp" %>


<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Login</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
<script src="/resources/vendor/jquery/jquery.min.js"></script>



   <style>
    body {
        background-color: #ffffff; /* 전체 배경을 하얀색으로 설정 */
        font-family: Arial, sans-serif;
    }
    .login-container {
        max-width: 800px; /* 로그인 폼의 최대 너비를 증가시킴 */
        margin: 100px auto; /* 화면 중앙에 위치하도록 여백 설정 */
        padding: 60px; /* 패딩을 늘려서 내부 공간을 확보 */
        background: #ffffff; /* 로그인 폼 배경을 하얀색으로 설정 */
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .login-container h2 {
        margin-bottom: 20px;
        text-align: center;
        color: #000000; /* 글자 색상을 검정색으로 설정 */
    }
    .login-container .btn-primary {
        background-color: #28a745; /* 초록색 배경 설정 */
        border-color: #28a745; /* 초록색 테두리 설정 */
        color: #ffffff; /* 글자 색상을 하얀색으로 설정 */
    }
    .login-container .btn-primary:hover {
        background-color: #218838; /* 어두운 초록색으로 변경 */
        border-color: #1e7e34; /* 어두운 초록색 테두리 */
    }
    .login-container a {
        text-decoration: none;
        color: #007bff;
    }
    .login-container a:hover {
        text-decoration: underline;
    }
    .form-group {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }
    .form-group .form-control {
        flex: 1;
    }
    .form-group .form-links {
        margin-left: 10px;
    }
    .form-group .form-links a {
        color: #007bff;
        text-decoration: none;
        margin-right: 15px;
    }
    .form-group .form-links a:hover {
        text-decoration: underline;
    }
    .form-checkbox {
        display: flex;
        align-items: center;
        margin-right: 20px;
    }
    .form-checkbox input[type="checkbox"] {
        margin-right: 5px;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="login-container">
                    <h2>로그인</h2>
                    <form action="/user/loginPost" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control form-control-user" id="user_id" name="user_id" placeholder="아이디" required>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control form-control-user" id="user_pw" name="user_pw" placeholder="비밀번호" required>
                        </div>
                        <div class="form-group">
                            <div class="form-checkbox">
                                <div class="custom-control custom-checkbox small">
                                    <input type="checkbox" class="custom-control-input" id="useCookie" name="useCookie">
                                    <label class="custom-control-label" for="useCookie">아이디 저장</label>
                                </div>
                            </div>
                            <div class="form-links" style="
                                margin-left: 360px;
                            ">
                                <a href="/user/find-id">아이디 찾기</a>
                                <a href="/user/find-password" style="
                                    margin-right: 0px;
                                ">비밀번호 찾기</a>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary btn-user btn-block">
                            로그인
                        </button>
                    </form>
                    <button type="button" class="btn btn-primary btn-user btn-block">
                        회원가입
                    </button>
                </div>
            </div>
        </div>
    </div>
 <%@ include file="/WEB-INF/views/include/bottom.jsp" %>