<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="자유게시판 목록" name="title" />
</jsp:include>

<section class="hero-home dark-overlay mb-5">
	<img class="bg-image" src="${path}/resources/img/newphoto/free-bg.png"
		alt="">
	<div class="container py-7">
		<div class="overlay-content text-center text-white">
			<h1 class="display-3 text-serif fw-bold text-shadow mb-0">Free Board</h1>
		</div>
	</div>
</section>
<section class="py-3">
	<div class="container">
		<div class="d-flex justify-content-between align-items-end mb-4 ms-3 row">
			<div class="row">
				<div class="col-lg-3 d-flex align-items-end form-group no-divider">
					<select class="selectpicker me-3 mb-3 mb-lg-0 GmarketSansMedium"
						name="sort" id="form_sort" data-style="btn-selectpicker" title="">
						<option value="sortBy_0">최신순</option>
						<option value="sortBy_1">오래된순</option>
					</select>
				</div>
				<div class="col-lg-8 align-items-end form-group no-divider ms-6 row">
					<form action="${ path }/boards/freeList" method="get" class="row align-items-end ps-6" style="padding-top: 25px; margin-left: 5.5rem; height: 80px;">
						<div class="col-lg-4 d-flex align-items-end form-group align-items-end no-divider GmarketSansMedium ps-5" style="padding-top: 20px;">
							<label><input type="radio" name="searchType" value="writer">작성자&nbsp;</label> 
							<label><input type="radio" name="searchType" value="title">제목&nbsp;</label> 
							<label><input type="radio" name="searchType" value="content">내용</label>
						</div>
						<div class="col-lg-4 input-label-absolute input-label-absolute-left" style="padding-top: -50px; width: 40%; height: 55px;">
							<label class="label-absolute ms-1" for="searchcollapsed_search ">
								<!-- <i class="fa fa-search"></i> -->
							</label>
							<input class="form-control form-control-sm border-0 shadow-0 bg-gray-200" name="searchValue" id="searchcollapsed_search" placeholder="Search" aria-label="Search" type="search">
						</div>
					</form>
						
						<div class="col-lg-2 d-flex align-items-end no-divider row" style="margin-left: -13rem; float:right;">
							<button type="submit" class="btn btn-primary" onclick="location.href = '${ path }/boards/freeWrite'">글쓰기</button>
						</div>
				</div>

			</div>
		</div>

		<div class="list-group shadow mb-5">
			<div class="list-group-item list-group-item-action py-0">
				<div class="row">
					
					<div class="col-1 col-lg-1 align-self-center mb-3 mb-lg-0"></div>
					<div class="col-10 ms-4 col-lg-10">
						<div class="row">
							<div class="col-md-5 py-3">
								<p class="text-sm">제목</p>
							</div>
							<div class="col-md-1 text-end py-3">
								<p class="text-sm">첨부파일</p>
							</div>
							<div class="col-md-2 text-end py-3">
								<p class="text-sm">작성자</p>
							</div>
							<div class="col-md-3 text-end py-3">
								<p class="text-sm">작성일</p>
							</div>
							<div class="col-md-1 text-end py-3">
								<p class="text-sm">조회수</p>
							</div>
						</div>
					</div>
				</div>
			</div>


			<!-- 게시글이 없을 때 -->
			<c:if test="${ freeList == null }">
				<div class="p-3 my-5 m-auto">
					<h2 class="h5 mb-0">조회된 게시글이 없습니다.</h2>
				</div>
			</c:if>

			<!-- 게시글이 있을 때 -->
			<c:if test="${ freeList != null }">
				<c:forEach var="freeBoard" items="${ freeList }">
					<div class="list-group-item list-group-item-action p-3">
						<div class="row">
							<div class="col-1 col-lg-1 py-3 ps-5">
								<div class="form-post d-none d-sm-block mt-n1 ps-sm-3">
									<input id="star_message_0" type="checkbox" name="star" checked>
									<label class="star-label" for="star_message_0"></label>
								</div>
							</div>
							
							<div class="col-10 ms-4 col-lg-10">
								<div class="row">
									<div class="col-md-5 py-3">
										<h2 class="h5 mb-0">
											<c:out value="${ freeBoard.title }" />
										</h2>
									</div>
									<div class="col-md-1 text-end py-3">
										<c:if test="${ freeBoard.originalFilename != null }">
											<img src="${path}/resources/img/newphoto/file.png" width="20" height="20"/>
										</c:if>
										<c:if test="${ freeBoard.originalFilename == null }">
											<span> - </span>
										</c:if>
									</div>
									<div class="col-md-2 text-end py-3">
										<p class="text-sm">
											<c:out value="${ freeBoard.writerId }" />
										</p>
									</div>
									<div class="col-md-3 text-end py-3">
										<p class="text-sm">
											<c:out value="${ freeBoard.registDate }" />
										</p>
									</div>
									<div class="col-md-1 text-end py-3">
										<p class="text-sm">
											<c:out value="${ freeBoard.readCount }" />
										</p>
									</div>
									<a class="stretched-link"
										href="${ path }/boards/freeView?no=${ freeBoard.no }"></a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>

	</div>
	<nav aria-label="Page navigation example ">
		<ul class="pagination pagination-template d-flex justify-content-center ">
		
			<li class="page-item"><a class="page-link" href="${ path }/boards/freeList?page=${ pageInfo.prvePage }"> <i class="fa fa-angle-left "></i></a></li>

			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
		
			<c:if test="${ pageInfo.currentPage == status.current}">
				<li class="page-item active"><a class="page-link " href="# "><c:out value="${ status.current }"/></a></li>
				<!-- <button class="page-item active" disabled><c:out value="${ status.current }"/></button>-->
			</c:if>
			<c:if test="${ pageInfo.currentPage != status.current}">
				<li class="page-item "><a class="page-link " href="${ path }/boards/freeList?page=${ status.current }"><c:out value="${ status.current }"/></a></li>
				<!-- <button class="page-item" onclick="location.href='${ path }/boards/freeList?page=${ status.current }'">
					<c:out value="${ status.current }"/>
				</button> -->
			</c:if>
			</c:forEach>
			
			<li class="page-item "><a class="page-link " href="${ path }/boards/freeList?page=${ pageInfo.nextPage }"> <i class="fa fa-angle-right "></i></a></li>
		</ul>
	</nav>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

