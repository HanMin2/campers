<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="예약 step3" name="title"/>
</jsp:include>

<div class="progress rounded-0 sticky-top" style="height: 8px; top: 72px;">
        <div class="progress-bar" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
    <section class="py-5">
    <form action="${path}/reservation/detail">
		<input type="hidden" name ="campsite_index" id="campsite_index" value="${campsite.campsite_index}"/>
		<input type="hidden" name ="headCount" id="headCount" value="${headCount}"/>
        <input type="hidden" name ="bookingDate" id="bookingDate" value="${bookingDate}"/>
        
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <p class="subtitle text-primary">Book your holiday home</p>
                    <h1 class="h2 mb-5"> 예약 완료 <span class="text-muted float-end">complete!</span> </h1>
                    <div class="text-block text-md-center py-4">
                        <p class="text-muted mb-5"></p>
                        <p class="text-center mb-5">
                            <button class="btn btn-primary mx-2 mb-2" type="submit"> <i class="far fa-file me-2"></i>예약 내역</button><a class="btn btn-outline-muted mb-2" href="${path}">홈화면으로</a></p>
                        <p class="mb-5 text-center"><img class="img-fluid" src="${path}/resources/img/newphoto/booking_camping.png" alt="" style="width: 400px;"></p>
                    </div>
                </div>
                <div class="col-lg-5 ps-xl-5">
                    <div class="card border-0 shadow">
                        <div class="card-body p-4">
                            <div class="text-block pb-3">
                                <div class="d-flex align-items-center">
                                    <div>
                                        <h6> <a class="text-reset" href="detail-rooms.html">${campsite.campsite_name}</a></h6>
                                        <p class="text-muted text-sm mb-0">${campsite.addr1}</p>
                                        <div class="mt-n1"><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-primary"></i><i class="fa fa-xs fa-star text-gray-200"></i>
                                        </div>
                                    </div>
                                    <a class="flex-shrink-0" href="detail-rooms.html"><img class="ms-3 rounded" src="${campsite.first_image}" alt="" width="100"></a>
                                </div>
                            </div>
                            <div class="text-block py-3">
                                <ul class="list-unstyled mb-0">
                                    <li class="mb-3"><i class="fas fa-users fa-fw text-muted me-2"></i>${headCount} 명</li>
                                    <li class="mb-0"><i class="far fa-calendar fa-fw text-muted me-2"></i><a class="text-muted mb-0" id="startdate"></a><i class="fas fa-arrow-right fa-fw text-muted mx-3"></i><a class="text-muted mb-0" id="enddate"></a></li>
                                </ul>
                            </div>
                            <div class="text-block pt-3 pb-0">
                                <table class="w-100">
                                    <tbody>
                                        <tr>
                                            <th class="fw-normal py-2" id="cost">₩<fmt:formatNumber value="${campsite.cost}" pattern="#,###" /> <a id="diffcnt"></a></th>
                                            <td class="text-end py-2" id ="totalCost">60,000원</td>
                                        </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr class="border-top">
                                            <th class="pt-3">총 금액</th>
                                            <td class="fw-bold text-end pt-3" id="totalCost2">60,000원</td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                        <div class="card-footer bg-warning-light py-4 border-0">
                            <div class="d-flex align-items-center">
                                <div>
                                    <h6 class="text-primary">주의사항 – 예약취소</h6>
                                    <p class="text-sm text-primary opacity-8 mb-0">48시간 이전에 취소시 전액 환불 <a href="#" class="text-reset ms-3">더 보기</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </form>
    </section>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script>
	//웹을 시작하면서 레디하는 함수
	$(document).ready(function(){
		var a = "${bookingDate}"
		var b = a.split(" ")
		var c1 = b[0]
		var c2 = b[2]
		var d1 = getDate(c1)
		var d2 = getDate(c2)
		
		var e = c1.split("-")
		var dat1 = new Date(e[0], e[1], e[2]);
		var f = e[1]
		var g = e[2]
		var p = $("#check-in-dd").text(g);
		
		var e2 = c2.split("-")
		var dat2 = new Date(e2[0], e2[1], e2[2]);
		var f2 = e2[1]
		var g2 = e2[2]
		var p = $("#check-out-dd").text(g2);
		
		if(f[0] == "1"){
			if(g[0] == "1"){
				var p = $("#startdate").text(e[0]+"년"+" "+f+"월"+g+"일");
			}else{
				var p = $("#startdate").text(e[0]+"년"+" "+f+"월"+g[1]+"일");
			}
		}else if(f[0] != "1"){
			if(g[0] == "1"){
				var p = $("#startdate").text(e[0]+"년"+" "+f[1]+"월"+g+"일");
			}else{
				var p = $("#startdate").text(e[0]+"년"+" "+f[1]+"월"+g[1]+"일");
			}
		}
		if(f2[0] == "1"){
			if(g2[0] == "1"){
				var p = $("#enddate").text(e2[0]+"년"+" "+f2+"월"+g2+"일");
			}else{
				var p = $("#enddate").text(e2[0]+"년"+" "+f2+"월"+g2[1]+"일");
			}
		}else if(f2[0] != "1"){
			if(g2[0] == "1"){
				var p = $("#enddate").text(e2[0]+"년"+" "+f2[1]+"월"+g2+"일");
			}else{
				var p = $("#enddate").text(e2[0]+"년"+" "+f2[1]+"월"+g2[1]+"일");
			}
		}
		
		var diff = dat2- dat1;
		var currDay = 24 * 60 * 60 * 1000;
		var diffCount = parseInt(diff/currDay);
		var p = $("#diffcnt").text("x"+" "+diffCount+"박");
		
		
		var s = "${campsite.cost}"
		var x = parseInt(s);
		var tc = parseInt(x*diffCount)
		var tc = tc.toString();
		var tc = addComma(tc);
		var p = $("#totalCost").text(tc+"원");
		var p2 = $("#totalCost2").text(tc+"원");
		

	})
	
	function getDate(abc){ 
		//날짜문자열 형식은 자유로운 편 
		var week = ['일', '월', '화', '수', '목', '금', '토']; 
		var dayOfWeek = week[new Date(abc).getDay()]; 
		return dayOfWeek; 
		}
	
	function addComma(value){
        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        return value; 
    }
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	