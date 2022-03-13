<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="캠핑장 추가 step4" name="title"/>
</jsp:include>

<div class="progress rounded-0 sticky-top" style="height: 8px; top: 100px;">
        <div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
    <section class="py-5">
        <div class="container">
            <p class="subtitle text-primary">Add new listing</p>
            <h1 class="h2 mb-5">ETC.<span class="text-muted float-end">Step 4</span> </h1>
            <form action = "${path }/campsite/step5" method = "POST" id="updateCampsiteStep4" name="updateCampsiteStep4" enctype="multipart/form-data" autocomplete="off">
                <div class="row form-block">
                    <div class="col-lg-4">
                        <h4>테마 설정</h4>
                    </div>
                    <div class="col-lg-7 ms-auto">
                        <div class="mb-4">
                            <label class="form-label">여행시기</label>
                            <ul class="list-inline mb-0">
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="tour_era_0" name="tour_era" value = "봄">
                                        <label class="form-check-label text-muted" for="tour_era_0">봄    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="tour_era_1" name="tour_era" value = "여름">
                                        <label class="form-check-label text-muted" for="tour_era_1">여름    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="tour_era_2" name="tour_era" value = "가을">
                                        <label class="form-check-label text-muted" for="tour_era_2">가을    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="tour_era_3" name="tour_era" value = "겨울">
                                        <label class="form-check-label text-muted" for="tour_era_3">겨울    </label>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="mb-4">
                            <label class="form-label">테마</label>
                            <ul class="list-inline mb-0">
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="thema_0" name="thema" value = "일출명소">
                                        <label class="form-check-label text-muted" for="thema_0">일출명소   </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="thema_1" name="thema" value = "일몰명소">
                                        <label class="form-check-label text-muted" for="thema_1">일몰명소    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="thema_2" name="thema" value = "봄꽃여행">
                                        <label class="form-check-label text-muted" for="thema_2">봄꽃여행    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="thema_3" name="thema" value = "여름물놀이">
                                        <label class="form-check-label text-muted" for="thema_3">여름물놀이    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="thema_4" name="thema" value = "가을단풍명소">
                                        <label class="form-check-label text-muted" for="thema_4">가을단풍명소    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="thema_5" name="thema" value = "겨울눈꽃명소">
                                        <label class="form-check-label text-muted" for="thema_5">겨울눈꽃명소    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="thema_6" name="thema" value = "수상레저">
                                        <label class="form-check-label text-muted" for="thema_6">수상레저    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="thema_7" name="thema" value = "항공레저">
                                        <label class="form-check-label text-muted" for="thema_7">항공레저    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="thema_8" name="thema" value = "걷기길">
                                        <label class="form-check-label text-muted" for="thema_8">걷기길    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="thema_9" name="thema" value = "스키">
                                        <label class="form-check-label text-muted" for="thema_9">스키    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="thema_10" name="thema" value = "낚시">
                                        <label class="form-check-label text-muted" for="thema_10">낚시    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="thema_11" name="thema" value = "액티비티">
                                        <label class="form-check-label text-muted" for="thema_11">엑티비티    </label>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row form-block">
                    <div class="col-lg-4">
                        <h4>추가 선택사항</h4>
                    </div>
                    <div class="col-lg-7 ms-auto">
                        <!--이전 step3에서 부대시설 - 캠핑장비대여에 체크 되어있을 경우에만 선택할 수 있게..? -->
                        <!--데이터가 어떻게 들어가고 조회될지 모르겠어서 일단 뒤쪽에 뺐는데, 아님 그냥 조건문 없이 앞쪽에 넣어도 되지않을까합니다.-->
                        <!--빼도 되고요..^^ㅎㅎ-->
                        <div class="mb-4">
                        	<p>step 3에서 캠핑장비 대여에 체크하신 분들만 작성해 주세요!</p>
                            <label class="form-label">캠핑장비대여</label>
                            <ul class="list-inline mb-0">
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="eqpmn_lend_0" name="eqpmn_lend" value = "텐트">
                                        <label class="form-check-label text-muted" for="eqpmn_lend_0">텐트    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="eqpmn_lend_1" name="eqpmn_lend" value = "화로대">
                                        <label class="form-check-label text-muted" for="eqpmn_lend_1">화로대    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="eqpmn_lend_2" name="eqpmn_lend" value = "난방기구">
                                        <label class="form-check-label text-muted" for="eqpmn_lend_2">난방기구    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="eqpmn_lend_3" name="eqpmn_lend" value = "식기">
                                        <label class="form-check-label text-muted" for="eqpmn_lend_3">식기    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="eqpmn_lend_4" name="eqpmn_lend" value = "침낭">
                                        <label class="form-check-label text-muted" for="eqpmn_lend_4">침낭    </label>
                                    </div>
                                </li>
                            </ul>
                        </div>

                        <div class="mb-4">
                            <label class="form-label" for="camp_homepage">홈페이지</label>
                            <input class="form-control" name="homepage" id="homepage" placeholder="http://">
                        </div>

                        <div class="mb-4 col-lg-12">
                            <label class="form-label" for="program">체험프로그램</label>
                            <div class="row">
                                <div class="col-lg-12">
                                    <input class="form-control" name="exprn_progrm" id="exprn_progrm" placeholder="">
                                </div>
                                <!--<div class="col-lg-2 d-grid form-group mb-0">
                                    <button class="btn btn-primary h-100" type="submit">추가</button>
                                </!--div>-->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row form-block flex-column flex-sm-row">
                    <div class="col text-center text-sm-start">
                        <a class="btn btn-link text-muted" href="user-add-3.html"> <i class="fa-chevron-left fa me-2"></i>Back</a>
                    </div>
                    <div class="col text-center text-sm-end"><button class="btn btn-primary" type="submit">
							<i class="fas me-1"></i> next step
						</button></div>
                </div>
            </form>
        </div>
    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	