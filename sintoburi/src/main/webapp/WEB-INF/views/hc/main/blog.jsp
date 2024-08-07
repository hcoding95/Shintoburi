<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/top.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .header-content {
            width: 80%;
            max-width: 1200px;
            display: flex;
            align-items: center;
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
        }

        .profile-info {
            display: flex;
            flex-direction: column;
        }

        .profile-info h2 {
            margin: 0;
            font-size: 24px;
        }

        .profile-info p {
            margin: 5px 0;
        }

        .profile-info button {
            margin-top: 10px;
            margin-right: 10px;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            cursor: pointer;
        }

        .profile-info button:last-child {
            background-color: #28a745;
        }

        .container {
            display: flex;
            width: 80%;
            max-width: 1200px;
            margin-top: 20px;
        }

        .sidebar {
            width: 250px;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            margin-right: 20px;
            flex-shrink: 0;
            position: sticky;
            top: 0;
            height: fit-content;
        }

        .sidebar h3 {
            margin-top: 0;
        }

        .photo-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 5px;
        }

        .photo {
            background-color: #ccc;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .main-content {
            flex-grow: 1;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow-y: auto;
            height: 600px;
        }

        .filters {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .posts {
            background-color: #f9f9f9;
            padding: 10px;
            border-radius: 5px;
        }

        .post {
            background-color: #fff;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .post-container {
            width: 100%; /* 컨테이너의 너비 설정 */
            margin: 0 auto;
            border: 1px solid #ccc;
            padding: 15px;
            border-radius: 8px;
            font-family: Arial, sans-serif;
        }

        .carousel-item img {
            max-width: 100%;
            height: auto;
            min-width: 570px; /* 최소 너비 설정 */
            min-height: 100px; /* 최소 높이 설정 */
        }

        .carousel-control-prev-icon,
        .carousel-control-next-icon {
            background-color: black; /* 화살표 배경색 설정 */
            border-radius: 50%; /* 원형으로 만들기 */
            width: 30px;
            height: 30px;
        }

        .carousel-control-prev-icon {
            background-image: url('data:image/svg+xml;charset=utf8,%3Csvg xmlns%3D"http://www.w3.org/2000/svg" fill%3D"%23ffffff" viewBox%3D"0 0 8 8"%3E%3Cpath d%3D"M4.5 0l-4 4 4 4 1.5-1.5L3 4l2.5-2.5L4.5 0z"/%3E%3C/svg%3E');
        }

        .carousel-control-next-icon {
            background-image: url('data:image/svg+xml;charset=utf8,%3Csvg xmlns%3D"http://www.w3.org/2000/svg" fill%3D"%23ffffff" viewBox%3D"0 0 8 8"%3E%3Cpath d%3D"M3.5 0l4 4-4 4-1.5-1.5L5 4 2.5 1.5 3.5 0z"/%3E%3C/svg%3E');
        }

        .post-icons {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            padding: 5px;
        }

        .post-icons img {
            width: 40px;
            height: 40px;
        }

        .post-user-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            padding: 5px;
        }

        .user-details {
            display: flex;
            align-items: center;
        }

        .user-details img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .user-info-text {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .user-stats {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            width: 200px; /* 좋아요와 팔로워 수를 동일한 기준에 맞추기 위해 너비 설정 */
        }

        .user-stats div {
            display: flex;
            justify-content: space-between;
            width: 100%; /* 좋아요와 팔로워 수 텍스트를 기준 맞추기 위해 너비 설정 */
            margin-bottom: 5px;
        }

        .user-stats span {
            margin-left: 10px;
        }

        .post-user-info img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .post-content {
            margin-bottom: 10px;
            border: 1px solid #ccc;
            padding: 5px;
        }

        .post-stats {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            padding: 5px;
        }

        .post-stats div {
            width: 48%;
        }

        .post-actions {
            display: flex;
            justify-content: space-around;
            border: 1px solid #ccc;
            padding: 5px;
        }

        .post-actions button {
            padding: 10px;
            border: none;
            background: none;
            cursor: pointer;
        }

        .carousel.slide {
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="header-content">
            <div class="profile-picture">사진</div>
            <div class="profile-info">
                <h2>이름</h2>
                <p>좋아요 갯수 팔로워 갯수</p>
                <div>
                    <button>쪽지 보내기</button>
                    <button>좋아요</button>
                </div>
            </div>
        </div>
    </div>

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