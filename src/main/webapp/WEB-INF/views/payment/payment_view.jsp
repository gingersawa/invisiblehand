<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/payment.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />
<!-- 포트원 결제 -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- jQuery -->
<script src="../resources/js/jquery-3.7.0.js"></script>
<!-- iamport.payment.js -->
<div class="h60px"></div>
<div class="container-1400 min-100vh con-main">
	<div class="wrap-1000">

		<div class="wrap_demo" id="kakaoWrap">

			<div id="kakaoHead">
				<img src="../resources/image/kakaopay_icon.jpg" alt="kakaopay_logo"
					width="100px" />
			</div>

			<div id="kakaoContent">
				<div id="paymentBtn">
					<span>더 많은 정보를 원한다면</span><br>
				</div>
				<button class="btn-hover color-11" id="payBtn" onclick="paymentReady()">결제하기</button>
			</div>
			<!-- *** kakaoContent *** -->

		</div>
		<!-- *** kakaoWrap *** -->

	</div>
</div>
<script>
function paymentReady() {
    let name = '${sessionScope.member.memberName}';
    let email = '${sessionScope.member.email}';
    let phoneNum = '${sessionScope.member.phoneNumber}';

    let today = new Date();
    let hours = today.getHours(); // 시
    let minutes = today.getMinutes(); // 분
    let seconds = today.getSeconds(); // 초
    let milliseconds = today.getMilliseconds();
    let makeMerchantUid = hours + minutes + seconds + milliseconds;

    let IMP = window.IMP;
		IMP.init("imp77248336"); // 가맹점 식별코드
		IMP.request_pay({
			pg : 'kakaopay.TC0ONETIME', // 결제할 지점 이름(kcp)
			pay_method : 'card', // 결제 방법
			merchant_uid : "IMP" + makeMerchantUid, // 주문번호
			name : '구독(1개월)', // 구매할 상품명
			amount : 100, // 구매할 가격
			buyer_email : email,// 소비자 이메일
			buyer_name : name, // 소비자 이름
			buyer_tel : phoneNum // 소비자 전화번호
		}, function(data) {
			if (data.success) {
				alert("결제가 완료되었습니다!");
				console.log("성공!");
				
				$.ajax({
					type : "POST"
					, url : "/ehr/payment/payment_info.do"
					, async: true
					, dataType: "json"
					, data : {
						  "merchantUid" : data.merchant_uid
						  , "email" : data.buyer_email
						  , "name" : data.name
						  , "amount" : data.paid_amount
						  , "buyerEmail" : data.buyer_email
						  , "buyerName" : data.buyer_name
						  , "buyerTel" : data.buyer_tel
					}, success: function(data) {
		          console.log("success data:" + data);
          }, error: function(data) {
        	    console.log("error:" + data);
        	    console.log(data);
          }
	      });

				document.location.href = "/ehr/main/main.do";
			} else {
				let msg = data.error_msg;

				alert(msg);
				location.reload(); // 새로고침
			}
		});
	}
</script>