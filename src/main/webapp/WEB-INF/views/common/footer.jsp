<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

    <!-- Footer-->
    <footer class="position-relative z-index-10 d-print-none">
        <!-- Main block - menus, subscribe form-->
        <div class="py-3 bg-gray-200 text-muted">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <div class="mb-3"><img src="${path}/resources/img/newphoto/camper_logo_text_removebg.png" alt="Directory logo"></div>
                    </div>

                    <div class="col-lg-6 col-md-6 mb-5 mt-3 mb-lg-0" style="text-align: center;">
                        <ul class="list-inline">
                            <li class="list-inline-item"><a class="text-muted" href="common/team">팀 소개</a></li>
                            <li class="list-inline-item">|</li>
                            <li class="list-inline-item"><a class="text-muted" href="common/FAQ">FAQ</a></li>
                            <li class="list-inline-item">|</li>
                            <li class="list-inline-item"><a class="text-muted" href="">개인정보처리방침</a></li>
                            <li class="list-inline-item">|</li>
                            <li class="list-inline-item"><a class="text-muted" href="">캠핑장 등록안내</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-2 col-md-6 mb-5 mt-3 mb-lg-0">
                        <ul class="list-inline">
                            <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="instagram"><i class="fab fa-instagram"></i></a></li>
                            <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="github"><i class="fab fa-github"></i></a></li>
                            <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="aws"><i class="fab fa-aws"></i></a></li>
                            <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="app-store-ios"><i class="fab fa-app-store-ios"></i></a></li>
                            <li class="list-inline-item"><a class="text-muted text-primary-hover" href="#" target="_blank" title="google-play"><i class="fab fa-google-play"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="py-3 bg-gray-200 text-muted">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                        <!--<h6 class="text-uppercase text-dark mb-3">Daily Offers & Discounts</h6>-->
                        <p class="mb-3 sans-serif">서울 강남구 테헤란로14길 6 남도빌딩 2층, 3층, 4층 KH정보교육원 강남지원
                            <br>TEL:1544-9970&emsp;EMAIL:webmaster@campers.com
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Copyright section of the footer-->
        <div class="py-4 fw-light bg-gray-800 text-gray-300">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-6 text-center text-md-start">
                        <p class="text-sm mb-md-0">&copy; 2021, Your company. All rights reserved.</p>
                    </div>
                    <div class="col-md-6">
                        <ul class="list-inline mb-0 mt-2 mt-md-0 text-center text-md-end">
                            <li class="list-inline-item"><img class="w-2rem" src="${path}/resources/img/visa.svg" alt="..."></li>
                            <li class="list-inline-item"><img class="w-2rem" src="${path}/resources/img/mastercard.svg" alt="..."></li>
                            <li class="list-inline-item"><img class="w-2rem" src="${path}/resources/img/paypal.svg" alt="..."></li>
                            <li class="list-inline-item"><img class="w-2rem" src="${path}/resources/img/western-union.svg" alt="..."></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
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

    <!-- bundle -->
    <script src="${path}/resources/assets/js/vendor.min.js "></script>
    <script src="${path}/resources/assets/js/app.min.js "></script>

    <!-- third party js -->
    <script src="${path}/resources/assets/js/vendor/jquery-ui.min.js "></script>
    <script src="${path}/resources/assets/js/vendor/fullcalendar.min.js "></script>
    <!-- third party js ends -->

    <!-- demo app -->
    <script src="${path}/resources/assets/js/pages/demo.calendar.js "></script>
    <!-- end demo js-->

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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
    <script>
        var basePath = ''
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-date-range-picker/0.19.0/jquery.daterangepicker.min.js">
    </script>
    <script src="${path}/resources/js/datepicker-category.js">
    </script>
    <!-- Main Theme JS file    -->
    <script src="${path}/resources/js/theme.js"></script>

    <!--add jquery-->
    <script src="${path}/resources/vendor/jquery/custom.js"></script>

</body>

</html>