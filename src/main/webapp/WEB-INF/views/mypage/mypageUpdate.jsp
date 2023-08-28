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
			        <p class="input-title">닉네임 변경</p>
			        <label>
			            <input type="text" name="NickName" id="NickName" placeholder="닉네임을 입력하세요" class="size border-bottom" required="required">
			            <input onclick="checkNickname();" type="button" value="중복확인" class="btn btn-white">
			        </label>
			    </div>
				
				<div class="label-margin">
					<p class="input-title">E-mail 변경</p></p>
					<label> 
						<input type="E-mail" name="E-mail" id="E-mail" placeholder="E-mail을 입력하세요" class="size border-bottom" required="required">
						<input onclick = "fn_idChk();" type="button" value="인증번호 전송" class="btn btn-white">
					</label>
				</div>
				
				<div class="label-margin">
					<p class="input-title">E-mail 인증번호 확인</p>
					<label> 
						<input type="text" class="size numberOnly border-bottom checkmark" name="checkInput" id="checkInput" placeholder="인증번호 6자리를 입력해주세요" maxlength="6" required>
						<i class='fas fa-check-circle fa-sm' style='color:#4200FF; margin-left: -20px;'></i>
						<input type="button" id="mail-Check-Btn" value="인증번호 확인"class="btn btn-white"> 
						<span id="mail-check-warn"></span>
					</label>
				</div>
				<div class="submit">
			        <input id="register" type="submit" value="수정 완료" class="btn w70">
			    </div>
			    
			     <script>
			        // 닉네임 중복 여부를 확인
			        function isNicknameAvailable(nickname) {

			            return true; // 임시로 true 반환 
			        }
			
			        function checkNickname() {
			            const nicknameInput = document.getElementById("NickName");
			            const nickname = nicknameInput.value.trim();
			
			            if (nickname === "") {
			                alert("닉네임을 입력해주세요.");
			                return;
			            }
			
			            if (isNicknameAvailable(nickname)) {
			                alert("사용 가능한 아이디입니다.");
			            } else {
			                alert("이미 사용 중인 아이디입니다.");
			            }
			        }
			
			        document.getElementById("register").addEventListener("click", function() {
			            const popupMessage = "수정이 완료되었습니다.";
			            alert(popupMessage);		            
					     
			        });
			    </script>
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