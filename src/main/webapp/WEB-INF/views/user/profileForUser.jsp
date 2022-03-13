<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원-마이페이지" name="title"/>
</jsp:include>

<section class="py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 me-lg-auto">
                    <div class="card border-0 shadow mb-6 mb-lg-0">
                        <div class="card-header bg-gray-100 py-4 border-0 text-center">
                            <a class="d-inline-block" href="#"><img class="d-block avatar avatar-xxl p-2 mb-2" src="${path}/resources/img/newphoto/user1.jpg" alt=""></a>
                            <h5>${loginUser.name}</h5>
                            <p class="text-muted text-sm mb-0">${loginUser.userId}</p>
                        </div>
                        <div class="card-body p-4">
                            <div class="d-flex align-items-center mb-3">
                                <div class="icon-rounded icon-rounded-sm bg-success-light flex-shrink-0 me-2">
                                    <svg class="svg-icon text-success svg-icon-md">
                                        <use xlink:href="#diploma-1"> </use>
                                    </svg>
                                </div>
                                <div>
                                    <p class="mb-0"><c:out value="${ totalBoard }" /> 개의 게시물 작성</p>
                                </div>
                            </div>
                            <div class="d-flex align-items-center mb-3">
                                <div class="icon-rounded icon-rounded-sm bg-success-light flex-shrink-0 me-2">
                                    <svg class="svg-icon text-success svg-icon-md">
                                        <use xlink:href="#pen-1"></use>
                                    </svg>
                                </div>
                                <div>
                                    <p class="mb-0"><c:out value="" />${ reCount } 개의 리뷰 작성</p>
                                </div>
                            </div>
                            <hr>
                            <h6>Menu</h6>
                            <ul class="card-text text-muted">
                                <li><a class="text-muted GmarketSansMedium" href="${path}/inquiry/listByUser">문의 내역</a></li>
                                <li><a class="text-muted GmarketSansMedium" href="${path}/user/updateInfo">회원 정보 수정</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 ps-lg-5">

                    <div class="text-block ">
                        <p class="subtitle text-sm text-success ">${loginUser.name}님이 작성한</p>
                        <h4 class="mb-5 ">후기 게시글</h4>
                        <div class="row ">
                            <!-- blog item-->
                            <c:if test="${ reviewList != null }">
                            <c:forEach var="reviewBoard" items="${ reviewList }" >
                            <div class="col-lg-4 col-sm-6 mb-4 hover-animate ">
                                <div class="card shadow border-0 h-100 ">
                                    <a href="${path}/boards/reviewView?no=${reviewBoard.no}">
                                    <!-- <img class="img-fluid card-img-top " src="${path}/../resources/${savePath2}/${reviewBoard.renameImage}" alt="... " />-->
                                    </a>
                                    <div class="card-body ">
                                        <h5 class="my-2 "><a class="text-dark " href="${path}/boards/reviewView?no=${reviewBoard.no}"><c:out value="${ reviewBoard.title }" /></a></h5>
                                        <p class="text-gray-500 text-sm my-3 "><i class="far fa-clock me-2 "></i><c:out value="${ reviewBoard.registDate }" /></p>
                                        <p class="my-2 text-muted text-sm "></p><a class="btn btn-link ps-0 " href="${path}/boards/reviewView?no=${reviewBoard.no} ">더보기<i class="fa fa-long-arrow-alt-right ms-2 "></i></a>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                            </c:if>
                            
                        </div>
                    </div>

                    <div class="text-block">
                        <p class="subtitle text-sm text-success">${loginUser.name}님이 작성한</p>
                        <h4 class="mb-5">자유 게시글</h4>
                        <div class="row">
                            <!-- blog item-->
                            <c:if test="${ freeList != null }">
                            <c:forEach var="freeBoard" items="${ freeList }" >
                            <div class="col-lg-4 col-sm-6 mb-4 hover-animate">
                                <div class="card shadow border-0 h-100">
                                    <div class="card-body">
                                        <h5 class="my-2"><a class="text-dark" href="${path}/boards/freeView?no=${freeView.no}"><c:out value="${ freeBoard.title }" /></a></h5>
                                        <p class="text-gray-500 text-sm my-3"><i class="far fa-clock me-2"></i><c:out value="${ freeBoard.registDate }" /></p>
                                        <p class="my-2 text-muted text-sm"></p><a class="btn btn-link ps-0 " href="${path}/boards/freeView?no=${freeView.no}">더보기<i class="fa fa-long-arrow-alt-right ms-2"></i></a>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                            </c:if>
                            
                        </div>
                    </div>

                    <div class="text-block ">
                        <p class="subtitle text-sm text-success ">${loginUser.name}님이 작성한</p>
                        <h5 class="mb-4 ">Review List</h5>
                         <c:if test="${ reList != null }">
                         <c:forEach var="review" items="${ reList }" >
                        <div class="d-flex d-block d-sm-flex review ">
                            <!--<div class="text-md-center flex-shrink-0 me-4 me-xl-5 ">
                                <img class="d-block avatar avatar-xl p-2 mb-2 " src="img/avatar/avatar-8.jpg " alt="Padmé Amidala "><span class="text-uppercase text-muted text-sm ">Dec 2018</span></div>-->
                            <div>
                                <h6 class="mt-2 mb-1 ">${ review.campsiteName }</h6>
                                <div class="mb-2 "><i class="fa fa-xs fa-star text-primary "></i><i class="fa fa-xs fa-star text-primary "></i><i class="fa fa-xs fa-star text-primary "></i><i class="fa fa-xs fa-star text-primary "></i><i class="fa fa-xs
                            fa-star text-primary "></i>
                                </div>
                                <p class="text-muted text-sm ">${ review.content }</p>
                                <span class="text-uppercase text-muted text-sm ">${ review.registDate }</span>
                            </div>
                        </div>                        
                        </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	