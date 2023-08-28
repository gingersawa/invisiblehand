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
<script src="../resources/js/common/payment.js"></script>
<!-- iamport.payment.js -->
<div class="h60px"></div>
<div class="container-1400 min-100vh con-main">
  <div class="wrap-1000">

    <div class="wrap_demo" id="kakaoWrap">

      <div id="kakaoContent">
				<c:if test="${empty paymentInfo}">
		      <span>구독 정보가 없습니다.</span>
				</c:if>
				<c:if test="${not empty paymentInfo}">
			    <div>session으로 정보 꺼내기</div><br>
			    <div>로그인된 아이디 : ${sessionScope.member.memberId}</div><br>
			    <div>로그인된 이름 : ${sessionScope.member.memberName}</div><br>
			    <div>로그인된 닉네임 : ${sessionScope.member.nickName}</div><br>
			    <div>로그인된 이메일 : ${sessionScope.member.email}</div><br>
			    <div>로그인된 핸드폰 번호 : ${sessionScope.member.phoneNumber}</div><br>
			    <div>paymentInfo model에 담아 출력</div><br>
			    <div>로그인된 유저의 seq : ${paymentInfo.paymentinfoseq}</div>
			    <div>로그인된 유저의 주문번호 : ${paymentInfo.merchantUid}</div>
			    <div>로그인된 유저가 결제한 상품 이름 : ${paymentInfo.name}</div>
			    <div>로그인된 유저가 결제한 금액 : ${paymentInfo.amount}</div>
			    <div>로그인된 유저의 이메일 : ${paymentInfo.buyerEmail}</div>
			    <div>로그인된 유저의 이름 : ${paymentInfo.buyerName}</div>
			    <div>로그인된 유저의 번호 : ${paymentInfo.buyerTel}</div>
				</c:if>
      </div>
      <!-- *** kakaoContent *** -->

    </div>
    <!-- *** kakaoWrap *** -->

  </div>
</div>