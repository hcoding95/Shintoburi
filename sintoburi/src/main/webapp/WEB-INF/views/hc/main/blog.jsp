<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/hc/main.css">
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f1f1f1;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.header {
    width: 100%;
    max-width: 1200px;
    background-color: #ffffff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    padding: 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.logo-container {
    width: 100%;
    display: flex;
    justify-content: center;
    margin-bottom: 20px;
    
}

.logo-container img {
    max-width: 100%;
    height: auto;
}

.header-content {
    width: 100%;
    max-width: 1200px;
    display: flex;
    align-items: center;
    margin-top: 5px; /* 로고와 프로필 섹션 사이에 간격 추가 */
}

.profile-picture {
    width: 100px;
    height: 100px;
    background-color: #bbb;
    border-radius: 50%;
    margin-right: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 24px;
    color: white;
    flex-shrink: 0;
}

.profile-info {
    display: flex;
    flex-direction: column;
    flex-grow: 1;
}

.profile-info h2 {
    margin: 0;
    font-size: 24px;
}

.profile-text {
    font-size: 14px;
    color: #666;
    margin-top: 5px;
}

.profile-text p {
    margin: 2px 0;
}

.profile-text span {
    font-weight: bold;
    margin-left: 5px;
}

.profile-actions {
    display: flex;
    margin-top: 10px;
}

.profile-actions button {
    margin-right: 10px;
    padding: 10px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: white;
    cursor: pointer;
}

.profile-actions button:last-child {
    background-color: #28a745;
    margin-right: 0;
}

</style>
    
<!-- 사진 상단 부분  -->
<div class="header">
    <div class="logo-container">
        <img src="/resources/images/logo.png" alt="Logo">
    </div>
    
    <div class="header-content">
        <div class="profile-picture">사진</div>
        <div class="profile-info">
            <h2>이름</h2>
            <div class="profile-text">
                <p>좋아요 갯수 <span>12</span></p>
                <p>팔로워 갯수 <span>121</span></p>
            </div>
        </div>
        <div class="profile-actions">
             <button>쪽지 보내기</button>
             <button>좋아요</button>
        </div>
    </div>
</div>
<!-- 사진 프로필 끝  -->
    <div class="container">
        <div class="sidebar">
            <h3>소개</h3>
            <p>출신</p>
            <p>위치</p>
            <p>이메일</p>
            <h3>사진</h3>
            <div class="photo-grid">
                <div class="photo">A</div>
                <div class="photo">A</div>
                <div class="photo">A</div>
                <div class="photo">A</div>
                <div class="photo">A</div>
                <div class="photo">A</div>
            </div>
        </div>

        <div class="main-content">
            <div class="filters">
                <h3>게시물</h3>
                <button>필터</button>
            </div>
            <div class="posts">
                <div class="post">
                    <div class="post-container">
                        <div class="post-user-info">
                            <div class="user-details">
                                <img src="https://via.placeholder.com/50" alt="User">
                                <div class="user-info-text">
                                    <span>사용자 이름</span>
                                    <span>게시 날짜</span>
                                </div>
                            </div>
                            <div class="user-stats">
                                <div>
                                    <span>좋아요:</span>
                                    <span>100</span>
                                </div>
                                <div>
                                    <span>팔로워:</span>
                                    <span>200</span>
                                </div>
                            </div>
                        </div>
                        <div class="carousel slide">
                            <div class="carousel-item">
                                <img src="https://via.placeholder.com/600x300" alt="Post Image">
                            </div>
                        </div>
                        <div class="post-content">
                            <p>게시물 내용이 여기에 들어갑니다.</p>
                        </div>
                        <div class="post-stats">
                            <div>
                                <span>댓글 수:</span>
                                <span>10</span>
                            </div>
                            <div>
                                <span>공유 수:</span>
                                <span>5</span>
                            </div>
                        </div>
                        <div class="post-actions">
                            <button>좋아요</button>
                            <button>댓글 달기</button>
                            <button>공유하기</button>
                        </div>
                    </div>
                </div>
                <!-- 추가적인 게시물들 -->
            </div>
        </div>
    </div>

<%@ include file="/WEB-INF/views/include/bottom.jsp"%>