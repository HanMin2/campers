<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="캠핑장 추가 step3" name="title"/>
</jsp:include>


<div class="progress rounded-0 sticky-top" style="height: 8px; top: 100px;">
        <div class="progress-bar" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
    <section class="py-5">
        <div class="container">
            <p class="subtitle text-primary">Add new listing</p>
            <h1 class="h2 mb-5">부대시설 추가<span class="text-muted float-end">Step 3</span> </h1>
            <form action="${path }/campsite/step4" id="updateCampsiteStep3" name="updateCampsiteStep3" method="POST"
				enctype="multipart/form-data" autocomplete="off">
                <div class="row form-block">
                    <div class="col-lg-4">
                        <h4>필수 부대시설</h4>
                    </div>
                    <div class="col-lg-7 ms-auto">
                        <div class="row">
                            <div class="col-lg-4">
                                <label class="form-label">상주관리인원</label>
                                <div class="d-flex align-items-center">
                                    <div class="btn btn-items btn-items-decrease">-</div>
                                    <input class="form-control input-items" type="text" value="1" name= "manager" id="manager" disabled>
                                    <div class="btn btn-items btn-items-increase">+</div>
                                </div>
                            </div>
                        </div>
                        <br><br>
                        <div class="row">
                            <div class="col-lg-4">
                                <label class="form-label">화장실</label>
                                <div class="d-flex align-items-center">
                                    <div class="btn btn-items btn-items-decrease">-</div>
                                    <input class="form-control input-items" type="text" value="1" name= "toilet" id="toilet" disabled>
                                    <div class="btn btn-items btn-items-increase">+</div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <label class="form-label">샤워실</label>
                                <div class="d-flex align-items-center">
                                    <div class="btn btn-items btn-items-decrease">-</div>
                                    <input class="form-control input-items" type="text" value="1" name= "shower" id="shower" disabled>
                                    <div class="btn btn-items btn-items-increase">+</div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <label class="form-label">개수대</label>
                                <div class="d-flex align-items-center">
                                    <div class="btn btn-items btn-items-decrease">-</div>
                                    <input class="form-control input-items" type="text" value="1" name= "sink" id="sink" disabled>
                                    <div class="btn btn-items btn-items-increase">+</div>
                                </div>
                            </div>
                        </div>
                        <br><br>
                        <div class="row">
                            <div class="col-lg-3">
                                <label class="form-label">소화기</label>
                                <div class="d-flex align-items-center">
                                    <div class="btn btn-items btn-items-decrease">-</div>
                                    <input class="form-control input-items" type="text" value="1" name= "extshr" id="extshr" disabled>
                                    <div class="btn btn-items btn-items-increase">+</div>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <label class="form-label">방화수</label>
                                <div class="d-flex align-items-center">
                                    <div class="btn btn-items btn-items-decrease">-</div>
                                    <input class="form-control input-items" type="text" value="1" name= "firewater" id="firewater" disabled>
                                    <div class="btn btn-items btn-items-increase">+</div>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <label class="form-label">방화사</label>
                                <div class="d-flex align-items-center">
                                    <div class="btn btn-items btn-items-decrease">-</div>
                                    <input class="form-control input-items" type="text" value="1" name= "firesand" id="firesand" disabled>
                                    <div class="btn btn-items btn-items-increase">+</div>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <label class="form-label">화재탐지기</label>
                                <div class="d-flex align-items-center">
                                    <div class="btn btn-items btn-items-decrease">-</div>
                                    <input class="form-control input-items" type="text" value="1" name= "firesensor" id="firesensor" disabled>
                                    <div class="btn btn-items btn-items-increase">+</div>
                                </div>
                            </div>
                        </div>
                        <br><br>
                        <div class="row">
                            <div class="mb-4 col-lg-6">
                                <label class="form-label" for="form_type">화로대</label>
                                <select class="selectpicker form-control" name="brazier" id="brazier" data-style="btn-selectpicker" title="선택" aria-describedby="propertyTypeHelp">
                                  <option value="개별">개별</option>
                                  <option value="불가">불가</option>
                                </select>
                            </div>
                            <div class="mb-4 col-lg-6">
                                <label class="form-label" for="form_type">애완동물</label>
                                <select class="selectpicker form-control" name="animal" id="animal" data-style="btn-selectpicker" title="선택" aria-describedby="propertyTypeHelp">
                                  <option value="가능">가능</option>
                                  <option value="불가능">불가능</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row form-block">
                    <div class="col-lg-4">
                        <h4>기타 부대시설</h4>
                    </div>
                    <div class="col-lg-7 ms-auto">
                        <div class="mb-4">
                            <label class="form-label">부대시설</label>
                            <ul class="list-inline mb-0">
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="sbrs_0" name="sbrs" value="전기">
                                        <label class="form-check-label text-muted" for="sbrs_0">전기    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="sbrs_1" name="sbrs" value="무선인터넷">
                                        <label class="form-check-label text-muted" for="sbrs_1">무선인터넷    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="sbrs_2" name="sbrs" value="장작판매">
                                        <label class="form-check-label text-muted" for="sbrs_2">장작판매    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="sbrs_3" name="sbrs" value="온수">
                                        <label class="form-check-label text-muted" for="sbrs_3">온수    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="sbrs_4" name="sbrs" value="놀이터">
                                        <label class="form-check-label text-muted" for="sbrs_4">놀이터    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="sbrs_5" name="sbrs" value="운동시설">
                                        <label class="form-check-label text-muted" for="sbrs_5">운동시설    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="sbrs_6" name="sbrs" value="물놀이장">
                                        <label class="form-check-label text-muted" for="sbrs_6">물놀이장    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="sbrs_7" name="sbrs" value="캠핑장비대여">
                                        <label class="form-check-label text-muted" for="sbrs_7">캠핑장비대여    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="sbrs_8" name="sbrs" value="체험프로그램">
                                        <label class="form-check-label text-muted" for="sbrs_8">체험프로그램    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="sbrs_9" name="sbrs" value="트램폴린">
                                        <label class="form-check-label text-muted" for="sbrs_9">트렘폴린    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="sbrs_10" name="sbrs" value="산책로">
                                        <label class="form-check-label text-muted" for="sbrs_10">산책로    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="sbrs_11" name="sbrs" value="운동장">
                                        <label class="form-check-label text-muted" for="sbrs_11">운동장    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="sbrs_12" name="sbrs" value="마트.편의점">
                                        <label class="form-check-label text-muted" for="sbrs_12">마트.편의점    </label>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="sbrs_13" name="sbrs" value="애완동물">
                                        <label class="form-check-label text-muted" for="sbrs_13">애완동물 </label>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row form-block flex-column flex-sm-row">
                    <div class="col text-center text-sm-start">
                        <a class="btn btn-link text-muted" href="user-add-2.html"> <i class="fa-chevron-left fa me-2"></i>Back</a>
                    </div>
                    <div class="col text-center text-sm-end"><button class="btn btn-primary" type="submit">
							<i class="fas me-1"></i> next step
						</button></div>
                </div>
            </form>
        </div>
    </section>
    

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	