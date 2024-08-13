<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/hn/manager/include/bs.jsp" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ include file="/WEB-INF/views/include/top.jsp" %>
  <%@ include file="/WEB-INF/views/hn/mypage/include/myPageSide.jsp" %>
 
               <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <form role="form" action="/hn/mypage/enqRegister" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="user_id">작성자</label>
                                    <input value="${enquiryVo.user_id}" type="text" class="form-control" id="user_id" name="user_id" readonly />
                                </div>

                                <div class="form-group">
                                    <label for="enquiry_type">문의 유형</label>
                                    <select class="form-select" aria-label="Default select example" id="enquiry_type" name="enquiry_type">
                                        <option value="상품문의">상품문의</option>
                                        <option value="배송문의">배송문의</option>
                                        <option value="결제문의">결제문의</option>
                                        <option value="등급문의">등급문의</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="content">내용</label>
                                    <textarea rows="10" class="form-control" id="content" name="content">${enquiryVo.content}</textarea>
                                </div>

                                <div class="form-group">
                                    <label for="image">첨부파일</label>
                                    <input class="form-control" type="file" id="image" name="image">
                                </div>

                                <div class="row">
                                    <div class="col-md-12 text-end">
                                       <button type="submit" class="btn btn-dark btn-submit">작성완료</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
 </div>
 </div>
 <%@ include file="/WEB-INF/views/include/bottom.jsp" %>