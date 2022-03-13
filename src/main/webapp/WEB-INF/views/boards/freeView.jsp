<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="자유게시글 상세" name="title" />
</jsp:include>

<style>
@font-face {
	font-family: 'SUIT-Medium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Medium.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

.SUIT-Medium {
	font-family: 'SUIT-Medium';
}
</style>
<section>
	<div class="container">
		<div class="list-group shadow mb-5">
			<div class="row">
				<div class="col-xl-8 col-lg-10 mx-auto" style="margin-top: 10rem;">
					<h1 class="hero-heading" style="text-align: center;">
						<c:out value="${ freeBoard.title }" />
					</h1>
					<p class="py-3 mb-5 text-muted text-end fw-light">
						작성자&nbsp;&nbsp;<a class="fw-bold" href="#"><c:out
								value="${ freeBoard.writerId }" /></a> <span class="mx-1">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
						<c:out value="${ freeBoard.registDate }" />
						<a class="fw-bold" href="blog.html"></a> <br>
						<br> 조회수&nbsp;&nbsp;<a class="text-muted" href="#"><c:out
								value="${ freeBoard.readCount }" /></a><span class="mx-1">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
						<a class="text-muted" href="#">댓글 <c:out
								value="${ fn:length(replyList) }" /></a>
					</p>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-8 col-lg-10 mx-auto">
					<div class="text-content">
						<h5 class="SUIT-Medium">${ freeBoard.content }</h5>
						<br>
						<br>
						<br>
						<br>
						<p>첨부파일</p>

						<c:if test="${ !empty freeBoard.originalFilename }">
							<a
								href="javascript:fileDownload('${ freeBoard.originalFilename }', '${ freeBoard.renameFilename }')">
								<img src="${ path }/resources/img/newphoto/file.png" width="20"
								height="20" /> <c:out value="${ freeBoard.originalFilename }"></c:out>
							</a>
							<script>
									function fileDownload(oriname, rename) {
										const url = "${ path }/boards/fileDown";
								
										let oName = encodeURIComponent(oriname);
										let rName = encodeURIComponent(rename);
							
										location.assign(url + "?oriname=" + oName + "&rename=" + rName);
									}
								</script>
						</c:if>
						<c:if test="${ empty freeBoard.originalFilename }">
							<span> - </span>
						</c:if>
					</div>

					<br>
					<br>
					<div class="form-group mb-0 justify-content-end">
						<div style="text-align: end;">

							<!-- ★★★★★ 로그인 구현 완료 후 풀기 -->
							<c:if
								test="${ !empty loginUser && (loginUser.userId == freeBoard.writerId) }">
								<button type="button" class="btn btn-primary" name="btnUpdate"
									id="btnUpdate">수정</button>
								<button type="button" class="btn btn-primary" name="btnDelete"
									id="btnDelete">삭제</button>
							</c:if>
							<button type="submit" class="btn btn-primary"
								onclick="location.href='${ path }/boards/freeList'">목록으로</button>

						</div>
					</div>
					<hr>
					<!-- comments-->
					<div class="mt-5">
						<h6 class="text-uppercase text-muted mb-4">
							댓글
							<c:out value="${ fn:length(replyList) }" />
							개
						</h6>
						<!-- comment-->
						<c:if test="${ replyList == null }">
							<h3>첫 댓글을 달아주세요! :)</h3>
						</c:if>
						<c:if test="${ replyList != null }">
							<c:forEach var="reply" items="${ replyList }">
								<div class="d-flex mb-4 row">
									<div class="col-lg-9">
										<h5>${reply.writerId}</h5>
										<p class="text-uppercase text-sm text-muted">
											<i class="far fa-clock"></i>${reply.registDate}
										</p>
										<p class="text-muted">${reply.content}</p>
									</div>

									<div class="col-lg-3">
										<c:if
											test="${ !empty loginUser && ( loginUser.userId == reply.writerId )}">
											<button class="btn btn-outline-secondary" type="button"
												onclick="deleteReply('${reply.no}');">삭제</button>
										</c:if>
									</div>
								</div>
							</c:forEach>
						</c:if>
						<!-- /comment-->

					</div>
					<!-- /comments-->

					<!-- comment form-->
					<div class="mb-5">
					<button class="btn btn-outline-success" type="button"
						data-bs-toggle="collapse" data-bs-target="#leaveComment"
						aria-expanded="false" aria-controls="leaveComment">댓글 남기기</button>
					<div class="collapse" id="leaveComment">
						<div class="mt-4">
							<h5 class="mb-4">댓글 남기기</h5>
							<form class="form" id="comment-form" method="post" action="${ path }/boards/freeReply" method="POST">
								<div class="row">
									<div class="col-md-6">
										<div class="mb-4">
											<label class="form-label" for="writerId">ID<span class="required">*</span></label> 
											<input class="form-control" id="writerId" name="writerId" type="text" value="${loginUser.userId }">
											<input class="form-control" id="boardNo" name="boardNo" type="hidden" value="${freeBoard.no}">
										</div>
									</div>
								</div>
								<div class="mb-4">
									<label class="form-label" for="content">Comment <span
										class="required">*</span></label>
									<textarea class="form-control" id="content" name="content" rows="4"></textarea>
								</div>
								<button class="btn btn-primary" type="submit">
									<i class="far fa-comment"></i> 댓글 등록
								</button>
							</form>
						</div>
					</div>
				</div>
					<!-- /comment form-->
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<script>
	$(document).ready(() => {
		$("#btnUpdate").on("click", (e) => {
			location.href = "${path}/boards/freeUpdate?no=${freeBoard.no}";
		});
		
		$("#btnDelete").on("click", (e) => {
			if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
				location.replace("${path}/boards/freeDelete?no=${ freeBoard.no }");
			}
		});
	});
	
	function deleteReply(replyNo){
		var url = "<%=request.getContextPath()%>/boards/freeReplydel?no=";
		var requestURL = url + replyNo;
		location.replace(requestURL);
	}
	
</script>
