<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="영수증" name="title"/>
</jsp:include>

<section class="py-5 p-print-0">
        <div class="container">
            <div class="row mb-4 d-print-none">
                <div class="col-lg-6">
                    <!-- Breadcrumbs -->
                    <!--<ol class="breadcrumb ps-0  justify-content-start">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item"><a href="user-account.html">Account</a></li>
                        <li class="breadcrumb-item active">Invoice 202009001 </li>
                    </ol>-->
                </div>
                <div class="col-lg-6 text-lg-end">
                    <button class="btn btn-primary me-2"><i class="far fa-file-pdf me-2"></i>Download PDF</button>
                    <button class="btn" onclick="window.print()"><i class="fas fa-print me-2"></i>Print</button>
                </div>
            </div>
            <div class="card border-0 shadow shadow-print-0">
                <div class="card-header bg-gray-100 p-5 border-0 px-print-0">
                    <div class="row">
                        <div class="col-6 d-flex align-items-center"><img src="img/newphoto/camper_logo_text_removebg.png" alt="Camper's"></div>
                        <div class="col-6 text-end">
                            <h3 class="mb-0">영수증</h3>

                            <!--현재 날짜, 시간-->
                            <p class="mb-0">2022년 1월 1일 오후 11시 11분</p>
                        </div>
                    </div>
                </div>
                <div class="card-body p-5 p-print-0">
                    <div class="row">
                        <table class="m-auto table" style="width: 30rem;">
                            <thead class="bg-gray-200">
                                <tr class="border-0" style="font-size: 1.3rem">
                                    <th class="center text-center">체크인</th>
                                    <th class="text-center">></th>
                                    <th class="text-center">체크아웃</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="text-center" style="font-size: 1.1rem">2022년 1월 5일<br>(pm 3:00)</td>
                                    <td></td>
                                    <td class="text-center" style="font-size: 1.1rem">2022년 1월 6일<br>(am 11:00)</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <br><br><br>
                    <div class="row mb-4">
                        <div class="col-sm-6 pe-lg-3">
                            <h2 class="h6 text-uppercase mb-4">캠핑장 정보</h2>
                            <h6 class="mb-1">가가 캠핑장</h6>
                            <p class="text-muted">
                                <!--우편번호-->01231<br>주소<br>주소상세<br>033-111-1111</p>
                        </div>
                        <div class="col-sm-6 ps-lg-4">
                            <h2 class="h6 text-uppercase mb-4">예약자 정보</h2>
                            <h6 class="mb-1">홍길동</h6>
                            <p class="text-muted">010-1234-1234<br>test123@gmail.com<br>서울시 강남구<br></p>
                        </div>
                    </div>
                    <div class="row mb-5">
                        <div class="col-md-6 pe-lg-3 text-sm">
                            <div class="row">
                                <div class="col-6 text-uppercase text-muted">타입</div>
                                <div class="col-6 text-end">캠핑장</div>
                            </div>
                            <div class="row">
                                <div class="col-6 text-uppercase text-muted">부대시설</div>
                                <div class="col-6 text-end">와이파이, 장작, 바베큐</div>
                            </div>
                            <br>

                            <!--<div class="row">
                                <div class="col-6 text-uppercase text-muted">Payment method</div>
                                <div class="col-6 text-end">Bank transfer</div>
                            </div>
                        </div>
                        <div class="col-md-6 ps-lg-4 text-sm">
                            <div class="row">
                                <div class="col-6 text-uppercase text-muted">Issued on</div>
                                <div class="col-6 text-end">Sep 01, 2020</div>
                            </div>
                            <div class="row">
                                <div class="col-6 text-uppercase text-muted">Due on</div>
                                <div class="col-6 text-end">Sep 01, 2020</div>
                            </div>-->
                        </div>
                    </div>
                    <div class="table-responsive text-sm mb-5">
                        <table class="table table-striped">
                            <thead class="bg-gray-200">
                                <tr class="border-0">
                                    <th class="center">#</th>
                                    <th>Item</th>
                                    <th>상세 내용</th>
                                    <th class="text-end">Price</th>
                                    <th class="text-end">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="text-center">1</td>
                                    <td class="fw-bold">캠핑장 대여 비용</td>
                                    <td>1박</td>
                                    <td class="text-end">80,000원 X1</td>
                                    <td class="text-end">80,000원</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-sm-7 col-lg-5 col-xl-4 ms-auto">
                            <table class="table">
                                <tbody>
                                    <!--<tr class="text-sm">
                                        <td class="fw-bold">Subtotal</td>
                                        <td class="text-end">$1,058</td>
                                    </tr>
                                    <tr class="text-sm">
                                        <td class="fw-bold">VAT (21%)</td>
                                        <td class="text-end">$222.18</td>
                                    </tr>-->
                                    <tr>
                                        <td class="text-uppercase fw-bold">총 금액</td>
                                        <td class="text-end fw-bold">100,000원</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="card-footer bg-gray-100 p-5 px-print-0 border-0 text-end text-sm">
                    <p class="mb-0">We go camping. We are CAMPERS. Camper's, Inc.</p>
                </div>
            </div>
        </div>
    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	