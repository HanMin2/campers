<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="후기게시글 수정" name="title"/>
</jsp:include>

<section class="hero-home dark-overlay mb-5"><img class="bg-image" src="${path}/resources/img/newphoto/reviewPost-bg.jpg" alt="">
        <div class="container py-7">
            <div class="overlay-content text-center text-white">
                <h1 class="display-3 text-serif fw-bold text-shadow mb-0">Write a Review Post</h1>
            </div>
        </div>
    </section>


    <!-- Start Content-->
    <div class="container-fluid">

        <div class="col-lg-7" style="margin: auto;">
            <div class="card">
                <div class="card-body">

                    <!-- end nav-->
                    <div class="tab-content">
                        <div class="tab-pane show active" id="horizontal-form-preview">
                            <div class="form-horizontal">
                                <form action="${ path }/boards/reviewUpdate" method="POST" enctype="multipart/form-data">
                                    <input type="hidden" name="no" id="no" value="${ reviewBoard.no }" />
									<input type="hidden" name="originalFilename" id="originalFilename" value="${ reviewBoard.originalFilename }" />
									<input type="hidden" name="renamedFilename" id="renamedFilename" value="${ reviewBoard.renameFilename}" />
									
                                    <div class="form-group row mb-3">
                                        <label for="example-readonly2" class="col-3 col-form-label">Writer</label>
                                        <div class="col-9">
                                            <input type="text" name="writerId" id="writerId" class="form-control" readonly="" value="${reviewBoard.writerId}">
                                        </div>
                                    </div>

                                    <div class="form-group row mb-3">
                                        <label for="simpleinput" class="col-3 col-form-label">Title</label>
                                        <div class="col-9">
                                            <input type="text" name="title" id="title" class="form-control" value="${reviewBoard.title}">
                                        </div>
                                    </div>

                                    <div class="form-group row mb-3">
                                        <label for="example-fileinput" class="col-3 col-form-label">File</label>
                                        <div class="col-9">
                                            <input type="file" name="reloadImage" id="reloadImage" class="form-control-file">
											<c:if test="${ !empty reviewBoard.mainImage }">
											현재 업로드한 이미지 : 
											<a>
											<c:out value="${ reviewBoard.mainImage }"></c:out>
											</a>
											</c:if>
                                        </div>
                                    </div>

                                    <div class="form-group row mb-3">
                                        <label for="example-fileinput" class="col-3 col-form-label">File</label>
                                        <div class="col-9">
                                            <input type="file" name="reloadFile" id="reloadFile" class="form-control-file">
											<c:if test="${ !empty reviewBoard.originalFilename }">
											현재 업로드한 파일 : 
											<a>
											<c:out value="${ reviewBoard.originalFilename }"></c:out>
											</a>
											</c:if>
                                        </div>
                                    </div>

                                    <div class="form-group row mb-3">
                                        <label for="example-fileinput" class="col-3 col-form-label">Contents</label>
                                        <div class="col-9">
                                        <textarea class="form-control" name="content" id="content" style="width: 100%; height: 10em; resize: none; ">${reviewBoard.content}</textarea>
                                        </div>
                                        <!-- end preview-->
                                    </div>
                                    
                                    <div style="text-align: center;">
                                        <button type="submit" class="btn btn-primary">수정</button>
                                        <button type="submit" class="btn btn-primary" onclick="location.href = '${ path }/boards/reviewList'">목록으로</button>
                                    </div>
                                </form>
                                <!-- end card-body -->
                                <br>
                                <br>
                                <div class="form-group mb-0 justify-content-end">
                                </div>
                            </div>
                            <!-- end preview-->
                        </div>
                        <!-- end tab-content-->
                    </div>
                    <!-- end card-body -->
                </div>
                <!-- end card -->
            </div>
            <!-- end col -->
        </div>
        <!-- end row -->
    </div>
    <!-- content -->


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
