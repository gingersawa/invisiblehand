function paymentReady() {
	var email = '${session.getAttribute("email")}';
	const name = '${session.getAttribute("memberName")}';
	const phoneNum = '<%=session.getAttribute("phoneNum")%>';

	var IMP = window.IMP;
	IMP.init("imp77248336"); // 가맹점 식별코드

	var today = new Date();
	var hours = today.getHours(); // 시
	var minutes = today.getMinutes(); // 분
	var seconds = today.getSeconds(); // 초
	var milliseconds = today.getMilliseconds();
	var makeMerchantUid = hours + minutes + seconds + milliseconds;

	// model.attribute("vo",memberVO);
	function requestPay() {
		IMP.request_pay({
			pg : 'kakaopay.TC0ONETIME', // 결제할 지점 이름(kcp)
			pay_method : 'card', // 결제 방법
			merchant_uid : "IMP" + makeMerchantUid, // 주문번호
			name : '구독(1개월)', // 구매할 상품명
			amount : 100, // 구매할 가격
			buyer_email : "email",// 소비자 이메일
			buyer_name : "name", // 소비자 이름
			buyer_tel : "010-0000-0000" // 소비자 전화번호
		}, function(data) {
			if (data.success) {
				var msg = "결제가 완료되었습니다!";
				msg += '/n주문 번호 : ' + data.merchant_uid;
				msg += '/n결제 금액 : ' + data.paid_amount;
				msg += '/n구매자 이름 : ' + data.buyer_name;
				msg += '/n구매자 이메일 : ' + data.buyer_email;
				msg += '/n구매자 전화번호 : ' + data.buyer_tel;

				console.log("성공!");

				/*
				 * $.ajax({ type : "POST" , url : "/payment/payment_info.do" ,
				 * data : { "orderNum" : data.merchant_uid , "email" :
				 * data.buyer_email , "memberName" : data.buyer_name ,
				 * "phoneNum" : data.buyer_tel} });
				 */

				document.location.href = "/ehr/main/main.do";
			} else {
				var msg = data.error_msg;

				alert(msg);
				location.reload(); // 새로고침
			}
			alert(msg);
		});
	}
}