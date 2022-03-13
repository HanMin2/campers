<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="캠핑장 추가 step1" name="title" />
</jsp:include>


<div class="progress rounded-0 sticky-top"
	style="height: 8px; top: 100px;">
	<div class="progress-bar" role="progressbar" style="width: 20%"
		aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
</div>
<section class="py-5">
	<div class="container">
		<p class="subtitle text-primary">캠핑장 추가하기</p>
		<h1 class="h2 mb-5 yg-jalnan">
			캠핑장 기본정보<span class="text-muted float-end">Step 1</span>
		</h1>
		<form action="${path }/campsite/step2" id="updateCampsiteStep1" name="updateCampsiteStep1" method="GET"
				enctype="multipart/form-data" autocomplete="off">
			<div class="row form-block">
				<div class="col-lg-4">
					<h4>기본정보</h4>
				</div>
				<div class="col-lg-7 ms-auto">
					<div class="mb-4">
						<label class="form-label" for="form_name">캠핑장 이름</label> <input
							class="form-control" name="campsite_name" id="campsite_name"
							onchange="mapChange(this.value)">
					</div>
					<div class="mb-4">
						<label class="form-label" for="camp_tel">전화번호</label> <input
							class="form-control" name="tel" id="tel">
					</div>
					
					<div class="mb-4">
						<label class="form-label" for="camp_cost">가격(1박)</label> <input
							class="form-control" name="cost" id="cost">
					</div>

					<div class="row">
						<div class="mb-4">
							<label class="form-label" for="form_type">타입</label> <select
								class="selectpicker form-control" name="induty" id="induty"
								data-style="btn-selectpicker" title="선택"
								aria-describedby="propertyTypeHelp">
								<option value="일반야영장">캠핑</option>
								<option value="글램핑">글램핑</option>
								<option value="자동차야영장">오토캠핑</option>
								<option value="카라반">카라반</option>
							</select>
						</div>
						<!--<div class="mb-4 col-lg-6">
                                <label class="form-label" for="form_type">객실 수</label>
                                <input class="form-control" name="name" id="camping_number" placeholder="">
                            </div>-->
					</div>
					<div class="row">
						<!--일반 야영장-->
						<div class="col-lg-3">
							<label class="form-label">캠핑장</label>
							<div class="d-flex align-items-center">
								<div class="btn btn-items btn-items-decrease">-</div>
								<input class="form-control input-items" name="gnrlsite"
									id="gnrlsite" type="text" value="0" disabled>
								<div class="btn btn-items btn-items-increase">+</div>
							</div>
						</div>
						<!--글램핑장-->
						<div class="col-lg-3">
							<label class="form-label">글램핑장</label>
							<div class="d-flex align-items-center">
								<div class="btn btn-items btn-items-decrease">-</div>
								<input class="form-control input-items" name="glampsite"
									id="glampsite" type="text" value="0" disabled>
								<div class="btn btn-items btn-items-increase">+</div>
							</div>
						</div>
						<!--자동차 야영장-->
						<div class="col-lg-3">
							<label class="form-label">오토캠핑장</label>
							<div class="d-flex align-items-center">
								<div class="btn btn-items btn-items-decrease">-</div>
								<input class="form-control input-items" name="autosite"
									id="autosite" type="text" value="0" disabled>
								<div class="btn btn-items btn-items-increase">+</div>
							</div>
						</div>
						<!--카라반-->
						<div class="col-lg-3">
							<label class="form-label">카라반</label>
							<div class="d-flex align-items-center">
								<div class="btn btn-items btn-items-decrease">-</div>
								<input class="form-control input-items" name="caravsite"
									id="caravsite" type="text" value="0" disabled>
								<div class="btn btn-items btn-items-increase">+</div>
							</div>
						</div>
					</div>
					<br>
					<div class="mb-4">
						<label class="form-label" for="form_name">사업자번호</label> <input
							class="form-control" name="buisiness_no" id="buisiness_no">
					</div>
					<div class="mb-4">
						<label class="form-label" for="form_type">입지구분</label>
							<ul class="list-inline mt-xl-1 mb-0">
								<li class="list-inline-item">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="lct_cl_0"
											name="lct_cl" value="섬"> <label
											class="form-check-label" for="type_0">섬 </label>
									</div>
								</li>
								<li class="list-inline-item">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="lct_cl_1"
											name="lct_cl" value="산"> <label
											class="form-check-label" for="type_1">산 </label>
									</div>
								</li>
								<li class="list-inline-item">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="lct_cl_2"
											name="lct_cl" value="해변"> <label
											class="form-check-label" for="type_2">해변 </label>
									</div>
								</li>
								<li class="list-inline-item">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="lct_cl_3"
											name="lct_cl" value="숲"> <label
											class="form-check-label" for="type_3">숲 </label>
									</div>
								</li>
								<li class="list-inline-item">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="lct_cl_4"
											name="lct_cl" value="계곡"> <label
											class="form-check-label" for="type_4">계곡 </label>
									</div>
								</li>
								<li class="list-inline-item">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="lct_cl_5"
											name="lct_cl" value="강"> <label
											class="form-check-label" for="type_5">강 </label>
									</div>
								</li>
								<li class="list-inline-item">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="lct_cl_6"
											name="lct_cl" value="호수"> <label
											class="form-check-label" for="type_6">호수 </label>
									</div>
								</li>
								<li class="list-inline-item">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="lct_cl_7"
											name="lct_cl" value="도심"> <label
											class="form-check-label" for="type_7">도심 </label>
									</div>
								</li>
							</ul>
					</div>
					<div class="mb-4">
						<label class="form-label">영업배상책임보험 유무</label>
						<div class="form-check">
							<input class="form-check-input" type="radio" id="insurance_y"
								name="insurance"> <label class="form-check-label"
								for="guests_0">유</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" id="insurance_n"
								name="insurance"> <label class="form-check-label"
								for="guests_1">무</label>
						</div>
					</div>
					<div class="mb-4">
						<label class="form-label" for="form_name">전체 면적(㎡)</label> <input
							class="form-control" name="allar" id="allar">
					</div>

					<div class="row">
						<!--봄,여름,가을,겨울 check로 변경하기-->
						<div class="mb-4 col-lg-6">
							<label class="form-label" for="form_type">운영기간</label>
							<ul class="list-inline mt-xl-1 mb-0">
								<li class="list-inline-item">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="oper_pd_0"
											name="oper_pd" value="봄"> <label
											class="form-check-label" for="type_0">봄 </label>
									</div>
								</li>
								<li class="list-inline-item">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="oper_pd_1"
											name="oper_pd" value="여름"> <label
											class="form-check-label" for="type_1">여름 </label>
									</div>
								</li>
								<li class="list-inline-item">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="oper_pd_2"
											name="oper_pd" value="가을"> <label
											class="form-check-label" for="type_2">가을 </label>
									</div>
								</li>
								<li class="list-inline-item">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="oper_pd_3"
											name="oper_pd" value="겨울"> <label
											class="form-check-label" for="type_3">겨울 </label>
									</div>
								</li>
							</ul>
						</div>
						<!--평일, 주말 check로 변경하기-->
						<div class="mb-4 col-lg-6">
							<label class="form-label" for="form_type">운영일</label>
							<ul class="list-inline mt-xl-1 mb-0">
								<li class="list-inline-item">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="oper_de_0"
											name="oper_de" value="주말"> <label
											class="form-check-label" for="type_0">주말 </label>
									</div>
								</li>
								<li class="list-inline-item">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="oper_de_1"
											name="oper_de" value="평일+주말"> <label
											class="form-check-label" for="type_1">평일+주말 </label>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row form-block">
				<div class="col-lg-4">
					<h4>주소</h4>
				</div>
				<div class="col-lg-7 ms-auto">
					<!-- Country-->
					<div class="mb-4">
						<label class="form-label" for="form_country">시/도</label> <select
							class="selectpicker form-control" name="do_name" id="do_name"
							data-style="btn-selectpicker" title=" " data-live-search="true">
							<option value="서울시">서울시</option>
							<option value="경기도">경기도</option>
							<option value="인천시">인천시</option>
							<option value="강원도">강원도</option>
							<option value="제주도">제주도</option>
							<option value="대전시">대전시</option>
							<option value="충청북도">충청북도</option>
							<option value="충청남도">충청남도</option>
							<option value="부산시">부산시</option>
							<option value="울산시">울산시</option>
							<option value="경상남도">경상남도</option>
							<option value="대구시">대구시</option>
							<option value="경상북도">경상북도</option>
							<option value="광주시">광주시</option>
							<option value="전라북도">전라북도</option>
							<option value="전라남도">전라남도</option>
						</select>
					</div>
					<!-- Street-->
					<div class="mb-4">
						<label class="form-label" for="form_street">시/군/구</label> <input
							class="form-control" name="sigungu_name" id="sigungu_name">
					</div>
					<!-- City + State-->
					<div class="row">
						<div class="col-md-6">
							<div class="mb-4">
								<label class="form-label" for="form_city">주소</label> <input
									class="form-control" name="addr1" id="addr1">
							</div>
						</div>
						<div class="col-md-6">
							<div class="mb-4">
								<label class="form-label" for="form_state">주소 상세</label> <input
									class="form-control" name="addr2" id="addr2">
							</div>
						</div>
					</div>
					<!-- ZIP Code-->
					<div class="row">
						<div class="col-md-6">
							<div class="mb-4">
								<label class="form-label" for="form_zip">우편번호</label> <input
									class="form-control" name="zipcode" id="zipcode">
							</div>
						</div>
					</div>
					<div class="mb-4">
						<label class="form-label" for="form_description">오시는길</label>
						<textarea class="form-control" name="direction" id="direction"
							rows="5" aria-describedby="descriptionHelp"></textarea>
					</div>
					<small class="mb-4">지도에서 선택</small>
					<div class="map-wrapper-300 mb-3">
						<div class="h-100" id="detailMap"></div>
					</div>
				</div>
			</div>
			<div class="row form-block flex-column flex-sm-row">
				<div class="col text-center text-sm-start"></div>
				<div class="col text-center text-sm-end">
						<button class="btn btn-primary" type="submit">
							<i class="fas me-1"></i> next step
						</button>
				</div>
			</div>
		</form>
	</div>
</section>


<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55b6be4dd88e467de806ae5586aa2142"></script>
<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다


function mapChange(value) {
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('detailMap'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 
	
	
	
	
	
	
	let name = document.getElementById('campsite_name').value;
	
	alert('name :' + name);

	// 키워드로 장소를 검색합니다
	ps.keywordSearch(name, placesSearchCB); 

	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new kakao.maps.LatLngBounds();

	        for (var i=0; i<data.length; i++) {
	            displayMarker(data[i]);    
	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	        }       

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	    } 
	}

	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
	    
	    // 마커를 생성하고 지도에 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x) 
	    });

	    // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	        infowindow.open(map, marker);
	    });
	}
	
	
	
}



// 키워드로 장소를 검색합니다
ps.keywordSearch(name, placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

