<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="캠핑장 추가 step5" name="title"/>
</jsp:include>


<div class="progress rounded-0 sticky-top" style="height: 8px; top: 100px;">
        <div class="progress-bar" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
    <section class="py-5 py-lg-5">
        <div class="container text-center">
            <p class="subtitle text-primary">캠핑장 추가하기</p>
            <h1 class="h2 mb-5">Success!</h1>
            <p class="mb-5"><img class="img-fluid" src="${path}/resources/img/newphoto/add_camping.png" alt="" style="width: 400px;"></p>
            <p class="text-muted mb-5">캠핑장이 추가되었습니다. 마이 메뉴에서 확인해보세요!</p>
            <p class="mb-5"><a class="btn btn-primary me-2 mb-2" href="user-profile-camping.html">내 캠핑장 보기</a><a class="btn btn-outline-muted mb-2" href="index.html">메인으로</a></p>
        </div>
    </section>
    

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	