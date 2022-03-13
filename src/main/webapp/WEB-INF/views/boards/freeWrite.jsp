<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="자유게시글 작성" name="title"/>
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
                                <form action="${ path }/boards/freeWrite" method="POST" enctype="multipart/form-data">
                                   
                                    <div class="form-group row mb-3">
                                        <label for="writerId" class="col-3 col-form-label">Writer</label>
                                        <div class="col-9">
                                            <input type="text" name="writerId" id="writerId" class="form-control" readonly="" value="${loginUser.userId }">
                                        </div>
                                    </div>

                                    <div class="form-group row mb-3">
                                        <label for="title" class="col-3 col-form-label">Title</label>
                                        <div class="col-9">
                                            <input type="text" name="title" id="title" class="form-control">
                                        </div>
                                    </div>

                                    <div class="form-group row mb-3">
                                        <label for="upfile" class="col-3 col-form-label">File</label>
                                        <div class="col-9">
                                            <input type="file" name="upfile" id="upfile" class="form-control-file">
                                        </div>
                                    </div>

                                    <div class="form-group row mb-3">
                                        <label for="content" class="col-3 col-form-label">Contents</label>
                                        <div class="col-9">
                                        <textarea class="form-control" name="content" id="content" style="width: 100%; height: 10em; resize: none; "></textarea>
                                        </div>
                                        <!-- end preview-->
                                    </div>
                                    
                                <!-- end card-body -->
                                    <div style="text-align: center;">
                                        <button type="submit" class="btn btn-primary">등록</button>
                                        <button type="submit" class="btn btn-primary" onclick="location.href = '${ path }/boards/freeList'">목록으로</button>
                                    </div>
                                </form>
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
    <br>
    <br>
    <br>
    
    <!-- content -->
    

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

    <!-- Summernote js -->
    <script src="${path}/resources/assets/js/vendor/summernote-bs4.min.js"></script>
    <!-- SimpleMDE js -->
    <script src="${path}/resources/assets/js/vendor/simplemde.min.js"></script>

    <!-- Summernote demo -->
    <script src="${path}/resources/assets/js/pages/demo.summernote.js"></script>

    <!-- SimpleMDE demo -->
    <script src="${path}/resources/assets/js/pages/demo.simplemde.js"></script>
