<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="캠핑장 추가 step2" name="title"/>
</jsp:include>

<div class="progress rounded-0 sticky-top" style="height: 8px; top: 100px;">
        <div class="progress-bar" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
    <section class="py-5">
        <div class="container">
            <p class="subtitle text-primary">Add new listing</p>
            <h1 class="h2 mb-5">캠핑장 소개 및 사진<span class="text-muted float-end">Step 2</span> </h1>

            <form action="${path }/campsite/step3" id="updateCampsiteStep2" name="updateCampsiteStep2" method="POST"
				enctype="multipart/form-data" autocomplete="off">
                <div class="row form-block">
                    <div class="col-lg-4">
                        <h4>소개글</h4>
                    </div>
                    <div class="col-lg-7 ms-auto">
                        <div class="mb-5">
                            <label class="form-label" for="form_availability">한줄 소개</label>
                            <textarea class="form-control" name="line_intro" id="line_intro" rows="2" aria-describedby="availabilityHelp"></textarea>
                        </div>
                    </div>
                </div>


            <div class="row form-block">
                <div class="col-lg-4">
                    <h4>갤러리</h4>
                </div>
                <div class="col-lg-7 ms-auto">             
                    <div class="mb-4">
                            <div class="dz-message text-muted">
                            	<p>캠핑장 사진을 업로드 해 주세요.</p>
                                <input type = "file" name = "campsiteImg" id = "campsiteImg" multiple>
                            </div>

                    </div>
                    
                    <div class="d-none" id="dropzoneTemplate">
                        <div class="dz-preview dz-file-preview">
                            <div class="dz-image"><img data-dz-thumbnail="" alt="" src="${path}/resources/img/logo-square.svg"></div>
                            <div class="dz-details">
                                <div class="dz-filename"><span data-dz-name=""></span></div>
                                <div class="dz-size" data-dz-size=""></div>
                            </div>
                            <div class="dz-progress"><span class="dz-upload" data-dz-uploadprogress=""></span></div>
                            <div class="dz-success-mark"><span class="dz-icon"><i class="fa-check fa"></i></span></div>
                            <div class="dz-error-mark"><span class="dz-icon"><i class="fa-times fa"></i></span></div>
                            <div class="dz-error-message"><span data-dz-errormessage=""></span></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row form-block flex-column flex-sm-row">
                <div class="col text-center text-sm-start">
                    <a class="btn btn-link text-muted" href="user-add-1.html"> <i class="fa-chevron-left fa me-2"></i>Back</a>
                </div>
                <div class="col text-center text-sm-end">						<button class="btn btn-primary" type="submit">
							<i class="fas me-1"></i> next step
						</button></div>
            </div>
            </form>
        </div>
    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	