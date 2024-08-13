<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 모달창 스타일  -->
<style>
.modal-dialog.modal-fullscreen {
    max-width: 100%;
    margin: 0;
    height: 100%;
    display: flex;
    flex-direction: column;
}

.modal-content {
    height: 100%;
    border: none;
    border-radius: 0;
}

.modal-body {
    flex-grow: 1;
    overflow-y: auto;
}

.left {
    display: flex;
    justify-content: flex-start;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    padding: 5px;
    background: #fff; /* 각 구역의 흰색 배경 */
    border-radius: 8px; /* 둥근 모서리 적용 */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 가벼운 그림자 추가 */
    justify-content: space-between;
}        

.left img {
    width: 50px;
    height: 50px;
    border-radius: 8px; /* 이미지에도 둥근 모서리 적용 */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 이미지에도 그림자 추가 */
}        
        
</style>
<!-- 모달창 jsp 뛰우기 -->
<div class="modal fade" id="myModal${detailVo.blog_no }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <iframe src="/hc/blog/detail?blog_no=${detailVo.blog_no}" frameborder="0" style="width: 100%; height: 100%; overflow: hidden;" scrolling="no"></iframe>
            </div>
            <div class="modal-footer">
            	<div class="left">
            		<c:forEach items="${detailVo.productTagList}" var="tag">
            			<a href="#"><img src="/resources/images/logo.png" alt="Icon 1">${tag.product_id}</a>
            		</c:forEach>
            	</div>
                <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>