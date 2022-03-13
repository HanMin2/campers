<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="후기게시판 목록" name="title" />
</jsp:include>

<section class="hero-home dark-overlay mb-5">
	<img class="bg-image" src="${path}/resources/img/newphoto/blog-bg.jpg"
		alt="">
	<div class="container py-7">
		<div class="overlay-content text-center text-white">
			<h1 class="display-3 text-serif fw-bold text-shadow mb-0">Review
				Board</h1>
		</div>
	</div>
</section>
<section class="py-6">
	<div class="container" style="margin-top: -5rem;">
		<div class="row">
			<div
				class="col-lg-12 d-flex align-items-center form-group no-divider mb-4 row"
				style="margin-left: 10rem;">
				<form action="${ path }/boards/reviewList" method="get"
					class="row align-items-end ps-6"
					style="margin-left: 10.5rem; width: 70%;">
					<div class="col-lg-2"></div>
					<div
						class="col-lg-4 d-flex align-items-end form-group align-items-end no-divider GmarketSansMedium ps-5"
						style="margin-left: 5rem; padding-left: 5rem; padding-top: 20px;">
						<label><input type="radio" name="searchType"
							value="writer">작성자&nbsp;</label> <label><input
							type="radio" name="searchType" value="title">제목&nbsp;</label> <label><input
							type="radio" name="searchType" value="content">내용</label>
					</div>
					<div
						class="col-lg-3 input-label-absolute input-label-absolute-left"
						style="padding-top: -50px; width: 35%; height: 55px;">
						<label class="label-absolute ms-1" for="searchcollapsed_search ">
							<!-- <i class="fa fa-search"></i> -->
						</label> <input
							class="form-control form-control-sm border-0 shadow-0 bg-gray-200"
							name="searchValue" id="searchcollapsed_search"
							placeholder="Search" aria-label="Search" type="search">
					</div>
				</form>

				<div class="col-lg-2 d-flex align-items-end no-divider"
					style="margin-left: -3rem;">
					<button type="submit" class="btn btn-primary"
						onclick="location.href = '${ path }/boards/reviewWrite'">글쓰기</button>
				</div>

			</div>

		</div>

		<div class="row mb-5 ">
			<!-- blog item-->
			<c:if test="${ reviewList == null }">
				<h2 class="h5 mb-0">조회된 게시글이 없습니다.</h2>
			</c:if>

			<c:if test="${ reviewList != null }">
				<c:forEach var="reviewBoard" items="${ reviewList }">
					<div class="col-lg-4 col-sm-6 mb-4 hover-animate ">
						<div class="card shadow border-0 h-100 ">
							<a href="${path}/boards/reviewView?no=${reviewBoard.no}"><img
								class="img-fluid card-img-top "
								src="<c:url value="${path}/../resources/${savePath2}/${reviewBoard.renameImage}" />" alt="... " 
								style="height: 270px;"/></a>
							<!-- ★★★★메인이미지 넣고싶음 -->
							<div class="card-body ">
								<h5 class="my-2 ">
									<a class="text-dark " href="post.html ">${reviewBoard.title }</a>
								</h5>
								<p class="text-gray-500 text-sm my-3 ">
									<i class="far fa-clock me-2 "></i>${reviewBoard.registDate}
								</p>
								<p class="my-2 text-muted text-sm ">${reviewBoard.writerId }</p>
								<a class="btn btn-link ps-0 "
									href="${path}/boards/reviewView?no=${reviewBoard.no}">더보기<i
									class="fa fa-long-arrow-alt-right ms-2 "></i></a>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>

		</div>
	</div>
	<!-- Pagination -->
	<nav aria-label="Page navigation example ">
		<ul
			class="pagination pagination-template d-flex justify-content-center ">

			<li class="page-item"><a class="page-link"
				href="${ path }/boards/reviewList?page=${ pageInfo.prvePage }">
					<i class="fa fa-angle-left "></i>
			</a></li>

			<c:forEach begin="${ pageInfo.startPage }"
				end="${ pageInfo.endPage }" step="1" varStatus="status">

				<c:if test="${ pageInfo.currentPage == status.current}">
					<li class="page-item active"><a class="page-link " href="# "><c:out
								value="${ status.current }" /></a></li>
				</c:if>
				<c:if test="${ pageInfo.currentPage != status.current}">
					<li class="page-item "><a class="page-link "
						href="${ path }/boards/reviewList?page=${ status.current }"><c:out
								value="${ status.current }" /></a></li>
				</c:if>
			</c:forEach>

			<li class="page-item "><a class="page-link "
				href="${ path }/boards/reviewList?page=${ pageInfo.nextPage }">
					<i class="fa fa-angle-right "></i>
			</a></li>

		</ul>
	</nav>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

