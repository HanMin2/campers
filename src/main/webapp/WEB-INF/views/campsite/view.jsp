<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />



<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="캠핑장 상세조회" name="title" />
</jsp:include>

<!-- <form action="${ path }/campsite/view" method="get"> -->

<section>
	<!-- Slider main container-->
	<div class="swiper-container detail-slider slider-gallery">
		<!-- Additional required wrapper-->
		<div class="swiper-wrapper">
			<!-- Slides-->
			<div class="swiper-slide">
				<c:choose>
					<c:when test="${campsite.first_image == '-'}">
						<a href="${path}/resources/img/newphoto/campsiteView1.jpg"
							data-toggle="gallery-top" title="Rear entrance"><img
							class="img-fluid"
							src="${path}/resources/img/newphoto/campsiteView1.jpg"
							alt="Rear entrance"></a>
					</c:when>
					<c:when test="${campsite.campsite_index == '50001'}">
						<a href="${path}/resources/img/newphoto/ex9.jpg"
							data-toggle="gallery-top" title="Rear entrance"><img
							class="img-fluid"
							src="${path}/resources/img/newphoto/campsiteView1.jpg"
							alt="Rear entrance"></a>
					</c:when>
					<c:otherwise>
						<a href="${campsite.first_image}" data-toggle="gallery-top"
							title="Rear entrance"><img class="img-fluid"
							src="${campsite.first_image}" alt="Rear entrance"></a>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="swiper-slide">
				<a
					href="https://gocamping.or.kr/upload/camp/3429/thumb/thumb_720_7798D931eCFr52PoJOTNrEdo.jpg"
					data-toggle="gallery-top" title="Our street"><img
					class="img-fluid"
					src="https://gocamping.or.kr/upload/camp/3429/thumb/thumb_720_7798D931eCFr52PoJOTNrEdo.jpg"
					alt="Our street"></a>
			</div>
			<div class="swiper-slide">
				<a href="${path}/resources/img/newphoto/login_image2.png"
					data-toggle="gallery-top" title="Outside"><img
					class="img-fluid"
					src="${path}/resources/img/newphoto/login_image2.png" alt="Outside"></a>
			</div>
		</div>
		<div class="swiper-pagination swiper-pagination-white"></div>
		<div class="swiper-button-prev swiper-button-white"></div>
		<div class="swiper-button-next swiper-button-white"></div>
	</div>
</section>
<div class="container py-5">
	<div class="row">
		<div class="col-lg-8">
			<div class="text-block">
				<p class="text-primary">
					<i class="fa-map-marker-alt fa me-1"></i> ${campsite.do_name},
					${campsite.sigungu_name}
				</p>
				<h1>${campsite.campsite_name}</h1>
				<ul class="list-inline text-sm mb-4">
					<li class="list-inline-item me-3 GmarketSansMedium"><i
						class="fa fa-users me-1 text-secondary"></i> 상주관리인원
						${campsite.manager} 명</li>
					<li class="list-inline-item me-3 GmarketSansMedium"><i
						class="fa fa-moon me-1 text-secondary"></i> ${campsite.thema}</li>
					<c:choose>
						<c:when test="${campsite.tour_era eq '-'}">
							<li class="list-inline-item me-3 GmarketSansMedium"><i
								class="fa fa-seedling me-1 text-secondary"></i> 여행시기 사계절 모두 좋아요</li>
						</c:when>
						<c:otherwise>
							<li class="list-inline-item me-3 GmarketSansMedium"><i
								class="fa fa-seedling me-1 text-secondary"></i> 여행시기
								${campsite.tour_era}</li>
						</c:otherwise>
					</c:choose>
				</ul>
				<h6 class="mb-3">소개</h6>
				<p class="text-muted fw-normal">${campsite.line_intro}</p>
			</div>
			<div class="text-block">
				<h4 class="mb-4">부대시설</h4>
				<div class="row">
					<div class="col-md-6">
						<ul class="list-unstyled text-muted GmarketSansMedium">
							<c:set var="amenities" value="${campsite.sbrs}" />
							<c:if test="${fn:contains(amenities, '전기')}">
								<li class="mb-2"><i
									class="fa fa-plug text-secondary w-1rem me-3 text-center"></i><span
									class="text-sm">전기</span></li>
							</c:if>
							<c:if test="${fn:contains(amenities, '무선인터넷')}">
								<li class="mb-2"><i
									class="fa fa-wifi text-secondary w-1rem me-3 text-center"></i><span
									class="text-sm">무선인터넷</span></li>
							</c:if>
							<c:if test="${fn:contains(amenities, '장작판매')}">
								<li class="mb-2"><i
									class="fa fa-tree text-secondary w-1rem me-3 text-center"></i><span
									class="text-sm">장작판매</span></li>
							</c:if>
							<c:if test="${fn:contains(amenities, '애완동물')}">
								<li class="mb-2"><i
									class="fa fa-paw text-secondary w-1rem me-3 text-center"></i><span
									class="text-sm">애완동물</span></li>
							</c:if>
							<c:if test="${fn:contains(amenities, '온수')}">
								<li class="mb-2"><i
									class="fa fa-thermometer-three-quarters text-secondary w-1rem me-3 text-center"></i><span
									class="text-sm">온수</span></li>
							</c:if>
							<c:if test="${fn:contains(amenities, '놀이터')}">
								<li class="mb-2"><i
									class="fa fa-child text-secondary w-1rem me-3 text-center"></i><span
									class="text-sm">놀이터</span></li>
							</c:if>
							<c:if test="${fn:contains(amenities, '운동시설')}">
								<li class="mb-2"><i
									class="fa fa-dumbbell text-secondary w-1rem me-3 text-center"></i><span
									class="text-sm">운동시설</span></li>
							</c:if>
							<c:if test="${fn:contains(amenities, '물놀이장')}">
								<li class="mb-2"><i
									class="fa fa-water text-secondary w-1rem me-3 text-center"></i><span
									class="text-sm">물놀이장</span></li>
							</c:if>
							<c:if test="${fn:contains(amenities, '캠핑장비대여')}">
								<li class="mb-2"><i
									class="fa fa-campground text-secondary w-1rem me-3 text-center"></i><span
									class="text-sm">캠핑장비대여</span></li>
							</c:if>
							<c:if test="${fn:contains(amenities, '체험프로그램')}">
								<li class="mb-2"><i
									class="fa fa-music text-secondary w-1rem me-3 text-center"></i><span
									class="text-sm">체험프로그램</span></li>
							</c:if>
							<c:if test="${fn:contains(amenities, '트렘폴린')}">
								<li class="mb-2"><i
									class="fa fa-smile text-secondary w-1rem me-3 text-center"></i><span
									class="text-sm">트렘폴린</span></li>
							</c:if>
							<c:if test="${fn:contains(amenities, '산책로')}">
								<li class="mb-2"><i
									class="fa fa-shoe-prints text-secondary w-1rem me-3 text-center"></i><span
									class="text-sm">산책로</span></li>
							</c:if>
							<c:if test="${fn:contains(amenities, '운동장')}">
								<li class="mb-2"><i
									class="fa fa-seedling text-secondary w-1rem me-3 text-center"></i><span
									class="text-sm">운동장</span></li>
							</c:if>
							<c:if test="${fn:contains(amenities, '마트')}">
								<li class="mb-2"><i
									class="fa fa-cart-plus text-secondary w-1rem me-3 text-center"></i><span
									class="text-sm">마트.편의점</span></li>
							</c:if>
							<!-- <li class="mb-2"> <i class="fa fa-tv text-secondary w-1rem me-3 text-center"></i><span class="text-sm">Cable TV</span></li> -->
						</ul>
					</div>
				</div>
			</div>
			<div class="text-block">
				<h5 class="mb-4">위치</h5>
				<div class="map-wrapper-300 mb-3">
					<div class="h-100" id="campsiteViewMap">
						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55b6be4dd88e467de806ae5586aa2142"></script>
					</div>
				</div>
			</div>
			<div class="text-block">
				<h5 class="mb-4">갤러리</h5>
				<div class="row gallery mb-3 ms-n1 me-n1">
					<div class="col-lg-4 col-6 px-1 mb-2">
						<a href="${campsite.first_image}" data-fancybox="gallery"
							title="Our street"><img class="img-fluid"
							src="${campsite.first_image}" alt="..."></a>
					</div>

				</div>
			</div>
			<div class="text-block">
				<p class="subtitle text-sm text-primary">Reviews</p>
				<h5 class="mb-4">리뷰 리스트</h5>
				<c:if test="${ reviewList != null }">
					<c:forEach var="review" items="${ reviewList }">
						<div class="d-flex d-block d-sm-flex review">
							<div>
								<h6 class="mt-2 mb-1">${review.id}</h6>
								<div class="mb-2">
									<i class="fa fa-xs fa-star text-primary"></i><i
										class="fa fa-xs fa-star text-primary"></i><i
										class="fa fa-xs fa-star text-primary"></i><i
										class="fa fa-xs fa-star text-primary"></i><i
										class="fa fa-xs fa-star text-primary"></i>
								</div>
								<p class="text-muted text-sm">${review.content}</p>
								<span class="text-uppercase text-muted text-sm">${review.registDate}</span>
							</div>
						</div>
					</c:forEach>
				</c:if>
				<div class="py-5">
					<button class="btn btn-outline-success" type="button"
						data-bs-toggle="collapse" data-bs-target="#leaveReview"
						aria-expanded="false" aria-controls="leaveReview">리뷰 남기기</button>
					<div class="collapse mt-4" id="leaveReview">
						<h5 class="mb-4">리뷰 남기기</h5>
						<form class="form" id="contact-form" method="Post"
							action="${path}/campsite/review">
							<input type="hidden" name="index" id="index"
								value="${campsite.campsite_index}"> <input type="hidden"
								name="campsiteName" id="campsiteName"
								value="${campsite.campsite_name}">
							<div class="row">
								<div class="col-sm-6">
									<div class="mb-4">
										<label class="form-label" for="name">Your ID *</label> <input
											class="form-control" type="text" name="id" id="id"
											value="${loginUser.userId}" required="required">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="mb-4">
										<label class="form-label" for="rating">Your rating *</label> <select
											class="form-select focus-shadow-0" name="rating" id="rating">
											<option value="5">&#9733;&#9733;&#9733;&#9733;&#9733;
												(5/5)</option>
											<option value="4">&#9733;&#9733;&#9733;&#9733;&#9734;
												(4/5)</option>
											<option value="3">&#9733;&#9733;&#9733;&#9734;&#9734;
												(3/5)</option>
											<option value="2">&#9733;&#9733;&#9734;&#9734;&#9734;
												(2/5)</option>
											<option value="1">&#9733;&#9734;&#9734;&#9734;&#9734;
												(1/5)</option>
										</select>
									</div>
								</div>
							</div>
							<div class="mb-4">
								<label class="form-label" for="review">Review text *</label>
								<textarea class="form-control" rows="4" name="content"
									id="content" placeholder="Enter your review"
									required="required"></textarea>
							</div>
							<button class="btn btn-primary" type="submit">리뷰 게시하기</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-4">
			<form class="form" method="get" action="${path}/reservation/step1"
				autocomplete="off">
				<input type="hidden" name="campsite_index" id="campsite_index" value="${campsite.campsite_index}" />
				<div class="p-4 shadow ms-lg-4 rounded sticky-top"
					style="top: 100px;">
					<p class="text-muted">
						1박&nbsp;<span class="text-primary h2"><fmt:formatNumber
								value="${campsite.cost}" pattern="#,###" />원</span>
					</p>
					<hr class="my-4">
					<div class="mb-4">
						<label class="form-label" for="bookingDate">일정 예약 *</label>
						<div class="datepicker-container datepicker-container-right">
							<input class="form-control" type="text" name="bookingDate"
								id="bookingDate" placeholder="날짜를 선택해주세요" required="required">
						</div>
					</div>
					<div class="mb-4">
						<label class="form-label" for="headCount">Guests *</label> <select
							class="form-control" name="headCount" id="headCount">
							<option value="1">1 명</option>
							<option value="2">2 명</option>
							<option value="3">3 명</option>
							<option value="4">4 명</option>
							<option value="5">5 명</option>
						</select>
					</div>

					<div class="d-grid mb-4">
						<c:choose>
							<c:when test="${ loginuser != null }">
								<button class="btn btn-primary h-100" type="submit">예약하기</button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-primary h-100" type="submit">예약하기</button>
							</c:otherwise>
						</c:choose>
					</div>
					<p class="text-muted text-sm text-center">예약 확정 전에는 요금이 청구되지
						않아요.</p>
					<hr class="my-4">
					<div class="text-center">
						<p>
							<a class="text-info text-sm"
								href="${path}/inquiry/listDetail?sender=${loginUser.userId}&receiver=${campsite.campsite_index}">
								<i class="fa fa-comment-dots"></i> 문의하기
							</a>
						</p>
					</div>
				</div>
			</form>
		</div>
		</div>
		</div>

		<div class="py-5 bg-gray-100">
			<div class="container">
				<p class="subtitle text-sm text-primary">You may also like</p>
				<h5 class="mb-0">"${campsite.do_name }"에 여긴 어떠세요?</h5>
				<!-- Slider main container-->
				<div
					class="swiper-container swiper-container-mx-negative swiper-init pt-3"
					data-swiper="{&quot;slidesPerView&quot;:4,&quot;spaceBetween&quot;:20,&quot;loop&quot;:true,&quot;roundLengths&quot;:true,&quot;breakpoints&quot;:{&quot;1200&quot;:{&quot;slidesPerView&quot;:3},&quot;991&quot;:{&quot;slidesPerView&quot;:2},&quot;565&quot;:{&quot;slidesPerView&quot;:1}},&quot;pagination&quot;:{&quot;el&quot;:&quot;.swiper-pagination&quot;,&quot;clickable&quot;:true,&quot;dynamicBullets&quot;:true}}">
					<!-- Additional required wrapper-->
					<div class="swiper-wrapper pb-5" style="height: 23rem;">
						<c:forEach var="campsite" items="${list }">
							<!-- Slides-->
							<div class="swiper-slide h-auto px-2">
								<!-- place item-->

								<div class="w-100 h-100 hover-animate"
									data-marker-id="59c0c8e33b1527bfe2abaf92">
									<div class="card h-100 border-0 shadow">
										<div class="card-img-top overflow-hidden gradient-overlay">
											<c:choose>
												<c:when test="${campsite.first_image != '-'}">
													<img class="img-fluid" src="${ campsite.first_image }"
														style="height: 14rem;" />
												</c:when>
												<c:otherwise>
													<img class="img-fluid"
														src="${path}/resources/img/newphoto/add_camping.png" />
												</c:otherwise>
											</c:choose>
											<a class="tile-link"
												href="${path }/campsite/view?campsite_index=${campsite.campsite_index}"></a>
										</div>
										<div class="card-body d-flex align-items-center">
											<div class="w-100">
												<h6 class="card-title">
													<c:if test="${ campsite.campsite_name == null}">
														<a class="text-decoration-none text-dark"
															href="${path }/campsite/view">${list}</a>
													</c:if>
													<c:if test="${ campsite.campsite_name != null}">
														<a class="text-decoration-none text-dark"
															href="${path }/campsite/view">${campsite.campsite_name}</a>
													</c:if>
												</h6>
												<div class="d-flex card-subtitle mb-3">
													<p class="flex-grow-1 mb-0 text-muted text-sm">${campsite.induty }</p>
													<p class="flex-shrink-1 mb-0 card-stars text-xs text-end">
														<i class="fa fa-star text-warning"></i><i
															class="fa fa-star text-warning"></i><i
															class="fa fa-star text-warning"></i><i
															class="fa fa-star text-warning"></i><i
															class="fa fa-star text-warning"></i>
													</p>
												</div>
												<p class="card-text text-muted">
													<span class="h4 text-primary"><fmt:formatNumber
															value="${campsite.cost}" pattern="#,###" />원</span> /박</span> 1박
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- If we need pagination-->
					<div class="swiper-pagination"></div>
				</div>
			</div>

		</div>
<!-- </form> -->

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


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<script src="${path}/resources/js/datepicker-detail.js?ver=1"></script>