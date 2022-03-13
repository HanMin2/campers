<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시판" name="title"/>
</jsp:include>

<div class="container-fluid">
        <div class="row">
            <div class="col-lg-7 col-xl-5 px-4 pb-4 ps-xl-5 pe-xl-5">
                <section class="mx-n4 mx-xl-n5 mb-4 mb-xl-5">
                    <!-- Slider main container-->
                    <div class="swiper-container booking-detail-slider">
                        <!-- Additional required wrapper-->
                        <div class="swiper-wrapper">
                            <!-- Slides-->
                            <div class="swiper-slide"><img class="img-fluid" src="${campsite.first_image}" alt="Our street"></div>
                            <div class="swiper-slide"><img class="img-fluid" src="${path}/resources/img/newphoto/detail1.jpg" alt="Outside"></div>
                            <div class="swiper-slide"><img class="img-fluid" src="${path}/resources/img/newphoto/detail2.jpg" alt="Rear entrance"></div>
                            <div class="swiper-slide"><img class="img-fluid" src="${path}/resources/img/photo/photo-1484154218962-a197022b5858.jpg" alt="Kitchen"></div>
                            <div class="swiper-slide"><img class="img-fluid" src="${path}/resources/img/photo/photo-1522771739844-6a9f6d5f14af.jpg" alt="Bedroom"></div>
                            <div class="swiper-slide"><img class="img-fluid" src="${path}/resources/img/newphoto/detail3.jpg" alt="Bedroom"></div>
                        </div>
                        <div class="swiper-pagination swiper-pagination-white"></div>
                        <div class="swiper-button-prev swiper-button-white"></div>
                        <div class="swiper-button-next swiper-button-white"> </div>
                    </div>
                </section>
                <!-- Breadcrumbs -->
                <ol class="breadcrumb ps-0  justify-content-start">
                    <li class="breadcrumb-item"><a href="index.html">Camping</a></li>
                    <!-- <li class="breadcrumb-item"><a href="user-grid.html">지역</a></li> -->
                    <li class="breadcrumb-item active"> ${campsite.do_name}, ${campsite.sigungu_name}</li>
                </ol>
                <div class="text-block">

                    <h1 class="hero-heading mb-3">
                        <a class="hovertest" href="detail-rooms.html">${campsite.campsite_name}</a>
                    </h1>
                </div>
                <div class="text-block">
                    <h6 class="mb-4" id="diffcnt">1 박 일정</h6>
                    <div class="row mb-3">
                        <div class="col-md-6 d-flex align-items-center mb-3 mb-md-0">
                            <div class="date-tile me-3">
                                <div class="text-uppercase"> <span class="text-sm" id="check-in-mm">1월</span><br><strong class="text-lg" id="check-in-dd">17</strong></div>
                            </div>
                            <p class="text-sm mb-0" id="check-in-week">수요일 check-in<br>3PM - 7PM</p>
                        </div>
                        <div class="col-md-6 d-flex align-items-center">
                            <div class="date-tile me-3">
                                <div class="text-uppercase"> <span class="text-sm" id="check-out-mm">1월</span><br><strong class="text-lg" id="check-out-dd">18</strong></div>
                            </div>
                            <p class="text-sm mb-0" id="check-out-week">목요일 check-out<br>11AM</p>
                        </div>
                    </div>
                </div>
                <div class="text-block">
                    <div class="row">
                        <div class="col-sm">
                            <h6>Phone</h6>
                            <p class="text-muted" id="tel">${user.tel}</p>
                        </div>
                    </div>
                </div>
                <div class="text-block">
                    <div class="row">
                        <div class="col">
                            <h6> 총 비용</h6>
                            <p class="text-muted" id="totalCost2">₩<fmt:formatNumber value="${campsite.cost}" pattern="#,###" /> 원</p>
                        </div>
                        <div class="col align-self-center">
                            <!-- <p class="text-end d-print-none"><a class="btn btn-link text-muted" href="user-invoice.html"><i class="far fa-file me-2"></i>Your invoice</a></p> -->
                        </div>
                    </div>
                </div>
                <div class="text-block">
                    <h6 class="mb-4">부대시설</h6>
                    <ul class="list-unstyled">
                        <li class="mb-2">
                            <div class="d-flex align-items-center mb-3">
                                <div class="icon-rounded icon-rounded-sm bg-success-light flex-shrink-0 me-4"><i class="fa fas fa-plug text-success fa-fw text-center"></i></div>
                                <div><span class="text-sm">전기</span></div>
                            </div>
                        </li>
                        <li class="mb-2">
                            <div class="d-flex align-items-center mb-3">
                                <div class="icon-rounded icon-rounded-sm bg-success-light flex-shrink-0 me-4"><i class="fa fas fa-wifi text-success fa-fw text-center"></i></div>
                                <div><span class="text-sm">무선인터넷</span></div>
                            </div>
                        </li>
                        <li class="mb-2">
                            <div class="d-flex align-items-center mb-3">
                                <div class="icon-rounded icon-rounded-sm bg-success-light flex-shrink-0 me-4"><i class="fa fa-tree text-success fa-fw text-center"></i></div>
                                <div><span class="text-sm">장작판매</span></div>
                            </div>
                        </li>
                        <li class="mb-2">
                            <div class="d-flex align-items-center mb-3">
                                <div class="icon-rounded icon-rounded-sm bg-success-light flex-shrink-0 me-4"><i class="fa fa-paw text-success fa-fw text-center"></i></div>
                                <div><span class="text-sm">애완동물</span></div>
                            </div>
                        </li>
                    </ul>
                    <div class="collapse" id="amenities">
                        <ul class="list-unstyled">
                            <li class="mb-2">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="icon-rounded icon-rounded-sm bg-success-light flex-shrink-0 me-4"><i class="fa fas fa-thermometer-three-quarters text-success fa-fw text-center"></i></div>
                                    <div><span class="text-sm">온수</span></div>
                                </div>
                            </li>
                            <li class="mb-2">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="icon-rounded icon-rounded-sm bg-success-light flex-shrink-0 me-4"><i class="fa fas fa-child text-success fa-fw text-center"></i></div>
                                    <div><span class="text-sm">놀이터</span></div>
                                </div>
                            </li>
                            <li class="mb-2">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="icon-rounded icon-rounded-sm bg-success-light flex-shrink-0 me-4"><i class="fa fa-dumbbell text-success fa-fw text-center"></i></div>
                                    <div><span class="text-sm">운동시설</span></div>
                                </div>
                            </li>
                            <li class="mb-2">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="icon-rounded icon-rounded-sm bg-success-light flex-shrink-0 me-4"><i class="fa fa-water text-success fa-fw text-center"></i></div>
                                    <div><span class="text-sm">물놀이장</span></div>
                                </div>
                            </li>
                            <li class="mb-2">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="icon-rounded icon-rounded-sm bg-success-light flex-shrink-0 me-4"><i class="fa fa-campground text-success fa-fw text-center"></i></div>
                                    <div><span class="text-sm">캠핑장비대여</span></div>
                                </div>
                            </li>
                            <li class="mb-2">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="icon-rounded icon-rounded-sm bg-success-light flex-shrink-0 me-4"><i class="fa fa-music text-success fa-fw text-center"></i></div>
                                    <div><span class="text-sm">체험프로그램</span></div>
                                </div>
                            </li>
                            <li class="mb-2">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="icon-rounded icon-rounded-sm bg-success-light flex-shrink-0 me-4"><i class="fa fa-smile text-success fa-fw text-center"></i></div>
                                    <div><span class="text-sm">트렘폴린</span></div>
                                </div>
                            </li>
                            <li class="mb-2">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="icon-rounded icon-rounded-sm bg-success-light flex-shrink-0 me-4"><i class="fa fa-shoe-prints text-success fa-fw text-center"></i></div>
                                    <div><span class="text-sm">산책로</span></div>
                                </div>
                            </li>
                            <li class="mb-2">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="icon-rounded icon-rounded-sm bg-success-light flex-shrink-0 me-4"><i class="fa fa-seedling text-success fa-fw text-center"></i></div>
                                    <div><span class="text-sm">운동장</span></div>
                                </div>
                            </li>
                            <li class="mb-2">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="icon-rounded icon-rounded-sm bg-success-light flex-shrink-0 me-4"><i class="fa fa-cart-plus text-success fa-fw text-center"></i></div>
                                    <div><span class="text-sm">마트.편의점</span></div>
                                </div>
                            </li>

                        </ul>
                    </div>
                    <button class="btn btn-link btn-collapse ps-0 text-muted" type="button" data-bs-toggle="collapse" data-bs-target="#amenities" aria-expanded="false" aria-controls="amenities" data-expanded-text="Show less" data-collapsed-text="Show more">더 보기</button>
                </div>
                <div class="text-block">
                    <h6 class="mb-4">지켜주세요</h6>
                    <ul class="list-unstyled">
                        <li class="mb-2">
                            <div class="d-flex align-items-center mb-3">
                                <div class="icon-rounded icon-rounded-sm bg-secondary-light flex-shrink-0 me-4"><i class="fa fas fa-child text-secondary fa-fw text-center"></i></div>
                                <div><span class="text-sm">어린이 및 영유아에겐 적합하지 않아요</span></div>
                            </div>
                        </li>
                        <li class="mb-2">
                            <div class="d-flex align-items-center mb-3">
                                <div class="icon-rounded icon-rounded-sm bg-secondary-light flex-shrink-0 me-4"><i class="fa fas fa-glass-cheers text-secondary fa-fw text-center"></i></div>
                                <div><span class="text-sm">파티나 이벤트는 삼가해주세요</span></div>
                            </div>
                        </li>
                        <li class="mb-2">
                            <div class="d-flex align-items-center mb-3">
                                <div class="icon-rounded icon-rounded-sm bg-secondary-light flex-shrink-0 me-4"><i class="fa fa-smoking-ban text-secondary fa-fw text-center"></i></div>
                                <div><span class="text-sm">흡연은 삼가해주세요</span></div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="text-block d-print-none">
                    <button class="btn btn-link ps-0" onclick="window.print()"><i class="fa fa-print me-2"></i>출력하기 </button>
                </div>
            </div>
            <div class="col-lg-5 col-xl-7 map-side-lg px-lg-0">
                <div class="map-wrapper-300 mb-3">
					<div class="map-full shadow-left" id="campsiteViewMap">
						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55b6be4dd88e467de806ae5586aa2142"></script>
					</div>
				</div>
            </div>
        </div>
    </div>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
		<script>
		var mapContainer = document.getElementById('campsiteViewMap');
		    mapOption = {
			center: new kakao.maps.LatLng(${campsite.map_y}, ${campsite.map_x}),
			level: 7
		};

		var campsiteViewMap = new kakao.maps.Map(mapContainer, mapOption);
		
		var markerPosition = new kakao.maps.LatLng(${campsite.map_y}, ${campsite.map_x})
		  
		
		
	    var marker = new kakao.maps.Marker({
	        position: markerPosition // 마커를 표시할 위치
	    });
	    
	    marker.setMap(campsiteViewMap);


	</script>
		<script>
	//웹을 시작하면서 레디하는 함수
	$(document).ready(function(){
		var a = "${bookingDate}"
		var b = a.split(" ")
		var c1 = b[0]
		var c2 = b[2]
		var d1 = getDate(c1)
		var d2 = getDate(c2)
		var p = $("#check-in-week").text(d1+"요일 check-in\n3PM");
		p.html(p.html().replace(/\n/g, '<br/>'));
		var p = $("#check-out-week").text(d2+"요일 check-out\n11AM");
		p.html(p.html().replace(/\n/g, '<br/>'));
		
		var e = c1.split("-")
		var dat1 = new Date(e[0], e[1], e[2]);
		var f = e[1]
		var g = e[2]
		if(f[0] == "1"){
			var p = $("#check-in-mm").text(f+"월");
		}else{
			var p = $("#check-in-mm").text(f[1]+"월");
		}
		var p = $("#check-in-dd").text(g);
		
		var e2 = c2.split("-")
		var dat2 = new Date(e2[0], e2[1], e2[2]);
		var f2 = e2[1]
		var g2 = e2[2]
		if(f2[0] == "1"){
			var p = $("#check-out-mm").text(f2+"월");
		}else{
			var p = $("#check-out-mm").text(f2[1]+"월");
		}
		var p = $("#check-out-dd").text(g2);
		
		var p = $("#startdate").text(e[0]+"년"+e[1]+"월"+e[2]+"일");
		var p = $("#enddate").text(c2);
		
		var diff = dat2- dat1;
		var currDay = 24 * 60 * 60 * 1000;
		var diffCount = parseInt(diff/currDay);
		var p = $("#diffcnt").text(" "+diffCount+"박"+" "+"일정");
		
		
		var s = "${campsite.cost}"
		var x = parseInt(s);
		var tc = parseInt(x*diffCount)
		var tc = tc.toString();
		var tc = addComma(tc);
		var p = $("#totalCost").text(tc+"원");
		var p = $("#totalCost2").text(tc+"원");
		
		var test = "${user.tel}";
		var testDate = test.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
		  
		$("#tel").text(testDate);

	})
	
	function getDate(abc){ 
		//날짜문자열 형식은 자유로운 편 
		var week = ['일', '월', '화', '수', '목', '금', '토']; 
		var dayOfWeek = week[new Date(abc).getDay()]; 
		return dayOfWeek; 
		}
	
	function addComma(value){
        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        return value; 
    }
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	