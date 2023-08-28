<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="image/favicon-32x32.png">
<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/mypage2.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />
<title>마이페이지 입니다</title>

</head>
<body>
	<!-- *---container Start---* -->

	<div class="h60px"></div>
	<div class="container-1400 min-100vh con-login">
		<div class="mypage-wrap">
			<div class="box-area">

				<div class="form-h3">
					<div class="line1px"></div>
					<div class="line3px"></div>
					<h3>결제 및 구독 수정</h3>
					<div class="line3px"></div>
					<div class="line1px"></div>
				</div>
					
					<div class="info">
				        <label>결제 내역:</label>
				        <ul id="paymentList">
				            <li>2023-06-01: 월 정기 구독 결제</li>
				            <li>2023-07-01: 월 정기 구독 결제</li>
				            <li>2023-08-01: 월 정기 구독 결제</li>
				        </ul>
				    </div>
				  
					<!-- 결제 취소 버튼 -->
				    <button id="cancelPaymentBtn" onclick="showConfirmPopup('결제')">결제 취소</button>
				    
				    <div class="info">
				        <label>구독 기간:</label>
				        <span id="subscriptionStart">2023-07-01</span> ~ <span id="subscriptionEnd">2023-12-31</span>
				    </div>
				
				    <div class="info">
				        <label>구독 끝나는 시기:</label>
				        <span id="subscriptionExpire">2023-12-31</span>
				    </div>
				
				    <!-- 구독 취소 버튼 -->
				    <button id="cancelSubscriptionBtn" onclick="showConfirmPopup('구독')">구독 취소</button>
				
				    <!-- 확인 팝업 모달 -->
				    <div id="confirmModal" style="display: none;">
				        <h2 id="confirmTitle"></h2>
				        <p id="confirmContent"></p>
				        <button onclick="showPasswordInput()">확인</button>
				        <button onclick="hideConfirmPopup()">취소</button>
				    </div>
				
				    <!-- 비밀번호 입력 모달 -->
				    <div id="passwordModal" style="display: none;">
				        <h2>비밀번호 입력</h2>
				        <input type="password" id="passwordInput" placeholder="비밀번호를 입력하세요">
				        <button onclick="completeCancellation()">확인</button>
				        <button onclick="hidePasswordInput()">취소</button>
				    </div>
				
				    <!-- 취소 완료 모달 -->
				    <div id="completedModal" style="display: none;">
				        <h2 id="completedTitle"></h2>
				        <button onclick="hideCompletedPopup()">확인</button>
				    </div>
				
				    <script>
				        function showConfirmPopup(type) {
				            var content = type === '결제' ? '결제를 취소하시겠습니까? 취소 후에는 환불이 진행되며, 환불 정책에 따라 환불금액이 차감될 수 있습니다.'
				                                           : '구독을 취소하시겠습니까? 구독 취소 후에는 더 이상 서비스를 이용하실 수 없으며, 이후에도 사용 가능한 날짜까지 서비스를 이용하실 수 있습니다. 구독 취소 후에는 환불이 진행되지 않습니다.';
				            document.getElementById('confirmTitle').innerText = type + ' 취소';
				            document.getElementById('confirmContent').innerText = content;
				            document.getElementById('confirmModal').style.display = 'block';
				        }
				
				        function hideConfirmPopup() {
				            document.getElementById('confirmModal').style.display = 'none';
				        }
				
				        function showPasswordInput() {
				            hideConfirmPopup();
				            document.getElementById('passwordModal').style.display = 'block';
				        }
				
				        function hidePasswordInput() {
				            document.getElementById('passwordModal').style.display = 'none';
				        }
				
				        function completeCancellation() {
				            // 비밀번호가 일치하면 취소 완료 모달을 띄우고, 서버로 결제/구독 취소 요청을 보낼 수 있습니다.
				            var type = document.getElementById('confirmTitle').innerText;
				            document.getElementById('passwordModal').style.display = 'none';
				            document.getElementById('completedTitle').innerText = type + '가 완료되었습니다.';
				            document.getElementById('completedModal').style.display = 'block';
				        }
				
				        function hideCompletedPopup() {
				            document.getElementById('completedModal').style.display = 'none';
				        }
				    </script>
			    
			    <script>
				    document.getElementById("register").addEventListener("click", function() {

				        window.location.href = "mypage.do";
				    });
				</script>
				
				<div class="submit">
			        <input id="register" type="submit" value="확인" class="btn w70">
			    </div>
			    
			    <script>
				    document.getElementById("register").addEventListener("click", function() {

				        window.location.href = "mypage.do";
				    });
				</script>

								
		</div><!-- **---wrap End---** -->
	</div>

	<!-- **---container End---** -->


</body>
</html>