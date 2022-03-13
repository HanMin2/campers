<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="문의내역 리스트" name="title" />
</jsp:include>

<section class="py-5">
	<div class="container">
		<div class="d-flex justify-content-between align-items-center mb-5">
			<h1 class="hero-heading mb-0">1:1 문의 내역</h1>
		</div>

		<div class="d-flex justify-content-between align-items-end mb-4">
			<div>
				<label class="form-label me-2" for="form_sort"></label> <select
					class="selectpicker me-3 mb-3 mb-lg-0" name="sort" id="form_sort"
					data-style="btn-selectpicker" title="">
					<option value="sortBy_0">최신순</option>
					<option value="sortBy_1">오래된순</option>
				</select>
			</div>
		</div>

		<c:if test="${ list == null }">
			<h4>문의 내역이 없습니다.</h4>
		</c:if>

		<div class="list-group shadow mb-5">
			<c:if test="${ list != null }">
				<c:forEach var="inquiry" items="${ list }">

					<div class="list-group-item list-group-item-action p-4">
						<div class="row">
							<div
								class="col-2 col-lg-1 align-self-lg-center py-3 d-flex align-items-lg-center z-index-10">
								<div class="form-check">
									<input class="form-check-input" id="select_message_0"
										type="checkbox"> <label class="form-check-label"
										for="select_message_0"> </label>
								</div>
							</div>
							<div class="col-9 col-lg-4 align-self-center mb-3 mb-lg-0">
								<div class="d-flex align-items-center mb-1 mb-lg-3">
									<h2 class="h5 mb-0">
										<c:out value="${inquiry.receiverName}" />
									</h2>
								</div>

							</div>
							<div class="col-10 ms-auto col-lg-7">
								<div class="row">
									<div class="col-md-8 py-3">
										<p class="text-sm mb-0">
											<c:out value="${inquiry.content}" />
										</p>
									</div>
									<div class="col-md-4 text-end py-3">

										<input type="hidden" name="send" id="send" value="${inquiry.sender}" /> 
										<input type="hidden" name="receive" id="receive" value="${inquiry.receiver}" /> 
										<span class="badge badge-pill p-2 badge-secondary-light"><c:out
												value="${inquiry.registDate}" /></span> <a class="stretched-link"
											href="${path}/inquiry/listDetail?sender=${inquiry.sender}&receiver=${inquiry.receiver}"></a>
									</div>
									
									<a class="stretched-link" href="${path}/inquiry/listDetail?sender=${inquiry.sender}&receiver=${inquiry.receiver}"></a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

