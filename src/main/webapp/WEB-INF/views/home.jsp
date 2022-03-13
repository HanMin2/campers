<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Main Page" name="title"/>
</jsp:include>

<style>
@font-face {
	font-family: 'SUIT-Medium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Medium.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

.SUIT-Medium {
	font-family: 'SUIT-Medium';
}
</style>

<section class="d-flex align-items-center dark-overlay bg-cover" style="background-image: url(${path}/resources/img/newphoto/main1.png);">
        <div class="container py-6 py-lg-7 text-white overlay-content">
            <div class="row">
                <div class="col-xl-8">
                    <h1 class="display-4 text-shadow yangjin">슬기로운 캠퍼생활</h1>
                    <p class="text-xl mb-6 yangjin">일상에 자연 한 스푼</p>
                </div>
            </div>
        </div>
    </section>
    <div class="container position-relative mt-n6 z-index-20">
        <ul class="nav nav-tabs search-bar-nav-tabs" role="tablist">
            <li class="nav-item me-2"><a class="nav-link active GmarketSansMedium" href="#buy" data-bs-toggle="tab" role="tab">캠핑장</a></li>
            <li class="nav-item me-2"><a class="nav-link GmarketSansMedium" href="#rent" data-bs-toggle="tab" role="tab">캠핑용품</a></li>
        </ul>
        <div class="search-bar search-bar-with-tabs p-3 p-lg-4">
            <div class="tab-content">
                <div class="tab-pane fade show active" id="buy" role="tabpanel">
                    <form action="${ path }/campsite/searchList">
                        <div class="row">
                            <div class="col-lg-3 d-flex align-items-center form-group no-divider">
                                <!--<select class="selectpicker form-control" title="지역" data-style="btn-form-control" multiple data-selected-text-format="count &gt; 2">-->
                                <select class="selectpicker form-control SUIT-Medium" title="지역" data-style="btn-form-control" name="searchLoc" id="select1">
                                    <option value="전체">전체</option>
                                    <option value="서울">서울</option>
                                    <option value="경기">경기</option>
                                    <option value="인천">인천</option>
                                    <option value="강원">강원</option>
                                    <option value="제주">제주</option>
                                    <option value="대전">대전</option>
                                    <option value="충청북도">충청북도</option>
                                    <option value="충청남도">충청남도</option>
                                    <option value="부산">부산</option>
                                    <option value="울산">울산</option>
                                    <option value="경상남도">경상남도</option>
                                    <option value="대구">대구</option>
                                    <option value="경상북도">경상북도</option>
                                    <option value="광주">광주</option>
                                    <option value="전라북도">전라북도</option>
                                    <option value="전라남도">전라남도</option>
                                </select>
                            </div>
                            <div class="col-md-3 col-lg-3 d-flex align-items-center form-group no-divider">
                                <select class="selectpicker SUIT-Medium" title="타입" data-style="btn-form-control" name="searchType" id="select2">
                                    <option value="전체">전체</option>
                                    <option value="캠핑">캠핑</option>
                                    <option value="글램핑">글램핑</option>
                                    <option value="오토캠핑">오토캠핑</option>
                                    <option value="카라반">카라반</option>
                                </select>
                            </div>
                            <div class="col-md-3 col-lg-4 d-flex align-items-center form-group no-divider">
                                <label class="label-absolute" for="search_search"><i class="fa fa-search" style="margin-left: 0.5rem;"></i><span class="sr-only">What are you looking for?</span></label>
                                <input class="form-control-1 SUIT-Medium" name= "searchValue" type="text" style="margin-left: 1.2rem;" placeholder="어떤 캠핑장을 찾고 계신가요?" aria-label="Search" type="search">
                            </div>
                            <div class="col-lg-2 d-grid form-group mb-0">
                                <button class="btn btn-primary h-100" type="submit" id="search" onclick="ttt()">Search</button>
                            </div>
                        </div>
                        
                    </form>
                </div>
                <div class="tab-pane fade" id="rent" role="tabpanel">
                    <form action="${ path }/item/searchList">
                        <div class="row">
                            <div class="col-lg-7 d-flex align-items-center form-group no-divider input-label-absolute input-label-absolute-left">
                                <label class="label-absolute" for="search_search"><i class="fa fa-search" style="margin-left: 0.5rem;"></i><span class="sr-only">What are you looking for?</span></label>
                                <input class="form-control form-control-sm border-0 shadow-0 bg-gray-200 SUIT-Medium" placeholder="어떤 캠핑용품을 찾으시나요?" aria-label="Search" type="search" id="search" name="search">
                            </div>
                            <div class="col-md-6 col-lg-3 d-flex align-items-center form-group no-divider">
                                <select class="selectpicker SUIT-Medium" title="전체" data-style="btn-form-control">
                                     <option value="category_0">텐트</option>
                                     <option value="category_1">랜턴</option>
                                     <option value="category_2">취사용품</option>
                                     <option value="category_3">아이스박스</option>
                                     <option value="category_4">기타캠핑용품</option>
                                </select>
                            </div>
                            <div class="col-lg-2 d-grid form-group mb-0">
                                <button class="btn btn-primary h-100" type="submit">Search </button>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
    <section class="py-5">
        <div class="container">
            <div class="row mb-lg-6">
                <div class="col-md-8">
                    <p class="subtitle text-secondary Cafe24SsurroundAir">당신의 취향저격 BEST</p>
                    <h2 class="mb-md-0">겨울 추천 캠핑장</h2>
                </div>
                <div class="col-md-4 d-md-flex align-items-center justify-content-end"><a class="text-muted text-sm" href="category-2-rooms.html">
               더보기<i class="fas fa-angle-double-right ms-2"></i></a></div>
            </div>
        </div>
        <div class="container-fluid">
            <!-- Slider main container-->
            <div class="swiper-container swiper-container-mx-negative items-slider-full px-lg-5 pt-3">
                <!-- Additional required wrapper-->
                <div class="swiper-wrapper pb-5">
                    <!-- Slides-->
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${path}/resources/img/newphoto/ex1.jpg" alt="Modern, Well-Appointed Room" />
                                    <a class="tile-link" href="${path}/campsite/view?campsite_index=100180"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="${path}/campsite/view?campsite_index=100180">더존카라반글램핑</a></h6>
                                        <p class="text-sm text-kakhi card-subtitle"><i class="fa fa-map-marker text-kakhi opacity-4 me-1"></i>경기도 포천시</p>
                                        <p class="text-sm text-muted text-uppercase">글램핑</p>
                                        <p class="card-text d-flex justify-content-end text-gray-800 text-sm">
                                            <span class="h5 text-primary">80,000원</span>&nbsp;/1박</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${path}/resources/img/newphoto/ex2.jpg" alt="Cute Quirky Garden apt, NYC adjacent" />
                                    <a class="tile-link" href="${path}/campsite/view?campsite_index=100145"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="${path}/campsite/view?campsite_index=100145">무수캠핑장</a></h6>
                                        <p class="text-sm text-kakhi card-subtitle"><i class="fa fa-map-marker text-kakhi opacity-4 me-1"></i>경기도 평택시</p>
                                        <p class="text-sm text-muted text-uppercase">글램핑</p>
                                        <p class="card-text d-flex justify-content-end text-gray-800 text-sm">
                                            <span class="h5 text-primary">100,000원</span>&nbsp;/1박</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e3a31e62979bf147c9">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${path}/resources/img/newphoto/ex3.jpg" alt="Modern Apt - Vibrant Neighborhood!" />
                                    <a class="tile-link" href="${path}/campsite/view?campsite_index=100211"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="${path}/campsite/view?campsite_index=100211">카라반파크 아마존</a></h6>
                                        <p class="text-sm text-kakhi card-subtitle"><i class="fa fa-map-marker text-kakhi opacity-4 me-1"></i>전라북도 완주군</p>
                                        <p class="text-sm text-muted text-uppercase">카라반</p>
                                        <p class="card-text d-flex justify-content-end text-gray-800 text-sm">
                                            <span class="h5 text-primary">248,000원</span>&nbsp;/1박</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e3503eb77d487e8082">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${path}/resources/img/newphoto/ex4.jpg" alt="Sunny Private Studio-Apartment" />
                                    <a class="tile-link" href="${path}/campsite/view?campsite_index=100177"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="${path}/campsite/view?campsite_index=100177">양양고인돌캠프</a></h6>
                                        <p class="text-sm text-kakhi card-subtitle"><i class="fa fa-map-marker text-kakhi opacity-4 me-1"></i>강원도 양양군</p>
                                        <p class="text-sm text-muted text-uppercase">오토캠핑</p>
                                        <p class="card-text d-flex justify-content-end text-gray-800 text-sm">
                                            <span class="h5 text-primary">90,000원</span>&nbsp;/1박</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e39aa2eed0626e485d">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${path}/resources/img/newphoto/ex5.jpg" alt="Mid-Century Modern Garden Paradise" />
                                    <a class="tile-link" href="${path}/campsite/view?campsite_index=1223"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="${path}/campsite/view?campsite_index=1223">숲속의아침</a></h6>
                                        <p class="text-sm text-kakhi card-subtitle"><i class="fa fa-map-marker text-kakhi opacity-4 me-1"></i>강원도 영월군</p>
                                        <p class="text-sm text-muted text-uppercase">글램핑</p>
                                        <p class="card-text d-flex justify-content-end text-gray-800 text-sm">
                                            <span class="h5 text-primary">90,000원</span>&nbsp;/1박</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e39aa2edasd626e485d">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${path}/resources/img/newphoto/ex6.jpg" alt="Brooklyn Life, Easy to Manhattan" />
                                    <a class="tile-link" href="${path}/campsite/view?campsite_index=1216"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="${path}/campsite/view?campsite_index=1216">반딧불이캠핑장</a></h6>
                                        <p class="text-sm text-kakhi card-subtitle"><i class="fa fa-map-marker text-kakhi opacity-4 me-1"></i>경상북도 경주시</p>
                                        <p class="text-sm text-muted text-uppercase">캠핑</p>
                                        <p class="card-text d-flex justify-content-end text-gray-800 text-sm">
                                            <span class="h5 text-primary">90,000원</span>&nbsp;/1박</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${path}/resources/img/newphoto/ex7.jpg" alt="Modern, Well-Appointed Room" />
                                    <a class="tile-link" href="${path}/campsite/view?campsite_index=1113"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="${path}/campsite/view?campsite_index=1113">박달재옛길캠핑장</a></h6>
                                        <p class="text-sm text-kakhi card-subtitle mb-2"><i class="fa fa-map-marker text-kakhi opacity-4 me-1"></i>충청북도 제천시</p>
                                        <p class="text-sm text-muted text-uppercase">캠핑</p>
                                         <p class="card-text d-flex justify-content-end text-gray-800 text-sm">
                                            <span class="h5 text-primary">90,000원</span>&nbsp;/1박</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${path}/resources/img/newphoto/ex8.jpg" alt="Cute Quirky Garden apt, NYC adjacent" />
                                    <a class="tile-link" href="${path}/campsite/view?campsite_index=1057"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="${path}/campsite/view?campsite_index=1057">무주 글램핑</a></h6>
                                        <p class="text-sm text-kakhi card-subtitle mb-2"><i class="fa fa-map-marker text-kakhi opacity-4 me-1"></i>전라북도 무주군</p>
                                        <p class="text-sm text-muted text-uppercase">글램핑</p>
                                         <p class="card-text d-flex justify-content-end text-gray-800 text-sm">
                                            <span class="h5 text-primary">90,000원</span>&nbsp;/1박</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e3a31e62979bf147c9">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${path}/resources/img/newphoto/ex9.jpg" alt="Modern Apt - Vibrant Neighborhood!" />
                                    <a class="tile-link" href="${path}/campsite/view?campsite_index=10"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="${path}/campsite/view?campsite_index=10">캠핑플래닛</a></h6>
                                        <p class="text-sm text-kakhi card-subtitle mb-2"><i class="fa fa-map-marker text-kakhi opacity-4 me-1"></i>경기도 포천시</p>
                                        <p class="text-sm text-muted text-uppercase">글램핑</p>
                                         <p class="card-text d-flex justify-content-end text-gray-800 text-sm">
                                            <span class="h5 text-primary">90,000원</span>&nbsp;/1박</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e3503eb77d487e8082">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${path}/resources/img/newphoto/ex10.jpg" alt="Sunny Private Studio-Apartment" />
                                    <a class="tile-link" href="detail-rooms.html"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="detail-rooms.html">(주)아웃오브파크</a></h6>
                                        <p class="text-sm text-kakhi card-subtitle mb-2"><i class="fa fa-map-marker text-kakhiㄴ opacity-4 me-1"></i>강원도 춘천시</p>
                                        <p class="text-sm text-muted text-uppercase">카라반</p>
                                         <p class="card-text d-flex justify-content-end text-gray-800 text-sm">
                                            <span class="h5 text-primary">90,000원</span>&nbsp;/1박</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e39aa2eed0626e485d">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${path}/resources/img/newphoto/ex11.jpg" alt="Mid-Century Modern Garden Paradise" />
                                    <a class="tile-link" href="${path}/campsite/view?campsite_index=100208"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="${path}/campsite/view?campsite_index=100208">차밍캠핑</a></h6>
                                        <p class="text-sm text-kakhi card-subtitle mb-2"><i class="fa fa-map-marker text-kakhi opacity-4 me-1"></i>강원도 원주시</p>
                                        <p class="text-sm text-muted text-uppercase">글램핑</p>
                                         <p class="card-text d-flex justify-content-end text-gray-800 text-sm">
                                            <span class="h5 text-primary">90,000원</span>&nbsp;/1박</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e39aa2edasd626e485d">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-fluid" src="${path}/resources/img/newphoto/ex12.jpg" alt="Brooklyn Life, Easy to Manhattan" />
                                    <a class="tile-link" href="${path}/campsite/view?campsite_index=100247"></a>
                                </div>
                                <div class="card-body d-flex align-items-center">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark" href="${path}/campsite/view?campsite_index=100247">남한산성 캠핑장</a></h6>
                                        <p class="text-sm text-kakhi card-subtitle mb-2"><i class="fa fa-map-marker text-kakhi opacity-4 me-1"></i>경기도 광주시</p>
                                        <p class="text-sm text-muted text-uppercase">캠핑</p>
                                         <p class="card-text d-flex justify-content-end text-gray-800 text-sm">
                                            <span class="h5 text-primary">90,000원</span>&nbsp;/1박</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- If we need pagination-->
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </section>
    <!-- Our picks section-->
    <section class="py-5 bg-gray-100">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md-8">
                    <p class="subtitle text-primary">여긴 어때요?</p>
                    <h2>지금 캠핑가기 좋은 지역</h2>
                </div>
                <div class="col-md-4 d-md-flex align-items-center justify-content-end"><a class="text-muted text-sm" href="category-2-rooms.html">
               더보기<i class="fas fa-angle-double-right ms-2"></i></a></div>
            </div>
            <div class="row">
                <div class="d-flex align-items-lg-stretch mb-4 col-lg-8">
                    <div class="card shadow-lg border-0 w-100 border-0 hover-animate" style="background: center center url(${path}/resources/img/newphoto/jeju.jpg) no-repeat; background-size: cover;">
                        <a class="tile-link" href="${path}/campsite/searchList?searchLoc=제주&searchType=전체&searchValue="> </a>
                        <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
                            <h3 class="text-shadow text-uppercase mb-0">제주</h3>
                        </div>
                    </div>
                </div>
                <div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
                    <div class="card shadow-lg border-0 w-100 border-0 hover-animate" style="background: center center url(${path}/resources/img/newphoto/gapyeong.jpg) no-repeat; background-size: cover;">
                        <a class="tile-link" href="${path}/campsite/searchList?searchLoc=경기&searchType=전체&searchValue="> </a>
                        <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
                            <h3 class="text-shadow text-uppercase mb-0">경기</h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
                    <div class="card shadow-lg border-0 w-100 border-0 hover-animate" style="background: center center url(${path}/resources/img/newphoto/gangwon.jpg) no-repeat; background-size: cover;">
                        <a class="tile-link" href="${path}/campsite/searchList?searchLoc=강원&searchType=전체&searchValue="> </a>
                        <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
                            <h3 class="text-shadow text-uppercase mb-0">강원</h3>
                        </div>
                    </div>
                </div>
                <div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
                    <div class="card shadow-lg border-0 w-100 border-0 hover-animate" style="background: center center url(${path}/resources/img/newphoto/busan.png) no-repeat; background-size: cover;">
                        <a class="tile-link" href="${path}/campsite/searchList?searchLoc=부산&searchType=전체&searchValue="> </a>
                        <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
                            <h3 class="text-shadow text-uppercase mb-0">부산</h3>
                        </div>
                    </div>
                </div>
                <div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
                    <div class="card shadow-lg border-0 w-100 border-0 hover-animate" style="background: center center url(${path}/resources/img/newphoto/chungbuk.jpg) no-repeat; background-size: cover;">
                        <a class="tile-link" href="${path}/campsite/searchList?searchLoc=충청&searchType=전체&searchValue="> </a>
                        <div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
                            <h3 class="text-shadow text-uppercase mb-0">충청</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Instagram-->
    <section>
        <div class="container-fluid px-0">
            <div class="swiper-container instagram-slider">
                <div class="swiper-wrapper">
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="${path}/resources/img/newphoto/insta1.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="${path}/resources/img/newphoto/insta2.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="${path}/resources/img/newphoto/insta3.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="${path}/resources/img/newphoto/insta4.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="${path}/resources/img/newphoto/insta5.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="${path}/resources/img/newphoto/insta6.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="${path}/resources/img/newphoto/insta7.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="${path}/resources/img/newphoto/insta8.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="${path}/resources/img/newphoto/insta9.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="${path}/resources/img/newphoto/insta10.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="${path}/resources/img/newphoto/insta11.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="${path}/resources/img/newphoto/insta12.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="${path}/resources/img/newphoto/insta13.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="${path}/resources/img/newphoto/insta14.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="${path}/resources/img/newphoto/insta15.jpg" alt=" "></a>
                    </div>
                    <div class="swiper-slide overflow-hidden">
                        <a href="#"><img class="img-fluid hover-scale" src="${path}/resources/img/newphoto/insta16.jpg" alt=" "></a>
                    </div>
                   
                </div>
            </div>
        </div>
    </section>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("#search").attr("disabled", true)
	})
	
	$('#select1').change(function(){
		var select1_value = $("#select1").val()
		var select2_value = $("#select2").val()
		test(select1_value, select2_value)
	});
	$('#select2').change(function(){
		var select1_value = $("#select1").val()
		var select2_value = $("#select2").val()
		test(select1_value, select2_value)
	});
	
	function test(a,b){
		if(a == "" || b == ""){
		}
		else{
			$("#search").attr("disabled", false)
			
		}
	}
	
	function ttt(){
		 $("#select1").val() = ""
		 $("#select2").val() = ""
	}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>