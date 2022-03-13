<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="개인정보 수정" name="title"/>
</jsp:include>



<section class="py-5">
        <div class="container">
            <!-- Breadcrumbs -->
            <h1 class="hero-heading mb-0">비밀번호 &amp; 회원 정보 변경</h1>
            <p class="text-muted mb-5">Manage your Login & security and settings here.</p>
            <div class="row">
                <div class="col-lg-7 mb-5 mb-lg-0">
                    <div class="text-block">
                        <div class="row">
                            <div class="col-sm-9">
                                <h5>비밀번호 변경</h5>
                            </div>
                            <div class="col-sm-3 text-end">
                                <button class="btn btn-link ps-0 text-primary collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#updatePassword" aria-expanded="false" aria-controls="updatePassword">수정</button>
                            </div>
                        </div>
                        <p class="text-sm text-muted">주기적인 비밀번호 변경을 통해 개인정보를 안전하게 보호하세요.</p>
                        <p class="text-sm text-muted">※ 카카오 연동 로그인은 비밀번호 변경이 불가합니다.</p>
                        <form action="${path}/user/updatePwd" method="POST">
                        
                        <div class="collapse" id="updatePassword">
                            <div class="row mt-4">
                                <div class="mb-4 col-12">
                                    <label class="form-label" for="password-current">현재 비밀번호</label>
                                    <input class="form-control" type="password" name="password-current" id="password-current">
                                </div>
                                <div class="mb-4 col-md-6">
                                    <label class="form-label" for="password-new">새 비밀번호</label>
                                    <input class="form-control" type="password" name="password-new" id="password-new">
                                </div>
                                <div class="mb-4 col-md-6">
                                    <label class="form-label" for="password-confirm">새 비밀번호 확인</label>
                                    <input class="form-control" type="password" name="password-confirm" id="password-confirm">
                                </div>
                            </div>
                            <button class="btn btn-outline-success">수정 완료</button>
                        </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-8 col-lg-4 ms-lg-auto">
                    <div class="card border-0 shadow">
                        <div class="card-header bg-warning-light py-4 border-0">
                            <div class="d-flex align-items-center">
                                <div>
                                    <h4 class="h6 subtitle text-sm text-primary"><strong>${loginUser.name}</strong>님의 계정 정보입니다.</h4>
                                </div>
                                <svg class="svg-icon svg-icon svg-icon-light w-3rem h-3rem ms-3 text-primary flex-shrink-0 float-end">
                              <use xlink:href="#identity-1"> </use>
                            </svg>
                            </div>
                        </div>
                        <div class="card-body p-4">
                            <p class="text-muted text-sm card-text">회원정보는 개인정보처리방침에 따라 안전하게 보호되며, 회원님의 명백한 동의 없이 공개 또는 제 3자에게 제공되지 않습니다. </p>
                        </div>
                    </div>
                </div>
            </div>

            <hr>
            <!--<h1 class="hero-heading mb-0">Personal info</h1>
            <p class="text-muted mb-5">Manage your Personal info and settings here.</p>-->
            <div class="row">
                <div class="col-lg-7 mb-5 mb-lg-0">
                    <div class="text-block">
                        <div class="row mb-3">
                            <div class="col-sm-9">
                                <h5>회원 상세 정보 변경</h5>
                            </div>
                            <div class="col-sm-3 text-end">
                                <button class="btn btn-link ps-0 text-primary collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#personalDetails" aria-expanded="false" aria-controls="personalDetails">수정</button>
                            </div>
                        </div>
                        <p class="text-m text-muted"><i class="fa fa-id-card fa-fw me-2"></i>${loginUser.name}<br><i class="fa fa-home fa-fw me-2"></i>${loginUser.address}<br><i class="fa fa-envelope-open fa-fw me-2"></i>${loginUser.email}<span class="mx-2"> | </span> <i class="fa fa-phone fa-fw me-2"></i>${loginUser.tel}</p>
                        <div class="collapse" id="personalDetails">
                            <form action="${path}/user/updateInfo" method="POST">
                                <div class="row pt-4">
                                    <div class="mb-4 col-md-6">
                                        <label class="form-label" for="name">이름</label>
                                        <input class="form-control" type="text" name="updateName" id="updateName" value="${loginUser.name}">
                                    </div>
                                    <div class="mb-4 col-md-6">
                                        <label class="form-label" for="date">주소</label>
                                        <input class="form-control" type="text" name="updateAddress" id="updateAddress" value="${loginUser.address}">
                                    </div>
                                    <div class="mb-4 col-md-6">
                                        <label class="form-label" for="email">이메일</label>
                                        <input class="form-control" type="email" name="updateEmail" id="updateEmail" value="${loginUser.email}">
                                    </div>
                                    <div class="mb-4 col-md-6">
                                        <label class="form-label" for="phone">전화번호</label>
                                        <input class="form-control" type="tel" name="updatePhone" id="updatePhone" value="${loginUser.tel}">
                                    </div>
                                    <input class="hidden" type="hidden" name="userid" id="userid" value="${loginUser.userId}">
                                </div>
                                <button class="btn btn-outline-success mb-4" type="submit">수정 완료</button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>









