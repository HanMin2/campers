<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Camper's | 캠퍼스</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">

<!-- Custom styles for this template -->
<link href="${path}/resources/css/product.css" rel="stylesheet">

<!-- third party css -->
<link href="${path}/resources/assets/css/vendor/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" />
<link href="${path}/resources/assets/css/vendor/responsive.bootstrap4.css" rel="stylesheet" type="text/css" />
<!-- third party css end -->

<!-- HYPER App css -->
<link href="${path}/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<link href="${path}/resources/assets/css/app-creative.min.css" rel="stylesheet" type="text/css" id="light-style" />

<!-- Price Slider Stylesheets -->
<link rel="stylesheet" href="${path}/resources/vendor/nouislider/nouislider.css">

<!-- Google fonts - Playfair Display-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">

<!-- Google fonts - Poppins-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">

<!-- swiper-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">

<!-- Magnigic Popup-->
<link rel="stylesheet" href="${path}/resources/vendor/magnific-popup/magnific-popup.css">

<!-- theme stylesheet-->
<link rel="stylesheet" href="${path}/resources/css/style.default.css" id="theme-stylesheet">

<!-- Favicon-->
<link rel="shortcut icon"href="${path}/resources/img/newphoto/camper_logo.png">
<!-- Tweaks for older IEs-->
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>


</head>

<body style="padding-top: 72px;">
	<header class="header">
		<!--로그인 전-->
		<c:if test="${ loginUser == null && loginCampsite == null}">
			<form id="loginFrm" action="${path}/login" method="post">
				<!-- Navbar-->
				<nav
					class="navbar navbar-expand-lg fixed-top shadow navbar-light bg-white">
					<!--<div class="container-fluid px-8">-->
					<div class="container-fluid">
						<div class="d-flex align-items-center">
							<a class="navbar-brand py-1" href="${path}"><img
								src="${path}/resources/img/newphoto/camper_logo_text.png"
								alt="Campers logo"></a>
						</div>
						<button class="navbar-toggler navbar-toggler-right" type="button"
							data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
							aria-controls="navbarCollapse" aria-expanded="false"
							aria-label="Toggle navigation">
							<i class="fa fa-bars"></i>
						</button>
						<!-- Navbar Collapse -->
						<div class="collapse navbar-collapse" id="navbarCollapse">
							<ul class="navbar-nav ms-auto">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle active TmoneyRoundWindExtraBold"
									id="homeDropdownMenuLink" href="index.html"
									data-bs-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false" style="font-size: 1.2rem;">캠핑장</a>
									<div class="dropdown-menu"
										aria-labelledby="homeDropdownMenuLink">
										<a class="dropdown-item GmarketSansMedium"
											href="${path }/searchList2/gnrlsite" >캠핑</a> <a
											class="dropdown-item GmarketSansMedium"
											href="${path }/searchList2/autosite">오토캠핑</a> <a
											class="dropdown-item GmarketSansMedium"
											href="${path }/searchList2/glampsite">글램핑</a> <a
											class="dropdown-item GmarketSansMedium"
											href="${path }/searchList2/caravsite">카라반</a>
									</div></li>

								<!-- /Megamenu end-->
								<li class="nav-item ps-2"><a
									class="nav-link TmoneyRoundWindExtraBold"
									href="${path}/item/commerce" style="font-size: 1.2rem;">캠핑용품커머스</a>
								</li>
								<li class="nav-item dropdown ps-2"><a
									class="nav-link dropdown-toggle TmoneyRoundWindExtraBold"
									id="docsDropdownMenuLink" href="index.html"
									data-bs-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false" style="font-size: 1.2rem;">게시판</a>
									<div class="dropdown-menu dropdown-menu-end"
										aria-labelledby="docsDropdownMenuLink">
										<h6 class="dropdown-header fw-normal GmarketSansMedium">게시판</h6>
										<a class="dropdown-item GmarketSansMedium"
											href="${path}/boards/reviewList">후기 게시판</a> <a
											class="dropdown-item GmarketSansMedium"
											href="${path}/boards/freeList">자유 게시판</a>
										
									</div></li>
								<li class="nav-item ps-2"><a
									class="nav-link TmoneyRoundWindExtraBold"
									href="${path}/user/login" style="font-size: 1.2rem;">로그인</a></li>
								<li class="nav-item ps-2"><a
									class="nav-link TmoneyRoundWindExtraBold"
									href="${path}/user/enroll" style="font-size: 1.2rem;">회원가입</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</form>
		</c:if>

		<!--일반회원 로그인 후-->
		<c:if test="${ loginUser != null }">
			<nav
				class="navbar navbar-expand-lg fixed-top shadow navbar-light bg-white">
				<div class="container-fluid">
					<div class="d-flex align-items-center">
						<a class="navbar-brand py-1" href="${path}"><img
							src="${path}/resources/img/newphoto/camper_logo_text.png"
							alt="Campers logo"></a>
					</div>
					<button class="navbar-toggler navbar-toggler-right" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
						aria-controls="navbarCollapse" aria-expanded="false"
						aria-label="Toggle navigation">
						<i class="fa fa-bars"></i>
					</button>
					<!-- Navbar Collapse -->
					<div class="collapse navbar-collapse" id="navbarCollapse">
						<form class="form-inline mt-4 mb-2 d-sm-none" action="#"
							id="searchcollapsed"></form>
						<ul class="navbar-nav ms-auto">

							<h6 class="pt-3">반갑습니다. ${ loginUser.name }님! &nbsp;&nbsp;</h6>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle active TmoneyRoundWindExtraBold"
								id="homeDropdownMenuLink" href="index.html"
								data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false" style="font-size: 1.2rem;">캠핑장</a>
								<div class="dropdown-menu"
									aria-labelledby="homeDropdownMenuLink">
										<a class="dropdown-item GmarketSansMedium"
											href="${path }/searchList2/gnrlsite" >캠핑</a> <a
											class="dropdown-item GmarketSansMedium"
											href="${path }/searchList2/autosite">오토캠핑</a> <a
											class="dropdown-item GmarketSansMedium"
											href="${path }/searchList2/glampsite">글램핑</a> <a
											class="dropdown-item GmarketSansMedium"
											href="${path }/searchList2/caravsite">카라반</a>
								</div></li>

							<!-- /Megamenu end-->
							<li class="nav-item ps-2"><a
								class="nav-link TmoneyRoundWindExtraBold"
								href="${path}/item/commerce" style="font-size: 1.2rem;">캠핑용품커머스</a>
							</li>
							<li class="nav-item dropdown ps-2"><a
								class="nav-link dropdown-toggle TmoneyRoundWindExtraBold"
								id="docsDropdownMenuLink" href="index.html"
								data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false" style="font-size: 1.2rem;">게시판</a>
								<div class="dropdown-menu dropdown-menu-end"
									aria-labelledby="docsDropdownMenuLink">
									<h6 class="dropdown-header fw-normal GmarketSansMedium">게시판</h6>
									<a class="dropdown-item GmarketSansMedium" 
									href="${path}/boards/reviewList">후기 게시판</a> 
									<a class="dropdown-item GmarketSansMedium"
										href="${path}/boards/freeList">자유 게시판</a>
								</div></li>
							<li class="nav-item dropdown ps-2"><a
								class="nav-link dropdown-toggle TmoneyRoundWindExtraBold"
								id="docsDropdownMenuLink" href="index.html"
								data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false" style="font-size: 1.2rem;">My Menu</a>
								<div class="dropdown-menu dropdown-menu-end"
									aria-labelledby="docsDropdownMenuLink">
									<h6 class="dropdown-header fw-normal">계정</h6>
									<a class="dropdown-item GmarketSansMedium"
										href="${path}/user/view">회원 정보</a>
									<div class="dropdown-divider"></div>
									<h6 class="dropdown-header fw-normal">예약</h6>
									<a class="dropdown-item GmarketSansMedium"
										href="${path}/reservation/historyForUser">예약 내역</a> <a
										class="dropdown-item GmarketSansMedium"
										href="${path}/inquiry/listByUser">1:1 문의 내역</a>
								</div></li>
							<li class="nav-item ps-2"><a
								class="nav-link TmoneyRoundWindExtraBold"
								href="${path}/user/logout" style="font-size: 1.2rem;">로그아웃</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</c:if>

		<!--캠핑장회원 로그인 후-->
		<c:if test="${ loginCampsite != null }">
			<nav
				class="navbar navbar-expand-lg fixed-top shadow navbar-light bg-white">
				<div class="container-fluid">
					<div class="d-flex align-items-center">
						<a class="navbar-brand py-1" href="${path}"><img
							src="${path}/resources/img/newphoto/camper_logo_text.png"
							alt="Campers logo"></a>
					</div>
					<button class="navbar-toggler navbar-toggler-right" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
						aria-controls="navbarCollapse" aria-expanded="false"
						aria-label="Toggle navigation">
						<i class="fa fa-bars"></i>
					</button>
					<!-- Navbar Collapse -->
					<div class="collapse navbar-collapse" id="navbarCollapse">
						<form class="form-inline mt-4 mb-2 d-sm-none" action="#"
							id="searchcollapsed">
							<div class="input-label-absolute input-label-absolute-left w-100">
								<label class="label-absolute" for="searchcollapsed_search"><i
									class="fa fa-search"></i><span class="sr-only">What are
										you looking for?</span></label> <input
									class="form-control form-control-sm border-0 shadow-0 bg-gray-200"
									id="searchcollapsed_search" placeholder="Search"
									aria-label="Search" type="search">
							</div>
						</form>
						<ul class="navbar-nav ms-auto">
							<h6 class="pt-3">반갑습니다. ${ loginCampsite.id }님! &nbsp;&nbsp;</h6>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle active TmoneyRoundWindExtraBold"
								id="homeDropdownMenuLink" href="index.html"
								data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false" style="font-size: 1.2rem;">캠핑장</a>
								<div class="dropdown-menu"
									aria-labelledby="homeDropdownMenuLink">
										<a class="dropdown-item GmarketSansMedium"
											href="${path }/searchList2/gnrlsite" >캠핑</a> <a
											class="dropdown-item GmarketSansMedium"
											href="${path }/searchList2/autosite">오토캠핑</a> <a
											class="dropdown-item GmarketSansMedium"
											href="${path }/searchList2/glampsite">글램핑</a> <a
											class="dropdown-item GmarketSansMedium"
											href="${path }/searchList2/caravsite">카라반</a>
								</div></li>

							<!-- /Megamenu end-->
							<li class="nav-item ps-2"><a
								class="nav-link TmoneyRoundWindExtraBold"
								href="${path}/item/commerce" style="font-size: 1.2rem;">캠핑용품커머스</a>
							</li>
							<li class="nav-item dropdown ps-2"><a
								class="nav-link dropdown-toggle TmoneyRoundWindExtraBold"
								id="docsDropdownMenuLink" href="index.html"
								data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false" style="font-size: 1.2rem;">게시판</a>
								<div class="dropdown-menu dropdown-menu-end"
									aria-labelledby="docsDropdownMenuLink">
									<h6 class="dropdown-header fw-normal GmarketSansMedium">게시판</h6>
									<a class="dropdown-item GmarketSansMedium" href="${path}/boards/reviewList">후기
										게시판</a> <a class="dropdown-item GmarketSansMedium"
										href="${path}/boards/freeList">자유 게시판</a>
								</div></li>
							<li class="nav-item dropdown ps-2"><a
								class="nav-link dropdown-toggle TmoneyRoundWindExtraBold"
								id="docsDropdownMenuLink" href="index.html"
								data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false" style="font-size: 1.2rem;">My Menu</a>
								<div class="dropdown-menu dropdown-menu-end"
									aria-labelledby="docsDropdownMenuLink">
									<h6 class="dropdown-header fw-normal">계정</h6>
									<a class="dropdown-item GmarketSansMedium"
										href="${path}/campsite/userView">캠핑장 회원 정보</a>
									<div class="dropdown-divider"></div>
									<h6 class="dropdown-header fw-normal">예약</h6>
									<a class="dropdown-item GmarketSansMedium"
										href="${path}/reservation/historyForCampsite">내 캠핑장 예약 내역</a> <a
										class="dropdown-item GmarketSansMedium"
										href="${path}/inquiry/listByCampsite">1:1 문의 내역</a>
								</div></li>
							<li class="nav-item ps-2"><a
								class="nav-link TmoneyRoundWindExtraBold"
								href="${path}/campsite/logout" style="font-size: 1.2rem;">로그아웃</a></li>
							<!--<li class="nav-item mt-3 mt-lg-0 ms-lg-3 d-lg-none d-xl-inline-block"><a class="btn btn-primary" href="user-add-0.html">Add a listing</a></li>-->
						</ul>
					</div>
				</div>
			</nav>
		</c:if>
		<!-- /Navbar -->
	</header>