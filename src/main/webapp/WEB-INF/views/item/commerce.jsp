<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="캠핑용품커머스 | 메인" name="title" />
</jsp:include>

<!-- <form action="${ path }/campsite/searchList">  -->
	<div class="container-xl">
		<div
			class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light"
			style="background: center center url(${path}/resources/img/newphoto/tent.jpg) no-repeat; background-size: cover;">
			<div class="col-md-5 p-lg-5 mx-auto my-5">
				<h1 class="display-4 fw-normal" style="color: white">텐트</h1>
				<p class="lead fw-normal"></p>
				<a class="btn btn-outline-success" href="${path}/item/searchList?search=텐트">BUY</a>
			</div>
		</div>

		<div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3">
			<div
				class="bg-dark me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden"
				style="background: center center url(${path}/resources/img/newphoto/lantern.jpg) no-repeat; background-size: cover;">
				<div class=" my-3 py-3 ">
					<h2 class="display-5">랜턴</h2>
					<p class="lead"></p>
					<a class="btn btn-outline-success" href="${path}/item/searchList?search=랜턴">BUY</a>
				</div>
			</div>
			<div
				class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden"
				style="background: center center url(${path}/resources/img/newphoto/cookware.jpg) no-repeat; background-size: cover;">
				<div class="my-3 p-3 ">
					<h2 class="display-5" style="color: white;">취사도구</h2>
					<p class="lead"></p>
					<a class="btn btn-outline-success" href="${path}/item/searchList?search=취사도구">BUY</a>
				</div>
				<div class="shadow-sm mx-auto "
					style="width: 80%; height: 300px; border-radius: 0 0 0 0;"></div>
			</div>
		</div>

		<div class="d-md-flex flex-md-equal w-100 my-md-3 ps-md-3 ">
			<div
				class="bg-light me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden"
				style="background: center center url(${path}/resources/img/newphoto/box.jpg) no-repeat; background-size: cover;">
				<div class="my-3 p-3 ">
					<h2 class="display-5" style="color: white;">아이스박스</h2>
					<p class="lead"></p>
					<a class="btn btn-outline-success" href="${path}/item/searchList?search=아이스박스">BUY</a>
				</div>
			</div>
			<div
				class="bg-primary me-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden"
				style="background: center center url(${path}/resources/img/newphoto/etc.jpg) no-repeat; background-size: cover;">
				<div class="my-3 py-3 ">
					<h2 class="display-5" style="color: white;">기타캠핑용품</h2>
					<p class="lead "></p>
					<a class="btn btn-outline-success" href="${path}/item/searchList?search=기타캠핑용품">BUY</a>
				</div>
				<div class="shadow-sm mx-auto "
					style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;"></div>
			</div>
		</div>
	</div>
<!-- </form> -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
