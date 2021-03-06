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
					<div class="mb-5">
						<img class="img-fluid mb-3"
							src="${path}/resources/img/newphoto/camper_logo_text_removebg.png" alt="..."
							style="max-width: 15rem;">
						<h2 class="Binggrae-Bold" style="text-align: center;">????????????</h2>
						<p class="text-muted"></p>
					</div>

					<ul class="nav nav-tabs search-bar-nav-tabs" role="tablist">
						<li class="nav-item me-2"><a
							class="nav-link active Binggrae-Bold" href="#general"
							data-bs-toggle="tab" role="tab">????????????</a></li>
						<li class="nav-item me-2"><a class="nav-link Binggrae-Bold"
							href="#rent" data-bs-toggle="tab" role="tab">???????????????</a></li>
					</ul>

					<div class="search-bar search-bar-with-tabs p-3 p-lg-4">

						<div class="tab-content">
							<div class="tab-pane fade show active" id="general"
								role="tabpanel">
								<form class="form-validate" name="userEnrollFrm" action="${ path }/user/enroll" method="POST">
									<div class="mb-4">
										<label class="form-label" for="userId">?????????</label>
										<div class="row ms-1">
											<input class="form-control" style="width: 72%;"	name="userId" id="userId" placeholder="???????????? ???????????????." type="text" required data-msg="Please enter your id">
											<input class="btn btn-primary col-sm-3 ms-2" id="checkDuplicate" value="????????????" />										
										</div>
									</div>
									<div class="mb-4">
										<label class="form-label" for="userPwd">????????????</label> 
										<input class="form-control" name="userPwd" id="userPwd" placeholder="??????????????? ???????????????." type="password" required data-msg="Please enter your password">
									</div>
									<div class="mb-4">
										<label class="form-label" for="userPwd2">???????????? ??????</label>
										<input class="form-control" id="userPwd2" placeholder="??????????????? ?????? ???????????????." type="password" required data-msg="Please enter your password">
									</div>
									<div class="mb-4">
										<label class="form-label" for="name">??????</label> 
										<input class="form-control" name="name" id="name" placeholder="????????? ???????????????." type="text" required data-msg="Please enter your name">
									</div>
									<div class="mb-4">
										<label class="form-label" for="tel">????????????</label> 
										<input class="form-control" name="tel" id="tel" placeholder="??????????????? ???????????????." type="tel" required data-msg="Please enter your tel">
									</div>
									<div class="mb-4">
										<label class="form-label" for="email">?????????</label> 
										<input class="form-control" name="email" id="email" type="email" placeholder="name@address.com" autocomplete="off" required data-msg="Please enter your email">
									</div>
									<div class="mb-4">
										<label class="form-label" for="address">??????</label> 
										<input class="form-control" name="address" id="address" placeholder="????????? ???????????????." type="text" required data-msg="Please enter your address">
									</div>
									<div class="d-grid gap-2">
										<button class="btn btn-lg btn-primary" id="enrollSubmit" type="submit">????????????</button>
									</div>
									<hr class="my-3 hr-text letter-spacing-2" data-content="OR">
									<div class="d-grid gap-2">
										<a class=""href="https://kauth.kakao.com/oauth/authorize?client_id=b8297ee47f4efcf3d66c179430dae7d5&redirect_uri=http://localhost/mvc/user/kakao&response_type=code">
										<!-- <a class="" id="kakao-login-btn"> -->
										<img id="" src="${path}/resources/img/newphoto/kakao_login.png"></a>
									</div>

									<hr class="my-4">
									<p class="text-sm text-muted">
										By signing up you agree to CAMPER's <a href="#">Terms and
											Conditions</a> and <a href="#">Privacy Policy</a>.
									</p>
								</form>
								<a class="close-absolute me-md-5 me-xl-6 pt-5" href="${path}">
									<svg class="svg-icon w-3rem h-3rem">
                                        <use xlink:href="#close-1"> </use>
                                    </svg>
								</a>
							</div>

							<div class="tab-pane fade" id="rent" role="tabpanel">
								<form class="form-validate"  name="campsiteEnrollFrm" action="${ path }/campsite/enroll" method="POST">
									<div class="mb-4">
										<label class="form-label" for="id">?????????</label>
										<div class="row ms-1">
											<input class="form-control" style="width: 72%;" name="id" id="id" placeholder="???????????? ???????????????." type="text" required data-msg="Please enter your id">
											<input class="btn btn-primary col-sm-3 ms-2" id="checkDuplicate2" value="????????????" />										
										</div>
									</div>
									<div class="mb-4">
										<label class="form-label" for="password">????????????</label> 
										<input class="form-control" name="password" id="password" placeholder="??????????????? ???????????????." type="password" required data-msg="Please enter your password">
									</div>
									<div class="mb-4">
										<label class="form-label" for="password2">???????????? ??????</label>
										<input class="form-control" name="password2" id="password2" placeholder="??????????????? ?????? ???????????????." type="password" required data-msg="Please enter your password">
									</div>
									<div class="d-grid gap-2">
										<button class="btn btn-lg btn-primary" id="enrollSubmit" type="submit">????????????</button>
									</div>

									<hr class="my-4">
									<p class="text-sm text-muted">
										By signing up you agree to CAMPER's <a href="#">Terms and
											Conditions</a> and <a href="#">Privacy Policy</a>.
									</p>
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
				<div class="bg-cover h-100 me-n3"
					style="background-image: url(${path}/resources/img/newphoto/signup_image.jpg);"></div>
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
	
	<script>
		$(document).ready(() => {
			$("#userPwd2").blur((event) => {
				let pass1 = $("#userPwd").val();			
				let pass2 = $(event.target).val();
				
				if(pass1.trim() != pass2.trim()) {
					alert("??????????????? ???????????? ????????????.");
					
					$("#userPwd").val("");
					$(event.target).val("");
					$("#userPwd").focus();
				}
			});
			
			$("#password2").blur((event) => {
				let pass1 = $("#password").val();			
				let pass2 = $(event.target).val();
				
				if(pass1.trim() != pass2.trim()) {
					alert("??????????????? ???????????? ????????????.");
					
					$("#password").val("");
					$(event.target).val("");
					$("#password").focus();
				}
			});
	    	
		    $("#enrollSubmit").on("click", () => {
		    	// TODO ???????????? ?????? ??? ????????? ????????? ??????????????? ???????????? ??????!
		    	//return false;
		    });
		    
		 	// ????????? ????????? ?????? ?????? ????????????
			$("#checkDuplicate").on("click", () => {
				let id = $("#userId").val().trim();
				
				if (id.length < 4) {
					alert("???????????? ?????? 4?????? ?????? ???????????????.")
					
					return;
				}
				
				$.ajax({
					type: "get",
					url: "${path}/user/idCheck",
					dataType: "json",
					data: {
						id // ????????? ????????? ???????????? ????????? ??????
					},
					success: 
					function(data) {
						console.log(data);
						
						if(data.validate === true) {
							alert("?????? ???????????? ????????? ?????????.");
						} else {
							alert("?????? ????????? ????????? ?????????.");							
						}
					},
					error: function(e) {
						console.log(e);
					}
				});
			});
		 	
			$("#checkDuplicate2").on("click", () => {
				let id = $("#id").val().trim();
				
				if (id.length < 4) {
					alert("???????????? ?????? 4?????? ?????? ???????????????.")
					
					return;
				}
				
				$.ajax({
					type: "get",
					url: "${path}/campsite/idCheck",
					dataType: "json",
					data: {
						id // ????????? ????????? ???????????? ????????? ??????
					},
					success: 
					function(data) {
						console.log(data);
						
						if(data.validate === true) {
							alert("?????? ???????????? ????????? ?????????.");
						} else {
							alert("?????? ????????? ????????? ?????????.");							
						}
					},
					error: function(e) {
						console.log(e);
					}
				});
			});
		 	
			
		});
	
	</script>	
	
	<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	
	<script type='text/javascript'>
	Kakao.init('55b6be4dd88e467de806ae5586aa2142');


	$("#kakao-login-btn").on("click", function(){
    //1. ????????? ??????
    Kakao.Auth.login({
        success: function(authObj) {
         
        //2. ????????? ?????????, API ??????
        Kakao.API.request({
            url: '/v2/user/me',
            success: function(res) {
              console.log(res);
              var id = res.id;
			  scope : 'account_email';
			alert('???????????????');
              location.href="${path}";
              
        }
          })
          console.log(authObj);
          var token = authObj.access_token;
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
        
})


</script>
	
</body>

</html>
