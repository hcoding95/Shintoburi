<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            overflow: hidden; /* 스크롤바 제거 */
        }

        .container {
            height: 100%;
            display: flex;
        }

		 .carousel-container {
            width: 80%; /* 왼쪽 영역의 너비 비율을 설정 */
            height: 100%; /* 세로 크기를 화면에 꽉 차게 설정 */
        }

        .carousel-inner {
            height: 100%; /* 세로 크기를 화면에 꽉 차게 설정 */
        }

        .carousel-item img {
            height: 100%;
            object-fit: cover; /* 이미지가 컨테이너를 덮도록 설정 */
        }

        .post-info-container {
            width: 20%; /* 오른쪽 영역의 너비 비율을 설정 */
            height: 100%; /* 세로 크기를 화면에 꽉 차게 설정 */
            background-color: #fff;
            padding: 10px;
            box-shadow: -2px 0 5px rgba(0,0,0,0.1);
            overflow-y: auto; /* 세로 스크롤 활성화 */
        }
		

        textarea {
            width: 100%;
            height: 100px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="carousel-container">
            <div id="imageCarousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="path_to_image1.jpg" class="d-block w-100" alt="First Image">
                    </div>
                    <div class="carousel-item">
                        <img src="path_to_image2.jpg" class="d-block w-100" alt="Second Image">
                    </div>
                    <div class="carousel-item">
                        <img src="path_to_image3.jpg" class="d-block w-100" alt="Third Image">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#imageCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#imageCarousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <div class="post-info-container">
            <h2>글쓴이 정보</h2>
            <p>좋아요: 123</p>
            <p>팔로워: 456</p>
            <button class="btn btn-primary">좋아요</button>
            <button class="btn btn-secondary">팔로우</button>
            <h3>댓글</h3>
            <textarea placeholder="댓글을 입력하세요..."></textarea>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>