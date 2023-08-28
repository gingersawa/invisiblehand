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
					<h3>회원정보 수정</h3>
					<div class="line3px"></div>
					<div class="line1px"></div>
				</div>				
				
				
				<div class="label-margin">
			        <p class="input-title">아이디 : INHAND</p>			        
			    </div>
				
				
			    <div class="label-margin">
			        <p class="input-title">닉네임 : 잘보이는손</p>
			    </div>
				
				<div class="label-margin">
					<p class="input-title">E-mail : inhand@naver.com</p></p>
				</div>
				
				<div class="label-margin">
					<p class="input-title">회원등급 : 골드</p></p>
				</div>
				
				<div class="submit">
			        <input id="register" type="submit" value="확인" class="btn w70">
			    </div>
			    
			    <script>
				    document.getElementById("register").addEventListener("click", function() {

				        window.location.href = "mypage.do";
				    });
				</script>
			    
			</div>
		</div><!-- **---wrap End---** -->
	</div>

	<!-- **---container End---** -->
	

</body>
</html>