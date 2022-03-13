<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="문의내역 상세" name="title"/>
</jsp:include>

<section class="py-5">
        <div class="container">
            <div class="d-flex flex-column flex-md-row justify-content-md-between align-items-md-center mb-4">
                <h1 class="mb-3 mb-md-0 hero-heading mb-0">1:1 문의 내역</h1>
                <div><a class="btn btn-link ps-0 text-primary" href="user-messages.html"><i class="fa fa-arrow-left me-2"></i> 리스트로 돌아가기</a></div>
            </div>
            <div class="card border-0 shadow mb-4">
                <div class="card-body p-4">
                    <div class="text-block pb-3">
                        <div class="d-flex align-items-center justify-content-between">
                            <div>
                                <h4><a class="text-reset" href="detail-rooms.html">${campsite.campsite_name}</a></h4>
                                <p class="text-muted text-base mb-0">${campsite.do_name} ${campsite.sigungu_name}</p>
                                <div class="mt-n1"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-gray-200"></i>
                                </div>
                            </div>
                            <a href="detail-rooms.html"><img class="ms-3 rounded flex-shrink-0" src="<c:url value="${path}/../resources/${savePath2}" />" alt="" width="100"></a>
                        </div>
                    </div>
                </div>
            </div>
            <form action="${path}/inquiry/listDetail2" method="GET">
            <!-- Chat Box-->
            <div class="px-4 py-5">
                <div class="row">
                    <input type="hidden" id="index" name="index" value="${campsite.campsite_index}" />
                    <c:if test="${ list != null }">
                    <c:forEach var="inquiry" items="${ list }">
                    <c:choose>
                    <c:when test="${ inquiry.sender eq loginUser.userId }">
                    <!-- Sender Message-->
                    <div style="float: right;">
                        <div class="col-md-9 col-xl-7 me-0 mb-3" style="float: right;">
                            <div class="me-5" style="float: right;">
                                <div class="bg-kakhi rounded p-4 mb-2">
                                    <p class="text-sm mb-0 text-white">${inquiry.content}</p>
                                </div>
                                <p class="small text-muted ms-3">${inquiry.registDate}</p>
                            </div>
                        </div>
                    </div>
                    </c:when>
                    <c:otherwise>
                    <!-- Reciever Message-->
                    <div class="d-flex col-md-9 col-xl-7 mb-3">
                        <div class="ms-3">
                            <div class="bg-beige rounded p-4 mb-2">
                                <p class="text-sm mb-0">${inquiry.content}</p>
                            </div>
                            <p class="small text-muted ms-3">${inquiry.registDate}</p>
                        </div>
                    </div>
                    </c:otherwise>
                    </c:choose>
                    </c:forEach>
                    </c:if>
                    <!-- Reciever Message
                    <div style="float: right;">
                        <div class="col-md-9 col-xl-7 me-0 mb-3" style="float: right;">
                            <div class="me-5" style="float: right;">
                                <div class="bg-kakhi rounded p-4 mb-2">
                                    <p class="text-sm mb-0 text-white">Samsa was a travelling salesman - and above it there hung a picture that he had recently cut out of an illustrated magazine and housed in a nice, gilded frame.</p>
                                </div>
                                <p class="small text-muted ms-3" style="float: right;">2022년 2월 1일 12:00 PM</p>
                            </div>
                        </div>
                    </div>-->
                </div>
            </div>
            <!-- Typing area-->
            <div class="bg-light rounded shadow-sm" >
                <div class="input-group">
                	
                    <textarea class="form-control border-0 p-4 bg-light text-sm" name="con" id="con" placeholder="Type a message" aria-describedby="button-sendMessage"></textarea>
                    <button class="btn btn-link" id="button-sendMessage" type="submit"><i class="fa fa-paper-plane"></i></button>
                	
                </div>
                </div>
            </form>
        </div>
    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	