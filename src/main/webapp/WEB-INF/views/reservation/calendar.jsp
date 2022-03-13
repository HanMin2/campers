<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="예약 캘린더" name="title"/>
</jsp:include>
	
	<div class="wrapper mt-5">
        <!-- Start Content-->
        <div class="container-fluid">
            <!-- start page title -->
            <div class="d-flex justify-content-between align-items-center mb-5">
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box">
                        <h4 class="page-title">Reservation Calendar</h4>
                    </div>
                </div>
            </div>
        </div>
        <!-- end page title -->
        <div class="container-lg">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row align-items-sm-center">
                            <div class="col-lg-12">
                                <div id="calendar"></div>
                                <div id="external-events" class="m-t-20">
                                </div>
                            </div>
                            <!-- end col-->
                        </div>
                        <!-- end row -->
                    </div>
                    <!-- end card body-->
                </div>
                <!-- end card -->
            </div>
            <!-- end col-12 -->
        </div>
        <!-- container -->
    </div>
    <!-- content -->
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	