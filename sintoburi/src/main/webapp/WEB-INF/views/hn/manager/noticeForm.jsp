<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="/WEB-INF/views/hn/manager/include/header.jsp" %>
<div class="row">

    <div class="col-xl-12 col-lg-12">
        <div class="card shadow mb-4">
            <!-- Card Header - Dropdown -->
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">공지 사항</h6>
            </div>
            <!-- Card Body -->
            <div class="card-body"> 
                <div class="row">
                    <div class="col-md-12">
                        <form role="form" action="/hn/manager/noticeRegister" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="title">제목</label>
                                <input type="text" class="form-control" id="title" name="title" />
                            </div>

                            <div class="form-group">
                                <label for="content">내용</label>
                                <textarea rows="10" class="form-control" id="content" name="content"></textarea>
                            </div>

                            <div class="form-group">
                                <label for="image">첨부파일</label>
                                <input type="file" id="image" name="image">
                            </div>

                            <div class="col-md-12 text-right">
                                <button class="btnMod btn btn-outline-dark btn-sm" type="submit">작성하기</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div> <!-- card-body -->
        </div>
    </div>
</div>



 <%@ include file="/WEB-INF/views/hn/manager/include/footer.jsp" %>