<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="예약내역 | 회원" name="title" />
</jsp:include>

	<section class="py-5">
		<div class="container">
			<!-- Breadcrumbs -->
			<ol class="breadcrumb ps-0  justify-content-start">
				<li class="breadcrumb-item"><a href="index.html">Home</a></li>
				<li class="breadcrumb-item active">회원 페이지</li>
			</ol>
			<div class="d-flex justify-content-between align-items-end mb-5">
				<h1 class="hero-heading mb-0">나의 예약 내역</h1>
			</div>
			<div
				class="d-flex justify-content-between align-items-center flex-column flex-lg-row mb-5">
				<div class="me-3">
					<!-- strong 태그 안에 예약내역 개수 불러오기-->
					<p class="mb-3 mb-lg-0">
					<c:if test="${cnt != null}">
						지금까지 <strong>${cnt} </strong> 개의 예약을 했어요!
						</c:if>
					</p>
				</div>
				<div class="text-center">
					<label class="form-label me-2" for="form_sort"></label> <select
						class="selectpicker me-3 mb-3 mb-lg-0" name="sort" id="form_sort"
						data-style="btn-selectpicker" title="">
						<option value="sortBy_0">최신순</option>
						<option value="sortBy_1">오래된 순</option>
						<option value="sortBy_2">결제 완료</option>
					</select>
					<!-- 
					<a class="btn btn-outline-secondary" href="#"><i
						class="fa fa-download me-2"></i>엑셀 파일로 내려받기</a>
					-->	
					
				</div>
			</div>
			<div class="list-group shadow mb-5">
				<c:if test="${reservations == null}">
					<h4>조회된 예약내역이 없습니다..</h4>
				</c:if>
				<c:if test="${reservations != null}">
					<c:forEach var="reservations" items="${reservations}" varStatus="status">
						<a class="list-group-item list-group-item-action p-4"
							href="">
							<div class="row">
								<div class="col-lg-4 align-self-center mb-4 mb-lg-0">
									<div class="d-flex align-items-center mb-3">
										<h2 class="h5 mb-0">${campsites[status.index].campsite_name}</h2>
									</div>
									<!--<p class="text-sm text-muted">Double Room</p>-->
									<span class="badge badge-pill p-2 badge-secondary-light">${reservations.startdate}
										- ${reservations.enddate}</span>
								</div>
								<div class="col-lg-8">
									<div class="row">
										<div class="col-6 col-md-4 col-lg-3 py-3 mb-3 mb-lg-0">
											<h6 class="label-heading">요금 타입</h6>
											<p class="text-sm fw-bold">일반</p>
											<h6 class="label-heading">숙박일수</h6>
											<p class="text-sm fw-bold mb-0" id="diffcnt">${diffDays[status.index]} 박</p>
										</div>
										<div class="col-6 col-md-4 col-lg-3 py-3">
											<h6 class="label-heading">인원수</h6>
											<p class="text-sm fw-bold">${reservations.headCount}명</p>
											<h6 class="label-heading">요금</h6>
											<p class="text-sm fw-bold mb-0">${reservations.totalCost2}원</p>
										</div>
										<div class="col-6 col-md-4 col-lg-3 py-3">
											<h6 class="label-heading">체크인 날짜</h6>
											<p class="text-sm fw-bold">${reservations.startdate }</p>
											<h6 class="label-heading">부대시설</h6>
											<p class="text-sm fw-bold mb-0">장작, 체험프로그램, 캠핑장비 대여</p>
										</div>
										<div class="col-12 col-lg-3 align-self-center">
											<span class="text-primary text-sm text-uppercase me-4 me-lg-0"><i
												class="fa fa-check fa-fw me-2"> </i>결제 완료</span>
											<!--확인 완료시 text-primary 클래스, 미확인시 text-muted 클래스 불러옴-->
											<br class="d-none d-lg-block"> <span
												class="text-primary text-sm text-uppercase"><i
												class="fa fa-check fa-fw me-2"> </i>호스트 확인</span>
										</div>
									</div>
								</div>
							</div>
						</a>
						
						</c:forEach>
				</c:if>
			</div>
			<!-- Pagination -->
			<nav aria-label="Page navigation example ">
		<ul class="pagination pagination-template d-flex justify-content-center ">
		
			<li class="page-item"><a class="page-link" href="${ path }/reservation/historyForUser?page=${ pageInfo.prvePage }"> <i class="fa fa-angle-left "></i></a></li>

			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
		
			<c:if test="${ pageInfo.currentPage == status.current}">
				<li class="page-item active"><a class="page-link " href="# "><c:out value="${ status.current }"/></a></li>
				<!-- <button class="page-item active" disabled><c:out value="${ status.current }"/></button>-->
			</c:if>
			<c:if test="${ pageInfo.currentPage != status.current}">
				<li class="page-item "><a class="page-link " href="${ path }/reservation/historyForUser?page=${ status.current }"><c:out value="${ status.current }"/></a></li>
				<!-- <button class="page-item" onclick="location.href='${ path }/boards/freeList?page=${ status.current }'">
					<c:out value="${ status.current }"/>
				</button> -->
			</c:if>
			</c:forEach>
			
			<li class="page-item "><a class="page-link " href="${ path }/reservation/historyForUser?page=${ pageInfo.nextPage }"> <i class="fa fa-angle-right "></i></a></li>
		</ul>
	</nav>
		</div>
	</section>
	<script src="http://code.jquery.com/jquery-latest.js"></script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

