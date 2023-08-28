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
<style>
#paymentList {
    list-style: none;
    padding-left: 0;
    margin: 0; 
}

#paymentList li {
    margin-bottom: 5px;
}
</style>

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
					<h3>결제 및 구독정보 조회</h3>
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
				    
				    <div class="info">
				        <label>구독 기간:</label>
				        <span id="subscriptionStart">2023-07-01</span> ~ <span id="subscriptionEnd">2023-12-31</span>
				    </div>
				
				    <div class="info">
				        <label>구독 끝나는 시기:</label>
				        <span id="subscriptionExpire">2023-12-31</span>
				    </div>
				    <script>

				        function loadPaymentInfo() {
				
				            const subscriptionStart = "2023-07-01";
				            const subscriptionEnd = "2023-12-31";
				
				            // 구독 기간
				            document.getElementById("subscriptionStart").textContent = subscriptionStart;
				            document.getElementById("subscriptionEnd").textContent = subscriptionEnd;
				
				            // 구독 끝나는 시기
				            const subscriptionExpire = new Date(subscriptionEnd);
				            subscriptionExpire.setFullYear(subscriptionExpire.getFullYear() + 1);
				            document.getElementById("subscriptionExpire").textContent = subscriptionExpire.toISOString().slice(0, 10);
				        }
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