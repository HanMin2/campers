<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="FAQ" name="title" />
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

a {
 font-family: 'SUIT-Medium';
}
</style>

<!-- Hero Section-->
<section class="hero py-lg-2 pt-lg-6">
	<div class="container position-relative">
		<h1 class="hero-heading">FAQ</h1>
		<div class="row">
			<div class="col-xl-8 mx-auto">
				<!-- <form>
                        <p class="text-muted mb-4">Non adipisicing nisi commodo et consectetur est veniam pariatur. Fugiat occaecat nisi incididunt nostrud anim culpa eiusmod excepteur duis elit elit.</p>
                        <div class="input-group"><input class="form-control" type="text" placeholder="Search Something ... "><button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button></div>
                    </form> -->
			</div>
		</div>
	</div>
</section>
<section class="py-5">
	<div class="container">
		<div class="row mb-5">
			<div class="col-md-8">
				<p class="subtitle text-secondary">어떤 도움이 필요하신가요?</p>
				<h2>자주 묻는 질문</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 mb-4">
				<h3 class="h5 text-dark d-flex align-items-center mb-4">
					<a class="text-reset" href="knowledge-base-topic.html"><span
						class="badge badge-secondary-light badge-pill py-1 me-1">1</span>회원
						및 이용</a>
				</h3>
				<ul class="list-unstyled ms-3 text-sm">
					<li class="mb-2">
						<button onclick="test('#test_obj1')" style="background: none;">
							<a class="text-muted">Q 회원탈퇴는 어떻게 하나요?</a>
						</button>
						<div id="test_obj1" style="display: none;">
							<a style="background: #faf8f5;" class="">캠퍼스 회원 탈퇴의 경우 로그인이 되어있으신 상태에서
								가능합니다.<br>
							<br> MY > 내 정보관리 > 회원 탈퇴 경로로 탈퇴가 가능합니다.<br>
							<br> * 회원 탈퇴 시 회원 일련번호에 입력된 모든 정보들이 삭제됩니다.<br> * 추후
								동일번호로 재가입하셔도 기존 예약 내역 및 적립금 등은 유지되지 않습니다.<br>
							<br>
							</a>
						</div>
					</li>
					<li class="mb-2">
						<button onclick="test('#test_obj2')" style="background: none;">
							<a class="text-muted">Q 비밀번호 변경은 어떻게 하나요?</a>
						</button>
						<div id="test_obj2" style="display: none;">
							<a class="" style="background: #faf8f5;">비밀번호 변경은 캠퍼스 로그인하신 상태에서
								가능합니다.<br>
							<br> 캠퍼스 메인 페이지 상단 MY > 내 정보 관리 > 비밀번호 변경이 가능합니다.<br>
							<br>
							</a>
						</div>
					</li>
					<li class="mb-2">
						<button onclick="test('#test_obj3')" style="background: none;">
							<a class="text-muted">Q 비밀번호를 잊어버렸을 때는 어떻게 하나요?</a>
						</button>
						<div id="test_obj3" style="display: none;">
							<a class="" style="background: #faf8f5;"> 가입하신 닉네임과 휴대폰 번호를 알고 계실 경우
								임시 비밀번호 발급이 가능합니다. <br>
							<br> [닉네임을 알고 계실 경우]<br> 땡큐캠핑 가입하신 닉네임을 알고 계실 경우 땡큐캠핑
								메인 페이지에서 상단<br>
							<br> MY > 로그인 및 회원가입하기 > 비밀번호 찾기 > 휴대폰 번호 및 닉네임을 입력하시면 해당
								휴대폰 번호로 임시 비밀번호가 발송됩니다.<br> 임시 비밀번호로 로그인하신 후 비밀번호를 변경하시면
								됩니다.<br>
							<br> *비밀번호 찾기 진행시 기존 비밀번호로는 로그인하실 수 없습니다.<br>
							<br> [닉네임을 모르고 계실 경우]<br> 닉네임을 모르고 계실 경우 핸드폰 인증을 통해
								닉네임을 찾으신 후 위 내용을 참조하여 비밀번호 찾기를 진행하시면 됩니다.<br>
							<br>
							</a>
						</div>
					</li>
					<li class="mb-2">
						<button onclick="test('#test_obj4')"
							style="background: none; text-align: left;">
							<a class="text-muted">Q 휴대폰 번호가 변경되었는데 기존 예약 정보를 옮길 수 있나요?</a>
						</button>
						<div id="test_obj4" style="display: none;">
							<a class="" style="background: #faf8f5;"> 휴대폰 번호가 변경되셨을 경우, 캠퍼스 메인 페이지
								상단<br>
							<br> MY > 내 정보관리 > 휴대폰 번호에서 오른편 변경을 통해 가능합니다.<br>
							<br> 휴대폰 번호 변경 시 기존 혜택 및 예약 내역은 변경된 핸드폰 번호로 자동 연동됩니다.<br>
							<br>
							</a>
						</div>
					</li>
				</ul>
			</div>
			<div class="col-lg-4 mb-4">
				<h3 class="h5 text-dark d-flex align-items-center mb-4">
					<a class="text-reset" href="knowledge-base-topic.html"><span
						class="badge badge-secondary-light badge-pill py-1 me-1">2</span>예약</a>
				</h3>
				<ul class="list-unstyled ms-3 text-sm">
					<li class="mb-2">
						<button onclick="test('#test_obj5')" style="background: none;">
							<a class="text-muted ">Q 비회원으로 예약한 정보를 확인할 수 있나요?</a>
						</button>
						<div id="test_obj5" style="display: none;">
							<a style="background: #faf8f5;"> 비회원 예약 정보 조회는 캠퍼스캠핑 메인 페이지
								상단<br>
							<br> MY > 비회원 예약 조회에서 예약번호 / 휴대폰 번호를 기입하시면 확인 가능합니다.<br>
							<br> 예약번호는 캠퍼스 상세예약 페이지에서 확인 가능합니다.<br>
							<br> *예약번호 분실 시 02-6000-2288로 연락 부탁드립니다.<br>
							<br>
							</a>
						</div>
					</li>
					<li class="mb-2">
						<button onclick="test('#test_obj6')" style="background: none;">
							<a class="text-muted ">Q 취소된 예약 건에 대한 복구가 가능한가요?</a>
						</button>
						<div id="test_obj6" style="display: none;">
							<a style="background: #faf8f5;"> 캠핑장 예약 건에 대해 동일 자리에 타 예약 건이
								잡히지 않았다면 예약 건 복구는 가능합니다.<br>
							<br> 해당 캠핑장으로 전화하셔서 예약 건 복구 요청을 하시면 됩니다.<br>
							<br>
							</a>
						</div>
					</li>
					<li class="mb-2">
						<button onclick="test('#test_obj7')" style="background: none;">
							<a class="text-muted ">Q 입금을 했는데 자동 취소가 되었어요.</a>
						</button>
						<div id="test_obj7" style="display: none;">
							<a style="background: #faf8f5;"> 캠핑장 예약 건에 대해 미입금 자동 취소가 되었을
								경우<br> 예약하신 캠핑장으로 직접 연락하여 확인 요청을 하시면 됩니다.<br>
							<br> 캠핑장으로 이체하신 후 캠핑장 사장님께서 입금내역 확인 후<br> 예약 확정처리를 하는
								캠핑장으로 종종 캠핑장에서 늦게 확인할 수 있습니다.<br>
							<br> 만일 미입금 자동 취소가 된 후 캠핑장 사장님과 연락이 되지 않아 02-6000-2288번으로 전화
								주시면 해당 자리에 다른 분이 예약하지 못하게 예약 건 복구를 진행해 드립니다. <br> (단, 동일
								자리에 다른 예약 건이 잡혔을 경우 캠퍼스에서 예약 복구는 불가능합니다.)<br>
							<br>
							</a>
						</div>
					</li>
					<li class="mb-2">
						<button onclick="test('#test_obj8')" style="background: none;">
							<a class="text-muted ">Q 캠핑장 예약 후 입금을 했는데 확정처리가 안돼요.</a>
						</button>
						<div id="test_obj8" style="display: none;">
							<a style="background: #faf8f5;"> 캠핑장 예약 시 ‘업장 계좌’로 입금하셨을 경우
								해당 캠핑장 사장님이 입금 사실을 확인 후 예약 확정처리를 해주셔야 합니다. <br>즉, 아직 사장님께서
								입금내역을 확인하지 못하신 상태 입니다.<br>
							<br> 빠른 확정처리를 원하시면 해당 캠핑장으로 전화하셔서 예약 확정 처리를 요청하시기 바랍니다.<br>
							<br> (캠핑장 직접 예약건의 경우 캠퍼스에서 확인 및 확정처리가 불가능 합니다.)<br>
							<br>
							</a>
						</div>
					</li>
				</ul>
			</div>
			<div class="col-lg-4 mb-4">
				<h3 class="h5 text-dark d-flex align-items-center mb-4">
					<a class="text-reset" href="knowledge-base-topic.html"><span
						class="badge badge-secondary-light badge-pill py-1 me-1">3</span>변경</a>
				</h3>
				<ul class="list-unstyled ms-3 text-sm">
					<li class="mb-2">
						<button onclick="test('#test_obj9')" style="background: none;">
							<a class="text-muted ">Q 예약자 정보를 잘못 입력했는데 변경은 어디서 해야 되나요?</a>
						</button>
						<div id="test_obj9" style="display: none;">
							<a style="background: #faf8f5;"> 예약자 정보의 경우 예약 확정처리 후 본인이 직접
								변경할 수 없습니다.<br>
							<br> 예약자 휴대폰 번호 또는 이름, 차량번호를 잘못 기입하셨을 경우 해당 캠핑장으로 전화하셔서 예약자
								정보 변경 요청을 하시기 바랍니다.<br>
							<br> * 휴대폰 번호를 잘못 기입하셨을 경우 해당 캠핑장 예약 내역이 확인되지 않으실 수 있습니다.<br>
								예약일과 예약사이트 예약자명을 말씀하신 후 예약자 정보를 변경하시기 바랍니다.<br>
							<br>
							</a>
						</div>
					</li>
					<li class="mb-2">
						<button onclick="test('#test_obj10')" style="background: none;">
							<a class="text-muted ">Q 캠핑장 자리를 변경하고 싶어요.</a>
						</button>
						<div id="test_obj10" style="display: none;">
							<a style="background: #faf8f5;"> 캠핑장 예약을 하신 후 사이트 변경의 경우 어플
								내에서 본인이 하실 수 없습니다.<br>
							<br> 캠핑장 예약 정보는 해당 캠핑장에서 관리함으로 부득이하게 사이트 변경을 원하실 경우<br>
							<br> 해당 캠핑장에 연락하셔서 변경 요청하시면 됩니다.<br>
							<br>
							</a>
						</div>
					</li>
					<li class="mb-2">
						<button onclick="test('#test_obj11')" style="background: none;">
							<a class="text-muted ">Q 캠핑장 예약 일을 변경하고 싶어요.</a>
						</button>
						<div id="test_obj11" style="display: none;">
							<a style="background: #faf8f5;"> 캠핑장 예약을 하신 후 완료 처리된 예약 건에
								대해서는 예약일 변경이 불가능합니다.<br>
							<br> 완료 처리된 예약 건의 경우 해당 캠핑장에서 캠핑장 예약일 등을 관리함으로<br>
							<br> 해당 캠핑장에 연락하셔서 변경 요청하시기 바랍니다.<br>
							<br>
							</a>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 mb-4">
				<h3 class="h5 text-dark d-flex align-items-center mb-4">
					<a class="text-reset" href="#"><span
						class="badge badge-secondary-light badge-pill py-1 me-1">4</span>취소
						및 환불</a>
				</h3>
				<ul class="list-unstyled ms-3 text-sm">
					<li class="mb-2">
						<button onclick="test('#test_obj12')" style="background: none;">
							<a class="text-muted ">Q 예약을 취소하고 싶어요.</a>
						</button>
						<div id="test_obj12" style="display: none;">
							<a style="background: #faf8f5;"> 예약 취소는 캠퍼스 홈페이지를 통해 가능합니다.<br>
							<br> [캠퍼스 회원 예약취소]<br> 캠퍼스 메인 페이지 상단 MY > 캠핑장 > 예약 완료 >
								예약 건 선택 후 하단 예약 취소를 진행하시면 됩니다. <br>
							<br> [비회원 예약취소]<br> 예약 신청 시 받으신 메시지 중간에 '예약확인/취소하기' 링크가
								있습니다.<br> 클릭하신 후 신청 메시지 상단에 있는 예약번호 7자리와 예약자명을 입력하신 후 예약취소
								처리가 가능합니다.<br>
							<br> * 신용카드 결제건에 경우 공제금액이 있으면 본인이 직접 예약취소가 불가능할 수 있습니다.<br>
								* 혹 부분 취소 불가능 오류가 뜨면 02-6000-2288번으로 연락 부탁드립니다.<br>
							<br>
							</a>
						</div>
					</li>
					<li class="mb-2">
						<button onclick="test('#test_obj13')"
							style="background: none; text-align: left;">
							<a class="text-muted ">Q 예약을 취소하고 싶은데 예약번호를 분실해서 조회를 못해요.</a>
						</button>
						<div id="test_obj13" style="display: none;">
							<a style="background: #faf8f5;"> 캠퍼스의 모든 예약 건은 예약하신 핸드폰 번호에
								귀속됩니다.<br>
							<br> 예약하셨던 핸드폰 번호로 캠퍼스 회원가입을 하신 후<br> 캠퍼스 캠핑 메인 페이지 상단
								MY > 캠핑장 > 예약 완료에서 해당 예약건 취소가 가능합니다.<br>
							<br> * 회원가입이 불편하신 고객님의 경우 해당 캠핑장으로 전화하셔서 취소 요청하시기 바랍니다.<br>
							<br>
							</a>
						</div>
					</li>
					<li class="mb-2">
						<button onclick="test('#test_obj14')" style="background: none;">
							<a class="text-muted ">Q 예약 취소 후 환불은 언제 되나요?</a>
						</button>
						<div id="test_obj14" style="display: none;">
							<a style="background: #faf8f5;"> 캠핑장 환불은 예약 건 결제 방법에 따라
								상이합니다.<br>
							<br> [업장계좌]<br> ‘OO 캠핑장’ 또는 일반인 이름으로 입금하신 예약 건의 경우 예약하신
								캠핑장에서 직접 환불 됩니다.<br> 캠핑장으로 문의하시면 됩니다. (취소 관련 알림톡에 취소 일자가
								기재되어 있습니다.)<br>
							<br> [무통장입금 : 가상 계좌]<br> 무통장입금(예금주/(주) 하비비 커뮤니케이션) 결제
								예약 건의 경우 예약취소일 다음 주 첫 영업일(월요일)에 일괄 환불 됩니다.<br> 무통장 입금의 경우
								계좌 발행 수수료 280원이 공제됩니다.<br>
							<br> [카드 결제]<br> 예약 취소 시 카드 취소가 바로 진행됩니다. 카드사에 따라 영업일
								기준 2~5일 소요될 수 있습니다.<br>
							<br>
							</a>
						</div>
					</li>
					<li class="mb-2">
						<button onclick="test('#test_obj15')" style="background: none;">
							<a class="text-muted ">Q 환불 예정일이 지났는데 환불은 언제 되나요?</a>
						</button>
						<div id="test_obj15" style="display: none;">
							<a style="background: #faf8f5;"> [무통장입금 : 가상 계좌]<br>
								㈜하비비 커뮤니케이션으로 입금하셨을 경우 취소일 다음 주 첫 영업일(월요일)에 환불 처리됩니다.<br>
							<br> 혹 환불 처리가 안되셨다면 02-6000-2288번으로 연락 부탁드립니다.<br>
							<br> [업장 계좌]<br> ‘OO 캠핑장’ 또는 일반인 이름으로 입금하신 예약 건의 경우
								예약하신 캠핑장에서 직접 환불 됩니다. 캠핑장으로 문의하시면 됩니다.<br>
							<br>
							</a>
						</div>
					</li>
				</ul>
			</div>
			<div class="col-lg-4 mb-4">
				<h3 class="h5 text-dark d-flex align-items-center mb-4">
					<a class="text-reset" href="#"><span
						class="badge badge-secondary-light badge-pill py-1 me-1">5</span>결제</a>
				</h3>
				<ul class="list-unstyled ms-3 text-sm">
					<li class="mb-2"><script
							src="http://code.jquery.com/jquery-latest.min.js"></script>
						<style>
							button {
								border: hidden
							}
							</style>

						<button onclick="test('#test_obj18')" style="background: none;">
							<a class="text-muted ">Q 카드 결제 오류로 결제가 안돼요.</a>
						</button>
						<div id="test_obj18" style="display: none;">
							<a style="background: #faf8f5;"> 캠퍼스 어플을 이용해서 예약을 진행해 주셨을 경우
								핸드폰 기종별 보안정책 업데이트에 따라 카드 결제가 종종 안되는 경우가 있습니다.<br>
							<br> 위 경우에는 어플 업데이트 및 핸드폰 소프트웨어 업데이트를 진행해 보시고, 그 후에도 안되시는 경우
								아래 방법에 따라 진행해 보시기 바랍니다.<br>
							<br> 모바일 웹 사이트 (네이버 OR 크롬)에서 캠퍼스 검색하셔서 웹 사이트에서 로그인 진행 후 결제를
								진행해 보시기 바랍니다. <br>
							<br> 위 방법으로도 해결되지 않으시면 02-6000-2288번으로 연락 부탁드립니다.<br>
							<br>
							</a>
						</div></li>

						<li class="mb-2">
							<li class="mb-2">
                                <button onclick="test('#test_obj16')" style="background: none;">
									<a class="text-muted ">Q 현금영수증은 어떻게 발급받아야 하나요?</a>
								</button>
                                <div id="test_obj16"
							style="display: none;">
                                    <a style="background: #faf8f5;">
                                        현금 영수증은 현금으로 이체하셨을 경우 발행이 가능합니다.<br><br>
                                        [무통장 입금]<br>
                                        ㈜하비비커뮤니케이션으로 입금하셨을 경우 예약 시 현금영수증 발행 여부를 체크합니다.<br><br>
                                        만일 이때 현금영수증 발행 요청을 하지 않으셨고, 사 후 요청 시 02-6000-2288번으로 연락 부탁드립니다.<br><br>
                                        [업장계좌]<br>
                                        결제 시 캠핑장으로 입금하셨을 경우 <br>[위 ㈜하비비커뮤니케이션으로 입금하지 않으신 모든 예약 건]<br> 해당 캠핑장 쪽으로 현금영수증 발행 요청을 하시면 됩니다.<br><br> </a>
                                </div>
                            </li>

                            <button onclick="test('#test_obj19')" style="background: none;">
								<a class="text-muted ">Q 영수증 조회(발급)은 어떻게 해야 하나요?</a>
							</button>

                            <div id="test_obj19" style="display: none ">
                                <a style="background: #faf8f5;">
                                    영수증 조회는 결제방법에 따라 확인 여부가 상이합니다.<br><br>
                                    카드 결제 및 무통장 입금은 아래 방법에 따라 영수증 조회를 하시면 되며, 업장계좌로 이체하신 경우 해당 캠핑장에 문의하시면 됩니다.<br><br>
                                    MY > 캠핑장 > 방문 완료 > 해당 캠핑장 클릭 > 결제 정보 [영수증 보기]를 통해 가능합니다.<br><br> </a>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="col-lg-4 mb-4"></div>
            </div>
        </div>
    </section>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<script>
        function test(data) {
            $(data).slideToggle();

       }
</script>