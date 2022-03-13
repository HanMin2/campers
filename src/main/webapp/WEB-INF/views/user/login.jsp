<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Price Slider Stylesheets -->
<link rel="stylesheet" href="vendor/nouislider/nouislider.css">
<!-- Google fonts - Playfair Display-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
<!-- Google fonts - Poppins-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
<!-- swiper-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
<!-- Magnigic Popup-->
<link rel="stylesheet" href="${path}/resources/vendor/magnific-popup/magnific-popup.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="${path}/resources/css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="${path}/resources/css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="${path}/resources/img/newphoto/camper_logo.png">
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
</head>


<body>
    <div class="container-fluid px-3">
        <div class="row min-vh-100">
            <div class="col-md-8 col-lg-6 col-xl-5 d-flex align-items-center">
                <div class="w-100 py-5 px-md-5 px-xxl-6 position-relative">
                    <div class="mb-5"><img class="img-fluid mb-3" src="${path}/resources/img/newphoto/camper_logo_text_removebg.png" alt="..." style="max-width: 15rem;">
                    </div>

                    <ul class="nav nav-tabs search-bar-nav-tabs" role="tablist">
                        <li class="nav-item me-2"><a class="nav-link active Binggrae-Bold" href="#general" data-bs-toggle="tab" role="tab" style="">일반회원</a></li>
                        <li class="nav-item me-2"><a class="nav-link Binggrae-Bold" href="#rent" data-bs-toggle="tab" role="tab">캠핑장회원</a></li>
                    </ul>

                    <div class="search-bar search-bar-with-tabs p-3 p-lg-4">

                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="general" role="tabpanel">

                                <form class="form-validate" id="loginFrm" action="${path}/user/login" method="post">
                                    <div class="mb-4">
                                        <label class="form-label" for="userId">아이디</label>
                                        <input class="form-control" name="userId" id="userId" type="text" placeholder="아이디를 입력하세요." autocomplete="off" required data-msg="Please enter your id">
                                    </div>
                                    <div class="mb-4">
                                        <div class="row">
                                            <div class="col">
                                                <label class="form-label" for="userPwd">비밀번호</label>
                                            </div>
                                            <div class="col-auto"><a class="form-text small text-primary" href="#">비밀번호를 잊으셨나요?</a></div>
                                        </div>
                                        <input class="form-control" name="userPwd" id="userPwd" placeholder="비밀번호를 입력하세요." type="password" required data-msg="Please enter your password">
                                    </div>
                                    <div class="mb-4">
                                        <div class="form-check">
                                            <input class="form-check-input" id="loginRemember1" type="checkbox">
                                            <label class="form-check-label text-muted" for="loginRemember1"> <span class="text-sm">로그인 상태 유지</span></label>
                                        </div>
                                    </div>
                                    <!-- Submit-->
                                    <div class="d-grid">
                                        <button class="btn btn-lg btn-primary">로그인</button>
                                    </div>
                                    <hr class="my-3 hr-text letter-spacing-2" data-content="OR">
                                    <div class="d-grid gap-2">
                                        <!--<button class="btn btn btn-outline-primary btn-social"><i class="fa-2x fa-facebook-f fab btn-social-icon"> </i>Connect <span class="d-none d-sm-inline">with Facebook</span></button>
                                        <button class="btn btn btn-outline-muted btn-social"><i class="fa-2x fa-google fab btn-social-icon"> </i>Connect <span class="d-none d-sm-inline">with Google</span></button>-->
                                        <a class="" href="https://kauth.kakao.com/oauth/authorize?client_id=b8297ee47f4efcf3d66c179430dae7d5&redirect_uri=http://localhost/mvc/user/kakao&response_type=code"><img src="${path}/resources/img/newphoto/kakao_login.png"></a>
                                    </div>
                                    <hr class="my-4">
                                    <p class="text-center"><small class="text-muted text-center">아직 회원이 아니라면?<a href="${path}/user/enroll">회원가입</a></small></p>
                                </form>
                                <a class="close-absolute me-md-5 me-xl-6 pt-5" href="${path}">
                                    <svg class="svg-icon w-3rem h-3rem">
                                            <use xlink:href="#close-1"> </use>
                                    </svg>
                                </a>
                            </div>

                            <div class="tab-pane fade" id="rent" role="tabpanel">

                                <form class="form-validate" id="loginFrm" action="${path}/campsite/login" method="post">
                                    <div class="mb-4">
                                        <label class="form-label" for="id">아이디</label>
                                        <input class="form-control" name="id" id="id" type="text" placeholder="아이디를 입력하세요." autocomplete="off" required data-msg="Please enter your id">
                                    </div>
                                    <div class="mb-4">
                                        <div class="row">
                                            <div class="col">
                                                <label class="form-label" for="password">비밀번호</label>
                                            </div>
                                            <div class="col-auto"><a class="form-text small text-primary" href="#">비밀번호를 잊으셨나요?</a></div>
                                        </div>
                                        <input class="form-control" name="password" id="password" placeholder="비밀번호를 입력하세요." type="password" required data-msg="Please enter your password">
                                    </div>
                                    <div class="mb-4">
                                        <div class="form-check">
                                            <input class="form-check-input" id="loginRemember2" type="checkbox">
                                            <label class="form-check-label text-muted" for="loginRemember2"> <span class="text-sm">로그인 상태 유지</span></label>
                                        </div>
                                    </div>
                                    <!-- Submit-->
                                    <div class="d-grid">
                                        <button class="btn btn-lg btn-primary">로그인</button>
                                    </div>

                                    <div class="d-grid gap-2">

                                    </div>
                                    <hr class="my-4">
                                    <p class="text-center"><small class="text-muted text-center">아직 회원이 아니라면?<a href="${path}/user/enroll">회원가입</a></small></p>
                                </form>
                                <a class="close-absolute me-md-5 me-xl-6 pt-5" href="${path}">
                                    <svg class="svg-icon w-3rem h-3rem">
                                            <use xlink:href="#close-1"> </use>
                                    </svg>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-lg-6 col-xl-7 d-none d-md-block">
                <!-- Image-->
                <!--<div class="bg-cover h-100 me-n3" style="background-image: url(img/photo/photo-1497436072909-60f360e1d4b1.jpg);"></div>-->
                <div class="bg-cover h-100 me-n3"><img src="${path}/resources/img/newphoto/login_image.png"></div>
            </div>
        </div>
    </div>
	<!-- JavaScript files-->
	<script>
        // ------------------------------------------------------- //
        //   Inject SVG Sprite - 
        //   see more here 
        //   https://css-tricks.com/ajaxing-svg-sprite/
        // ------------------------------------------------------ //
        function injectSvgSprite(path) {

            var ajax = new XMLHttpRequest();
            ajax.open("GET", path, true);
            ajax.send();
            ajax.onload = function(e) {
                var div = document.createElement("div");
                div.className = 'd-none';
                div.innerHTML = ajax.responseText;
                document.body.insertBefore(div, document.body.childNodes[0]);
            }
        }
        // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
        // use your own URL in production, please :)
        // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
        //- injectSvgSprite('${path}icons/orion-svg-sprite.svg'); 
        injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg');
    </script>
	<!-- jQuery-->
	<script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
	<!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
	<script src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Magnific Popup - Lightbox for the gallery-->
	<script src="${path}/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
	<!-- Smooth scroll-->
	<script src="${path}/resources/vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
	<!-- Bootstrap Select-->
	<script src="${path}/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
	<script src="${path}/resources/vendor/object-fit-images/ofi.min.js"></script>
	<!-- Swiper Carousel                       -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
	<script>
        var basePath = ''
    </script>
	<!-- Main Theme JS file    -->
	<script src="${path}/resources/js/theme.js"></script>
</body>

</html>
