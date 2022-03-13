<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="캠핑장 추가 step0" name="title"/>
</jsp:include>

<div class="progress rounded-0 sticky-top" style="height: 8px; top: 72px;">
        <div class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
    <section class="py-5 py-lg-7">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <p class="subtitle text-primary">새로운 캠핑장 추가하기</p>
                    <h1 class="h2 mb-5">캠핑장을 소개해주세요</h1>
                    <p class="text-muted">바다와 파도소리, 밤이면 별이 쏟아지는 해변에서 즐기는 감성캠핑</p>
                    <p class="text-muted">나무가 많아 가을에 오면 푸른 하늘과 울창한 나무의 조화가 멋진 곳이예요</p>
                    <p class="text-muted">울창한 잣 나무 숲 사이 넓은 공간이 마련되어 있어 아이들이 뛰어놀기도 좋아요</p>
                    <p class="text-muted mb-5">나의 캠핑장을 사람들에게 소개해주세요.</p>
                    <p class="mb-5 mb-lg-0"> <a class="btn btn-primary" href="${path}/campsite/step1">캠핑장 추가하기</a></p>
                </div>
                <div class="col-lg-5 ms-auto d-flex align-items-center"><img class="img-fluid" src="${path}/resources/img/newphoto/add_camping.png" alt="" style="width: 500px;"></div>
            </div>
        </div>
    </section>
	
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	