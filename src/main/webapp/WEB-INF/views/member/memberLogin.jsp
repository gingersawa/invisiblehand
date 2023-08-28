<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/login.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<!-- *---container Start---* -->
  <div class="drops">
      <div class="drop"></div>
      <div class="drop"></div>
      <div class="drop"></div>
      <div class="drop"></div>
  </div>
	<div class="h60px"></div>
	<div class="container-1200 min-100vh con-login">
		<div class="login-wrap">
			<form action="${CP}/main/main.do" method="post">
				<div class="login-logo">
					<a href="#"><img class="login-logo-img" src="../resources/image/pngaaa.com-589654.png" alt="logo" /></a>
				</div>
        
        <div class="lines-box">
	        <div class="line3px pur"></div>
	        <div class="line1px pur"></div>
	        <div class="input-wrap">
	          <!-- Email -->
	          <p class="input-title">ID</p>
	          <label>
	            <input class="size ID" type="ID" id="memberId" name="memberId" required="required">
	          </label>
	
	          <!-- Password -->
	          <p class="input-title password">Password</p>
	          <label class="pwShHi">
		          <input type="password" name="password" class="size password" id="password" required="required">
		          <i class="fa fa-eye fa-lg"></i>
			      </label>
	        </div>
	        <div class="line1px pur"></div>
	        <div class="line3px pur"></div>        
        </div>

				<p class="find">
					<span><a href="${CP}/member/memberPWChange.do">비밀번호 찾기</a></span>
					<span><a href="${CP}/member/memberJoin.do">회원가입</a></span>
				</p>
				<!-- <input type="submit" value="확인"> -->
				<p>
					<input type="submit" value="login" id="goLogin" name="goLogin" class="btn w100 login-btn">
				</p>
				<p class="kakao">
				  <a href="#0" id="kakaoLogin">카카오계정 로그인</a>
				</p>
				<span class="back-home"><a href="${CP}/main/main.do">메인페이지로 돌아가기</a></span>
			</form>
		</div>
		<!-- **---wrap End---** -->
	</div>
	<!--카카오 로그인 -->
	<script>
	function saveToDos(token) { //item을 localStorage에 저장합니다. 
	    typeof(Storage) !== 'undefined' && sessionStorage.setItem('AccessKEY', JSON.stringify(token)); 
	};
	
	window.Kakao.init('8d1de5919691fb7d74636ee7c868b109');
	
	function kakaoLogin() {
	    window.Kakao.Auth.login({
	        scope: 'profile_nickname, account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
	        success: function(response) {
	            saveToDos(response.access_token)  // 로그인 성공하면 사용자 엑세스 토큰 sessionStorage에 저장
	            window.Kakao.API.request({ // 사용자 정보 가져오기 
	                url: '/v2/user/me',
	                success: (res) => {
	                    const kakao_account = res.kakao_account;
	                    alert('로그인 성공');
	                    window.location.href='http://localhost:8080/ehr/main/main.do'
	                }
	            });
	        },
	        fail: function(error) {
	            console.log(error);
	        }
	    });
	};
	
	const login = document.querySelector('#kakaoLogin');
	login.addEventListener('click', kakaoLogin);
</script> <!------------카카오 로그인 END ----------->
<!-- **---container End---** -->
<script src="../resources/js/jquery-3.7.0.js"></script>
<script>
$(document).ready(function() {
	
	// 비밀번호 표시/숨기기 버튼
	$('.pwShHi i').on('mousedown', function(){
	    let input = $(this).prev('input');
	    input.removeClass('active');
	    input.attr('type', 'text');
	    $(this).attr('class',"fa fa-eye-slash fa-lg");
	}).on('mouseup', function(){
		  let input = $(this).prev('input');
	    input.addClass('active');
	    input.attr('type','password');
	    $(this).attr('class',"fa fa-eye fa-lg");
	});

    $("#goLogin").on("click", function(e) { // 로그인 버튼을 클릭했을 때
    	e.preventDefault();
    
    	 let id = $('input[name=memberId]').val().trim();
    	 let pw = $('input[name=password]').val().trim();
    	 
    	 if (id == '') {
    		 alert('아이디를 입력해주세요.');
    		 return;
    	 }
    	 
    	 if (pw == '') {
    		 alert('비밀번호를 입력해주세요.');
    		 return;
    	 }
    	  
    	if (confirm("로그인 하시겠습니까?") == false) return;
    	
      $.ajax({
        type: "POST",
        url: "dologin.do",//멤버 컨트롤러에 있는 주소
        async: true,
        dataType: "json", // 변경된 부분: 응답을 JSON으로 예상
        data: {
        	memberId: $("#memberId").val(),
          password: $("#password").val()
        },
        
        // 1:아이디미입력 2:비밀번호 미입력
        // 10(id 오류), 20(비번오류), 30(성공)
        success: function(data) {
          console.log("success data:" + data);
          if ("1" == data.msgId || "10" == data.msgId) {//
            alert(data.msgContents);
            $("#id").focus();
            return;
          }
          if ("2" == data.msgId || "20" == data.msgId) {
            alert(data.msgContents);
            $("#password").focus();
            return;
          }
          if ("30" == data.msgId) {
            alert(data.msgContents);
          }
          window.location.href = "${CP}/main/main.do"; // 변경된 부분: 리다이렉트 처리
        },
        error: function(data) {
          console.log("error:" + data);
          console.log(data);
        }
      });
    });
    
});
</script>