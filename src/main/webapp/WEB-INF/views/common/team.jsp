<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="팀 소개" name="title" />
</jsp:include>

<section class="hero py-5 py-lg-7">
	<div class="container position-relative">
		<!-- Breadcrumbs -->
		<!--<ol class="breadcrumb ps-0  justify-content-center">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item active">Team </li>
            </ol>-->
		<h1 class="hero-heading">CAMPER'S TEAM</h1>
		<div class="row">
			<div class="col-xl-8 mx-auto">
				<p class="text-muted">안녕하세요! 캠퍼스 팀입니다.</p>
			</div>
		</div>
	</div>
</section>

<section class="py-6">
	<div class="container">
		<h6 class="subtitle text-center mb-4">Developers</h6>
		<div class="row mb-7">
			<div class="mb-3 mb-lg-0 col-sm-6 col-lg-1-1"></div>
			<div class="mb-3 mb-lg-0 col-sm-6 col-lg-3">
				<div class="card border-0 hover-animate bg-transparent">
					<a class="position-relative" href="#"><img class="card-img-top team-img" src="${path}/resources/img/newphoto/ironman.png"
						style="height: 350px;" alt="" />
						<div class="team-circle bg-info-light"></div> </a>
					<div class="card-body team-body text-center">
						<h6 class="card-title">Park Jieon</h6>
						<p class="card-subtitle text-muted text-xs text-uppercase">Leader &amp; Full-stack</p>
					</div>
				</div>
			</div>
			<div class="mb-3 mb-lg-0 col-sm-6 col-lg-3">
				<div class="card border-0 hover-animate bg-transparent">
					<a class="position-relative" href="#"><img
						class="card-img-top team-img" src="${path}/resources/img/newphoto/goshim.png"
						style="height: 350px;" alt="" />
						<div class="team-circle bg-info-light"></div> </a>
					<div class="card-body team-body text-center">
						<h6 class="card-title">Kim Minji</h6>
						<p class="card-subtitle text-muted text-xs text-uppercase">Full-stack Developer</p>
					</div>
				</div>
			</div>
			<div class="mb-3 mb-lg-0 col-sm-6 col-lg-3">
				<div class="card border-0 hover-animate bg-transparent">
					<a class="position-relative" href="#"><img
						class="card-img-top team-img" src="${path}/resources/img/newphoto/roopy.png"
						style="height: 350px;" alt="" />
						<div class="team-circle bg-info-light"></div> </a>
					<div class="card-body team-body text-center">
						<h6 class="card-title">Lee Hanmin</h6>
						<p class="card-subtitle text-muted text-xs text-uppercase">Full-stack Developer</p>
					</div>
				</div>
			</div>
			<div class="mb-3 mb-lg-0 col-sm-6 col-lg-3"></div>
			<div class="mb-3 mb-lg-0 col-sm-6 col-lg-3">
				<div class="card border-0 hover-animate bg-transparent">
					<a class="position-relative" href="#"><img
						class="card-img-top team-img" src="${path}/resources/img/newphoto/chunbae.png"
						style="height: 300px;" alt="" />
						<div class="team-circle bg-info-light"></div> </a>
					<div class="card-body team-body text-center">
						<h6 class="card-title">Kim Yanggyu</h6>
						<p class="card-subtitle text-muted text-xs text-uppercase">Full-stack Developer</p>
					</div>
				</div>
			</div>
			<div class="mb-3 mb-lg-0 col-sm-6 col-lg-3">
				<div class="card border-0 hover-animate bg-transparent">
					<a class="position-relative" href="#"><img
						class="card-img-top team-img" src="${path}/resources/img/newphoto/lion.png"
						style="height: 300px;" alt="" />
						<div class="team-circle bg-info-light"></div> 
					</a>
					<div class="card-body team-body text-center">
						<h6 class="card-title">Lee Junseok</h6>
						<p class="card-subtitle text-muted text-xs text-uppercase">Full-stack Developer</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
