<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="캠핑용품커머스 | 검색결과" name="title" />
</jsp:include>

<style>
@font-face {
    font-family: 'SUIT-Medium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Medium.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

.SUIT-Medium {
	   font-family: 'SUIT-Medium';
}

</style>
                            
<!-- Start Content-->
<div class="container-xl">
	<div class="mt-sm-4 container-fluid">

		<!-- start page title -->
		<div class="row">
			<div class="col-12">
				<div class="page-title-box">
					<h3 class="page-title" style="padding-top: 30px;">캠핑용품 검색결과</h3>
				</div>
			</div>
		</div>
		<!-- end page title -->

		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<div class="row mb-2">
							<div class="col-sm-4 app-search dropdown m-md-auto my-md-5">
								<form action="${ path }/item/searchList" method="get">
									<div class="input-group">
										<input type="text" class="form-control GmarketSansMedium" 
										style="height: 2.1rem; border-radius: 0.4rem;" placeholder="${search}" 
										name="search" id="search" > 
										<span class="mdi mdi-magnify search-icon"></span>
										<div class="input-group-append">
											<button class="btn btn-primary" type="submit">Search</button>
										</div>
									</div>
								</form>
							</div>
							<!-- end col-->
						</div>


						<div class="table-responsive">
							<div class="row">
                                <div class="col-md-2 py-3 pt-5">
                                	<c:if test="${ itemsList == null }">
                                    <p>&nbsp;&nbsp;검색결과 0개</p>
                                    </c:if>
                                	<c:if test="${ itemsList != null }">
                                    <p>&nbsp;&nbsp;검색결과 ${ fn:length(itemsList) }개</p>
                                    </c:if>
                                </div>
                                <div class="col-md-2 col-lg-2 d-flex align-items-center form-group no-divider">
                                    <select class="selectpicker GmarketSansMedium pt-3" title="검색필터" data-style="btn-form-control">
                                		<option value="type_0">낮은가격순</option>
                                        <option value="type_1">높은가격순</option>
                                    </select>
                                </div>

                            </div>
							<table class="table table-centered w-100 dt-responsive nowrap">
								<thead class="thead-light SUIT-Medium" style="color: #919ca7; background-color: #f1f3fa; border-color: #eef2f7">
									<tr>
										<th class="all" style="width: 20px;">
											<label class="custom-control-label" for="">&nbsp;</label>
										</th>
										<th class="all" style="width: 80px;"></th>
										<th style="text-align: center;">상품</th>
										<th style="text-align: center;">가격</th>
										<th style="text-align: center;">판매처</th>
										<th style="text-align: center;">카테고리</th>
										<th style="text-align: center;">브랜드</th>
										<th style="text-align: center;">제조사</th>
									</tr>
								</thead>
								<c:if test="${ itemsList == null }">
									<tbody>
										<tr>
											<td colspan="6">
												<h4>조회된 아이템이 없습니다.</h4>
											</td>										
										</tr>
									</tbody>
								</c:if>
								<c:if test="${ itemsList != null }">
									<c:forEach var="item" items="${ itemsList }">
										<tbody>
											<tr>
												<td>
													<div class="custom-control custom-checkbox">
														<!-- <input type="checkbox" class="custom-control-input"
															id="customCheck2"> <label
															class="custom-control-label" for="customCheck2">-->&nbsp;</label>
													</div>
												</td>
												<td><img src="${item.image}" alt="contact-img" title="contact-img" class="rounded mr-3" height="80"   /></td>
												<td>
													<p class="m-0 d-inline-block align-middle font-16">
														<a href="${item.link}" class="SUIT-Medium text-body"><c:out value="${item.title}"/></a>
													</p>
												</td>
												<td><span class="badge badge-success SUIT-Medium" style="text-align: center; color: #fff; background-color: #445C3C; font-size:1rem;">
													<fmt:formatNumber value="${item.lprice}" pattern="#,###" />원</span></td>
												<td class="SUIT-Medium" style="text-align: center;">${item.mallName}</td>
												<td class="SUIT-Medium" style="font-size:0.8rem;">${item.category1} > ${item.category2} > ${item.category3}</td>
												<td class="SUIT-Medium" >${item.brand}</td>
												<td class="SUIT-Medium">${item.maker}</td>
											</tr>
										</tbody>
									</c:forEach>
								</c:if>
							</table>
						</div>

					</div>
					<!-- end card-body-->
				</div>
				<!-- end card-->
			</div>
			<!-- end col -->
		</div>
		<!-- end row -->
	</div>
</div>
<!-- container -->
<!-- Footer Start -->
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
                            <li class="list-inline-item"><a class="text-muted" href="team.html">팀 소개</a></li>
                            <li class="list-inline-item">|</li>
                            <li class="list-inline-item"><a class="text-muted" href="knowledge-base.html">FAQ</a></li>
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
    <!-- end Footer -->

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->


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

    <!-- bundle -->
    <script src="${path}/resources/assets/js/vendor.min.js"></script>
    <script src="${path}/resources/assets/js/app.min.js"></script>


    <!-- third party js -->
    <script src="${path}/resources/assets/js/vendor/jquery.dataTables.min.js"></script>
    <script src="${path}/resources/assets/js/vendor/dataTables.bootstrap4.js"></script>
    <script src="${path}/resources/assets/js/vendor/dataTables.responsive.min.js"></script>
    <script src="${path}/resources/assets/js/vendor/responsive.bootstrap4.min.js"></script>
    <script src="${path}/resources/assets/js/vendor/dataTables.checkboxes.min.js"></script>
    <!-- third party js ends -->

    <!-- demo app -->
    <script src="${path}/resources/assets/js/pages/demo.products.js"></script>
    <!-- end demo js-->