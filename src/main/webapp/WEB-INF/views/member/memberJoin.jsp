<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/login.css">
  <!-- *---container Start---* -->
  <div class="drops">
      <div class="drop"></div>
      <div class="drop"></div>
      <div class="drop"></div>
      <div class="drop"></div>
  </div>
  <div class="h60px"></div>
  <div class="container-1400 con-login">
    <div class="join-wrap">
      <form action="${CP}/member/memberLogin.do" method="post"
        id="register-form">
        <div class="login-logo">
          <a href="#"><img class="login-logo-img"
            src="../resources/image/pngaaa.com-589654.png" alt="logo" /></a>

        </div>


        <!--본인인증 -->
        <div class="form-h3">
          <div class="line1px"></div>
          <div class="line3px"></div>
          <h3>본인인증</h3>
          <div class="line3px"></div>
          <div class="line1px"></div>
        </div>



        <div class="label-margin">
          <p class="input-title">ID</p>
          <label>
            <input type="ID" name="memberId" id="memberId" placeholder="ID를 입력하세요" 
                   class="size border-bottom" requi#FF007A="requi#FF007A">
            <i class="fas fa-check-circle fa-sm check-icon-01"></i>
            <input id="id-check-btn" type="button" name="idConfirmBtn" value="중복확인" class="btn btn-white id-check-btn">
          </label>
        </div>

        <div class="label-margin">
          <p class="input-title">닉네임</p>
          <label>
            <input type="nickname" name="nickName" id="nickName" placeholder="닉네임을 입력하세요"
                   class="size border-bottom" requi#FF007A="requi#FF007A">
            <i class="fas fa-check-circle fa-sm check-icon-02"></i>
            <input id="nick-check-btn" type="button" name="nickConfirmBtn" value="중복확인" class="btn btn-white nick-Check-btn">
          </label>
        </div>

        <div class="label-margin">
          <p class="input-title">E-mail</p>
          <label>
            <input type="email" name="email" id="email" placeholder="E-mail을 입력하세요"
                   class="size border-bottom" requi#FF007A="requi#FF007A">
            <i class="fas fa-check-circle fa-sm check-icon-03"></i>           
            <input id="email-check-btn" type="button" name="emailConfirmBtn" value="중복확인" class="btn btn-white nick-Check-btn">
          </label>
        </div>

        <div class="label-margin">
          <p class="input-title">E-mail 인증번호 확인</p>
          <label>
          <input type="text" class="size numberOnly border-bottom checkmark"
                 name="checkInput" id="checkInput" placeholder="인증번호 6자리를 입력해주세요" maxlength="6" requi#FF007A>
          <i class="fas fa-check-circle fa-sm check-icon-04"></i>
          <input id="email-send-btn" type="button" name="emailConfirmCkBtn" value="인증번호 전송" class="btn btn-white num-check-btn">
          <span id="mail-check-warn"></span>
          </label>
        </div>


        <div class="label-margin name-phone-wrap">
          <div class="name-phone">
            <p class="input-title">이름</p>
            <label>
            <input type="memberName" name="memberName" id="memberName" class="size border-bottom w48" requi#FF007A="requi#FF007A">
              <div class="alert alert-danger" id="nameCheckDiv" style="height: 20px; color: #979797; font-size: 14px;">
                            이름을 입력해주세요.
              </div>
            </label>
          </div>
          <div class="name-phone">
            <p class="input-title">휴대폰번호</p>
            <label>
              <input type="phoneNumber" name="phoneNumber" id="phoneNumber"
                     placeholder="'-'없이 입력해주세요" class="size border-bottom w48" requi#FF007A="requi#FF007A">
            </label>
          </div>
        </div>

        <!--비밀번호설정-->
        <div class="form-h3">
          <div class="line1px"></div>
          <div class="line3px"></div>
          <h3>비밀번호 설정</h3>
          <div class="line3px"></div>
          <div class="line1px"></div>
        </div>

        <div class="label-margin">
          <p class="input-title">비밀번호 입력</p>
          <label for="password">
          <input placeholder="비밀번호는 8이상 12자 이하로 설정바랍니다" type="password"  class="size border-bottom" id="password" name="password" requi#FF007A>
            <input type="button" name="pwConfirmBtn" value="부적합" class="btn btn-white pwbtn">

          </label>
        </div>

        <div class="label-margin">
          <p class="input-title">비밀번호 확인</p>
          <label for="confirm_password">
            <input type="password" class="size border-bottom checkmark" id="confirm_password"
                 name="confirm_password" requi#FF007A placeholder="비밀번호를 다시 한번 입력하세요">
            <i class="fas fa-check-circle fa-sm check-icon-05"></i>
            <input type="button" name="pwConfirmCkBtn" value="불일치" class="btn btn-white pw-check-btn">
          </label>
        </div>


        <!--이용약관 동의-->
        <div class="form-h3">
          <div class="line1px"></div>
          <div class="line3px"></div>
          <h3>이용약관</h3>
          <div class="line3px"></div>
          <div class="line1px"></div>
        </div>

        <div class="label-margin">

          <div class="input-title">
            <span>이용약관동의여부 확인 <a href="../member/memberAgree.do">[이용약관 자세히 읽기]</a></span>
          </div>
          <div class="input-chek">
            <input checked="checked" type="radio" name="agree" value="Y" id="m_y" requi#FF007A>
            <label for="m_y"> 동의합니다</label>
            <input type="radio" name="agree" value="N" id="m_n" checked="checked">
            <label for="m_n">동의하지 않음</label>

          </div>
        </div>

        <div class="line1px"></div>
        <div class="line3px"></div>

        <!-- 버튼 -->
        <div class="submit">
          <input id="register" type="submit" value="회원가입" class="btn w70">
        </div>

        <p class="find join">
          <span><a href="${CP}/member/memberLogin.do">로그인페이지로 이동</a></span> <span><a
            href="${CP}/main/main.do">메인페이지로 돌아가기</a></span>
        </p>
      </form>
    </div>
    <!-- **---wrap End---** -->
  </div>

  <!-- **---container End---** -->

  <script src="../resources/js/jquery-3.7.0.js"></script>

  <script>

  $(document).ready(function() {
    var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; // 이메일 정규
    var idCheck = false;
    var nickCheck = false;
    var emailCheck = false;
    var pwCheck = false;
    var certified_Email = 'N';
    // 회원가입 동의 여부 버튼
    const agreeRadio = document.getElementById('m_y');
    const disagreeRadio = document.getElementById('m_n');
      
    // 아이디 중복 확인 체크----------------------------------------------
    $("#id-check-btn").on("click", function () {
      var id = $.trim($("#memberId").val());
      
      if (id.length < 2) {
        alert("아이디는 2자 이상 입력해주세요.");
        $("#memberId").focus();
        var newValue = '부적합';
        $('#id-check-btn').val(newValue);
        $('#id-check-btn').css('color', '#FF007A');
        $('#id-check-btn').css('border', '1px solid #FF007A');
        $('.check-icon-01').css('opacity', '0');
        return;
        
      } else {
        $.ajax({
          url: "idCheck.do",
          type: "GET",
          dataType: "html",
          data: {
            memberId: id
          },
          success: function (data) {
            var idCheck; // idCheck 변수가 적절한 범위에 선언되어야 합니다.
            
            if (data == 1) {
              console.log("data : " + data);
              idCheck = false;
              alert("중복된 아이디입니다.");
              var newValue = '중복확인';
              $('#id-check-btn').val(newValue);
              $('#id-check-btn').css('color', '#FF007A');
              $('#id-check-btn').css('border', '1px solid #FF007A');
              $('.check-icon-01').css('opacity', '0');
              return;
            } else if (data == 0) {
              console.log("data : " + data);
              idCheck = true;
              alert("사용가능한 아이디입니다.");
              var newValue = '사용가능';
              $('#id-check-btn').val(newValue);
              $('#id-check-btn').css('color', '#6B53FF');
              $('#id-check-btn').css('border', '1px solid #6B53FF');
              $('.check-icon-01').css('opacity', '1');
              console.log("idCheck : " + idCheck);
            } else {
              console.log("data : " + data);
              idCheck = false;
              alert("서버에 이상이 있습니다.");
            }
          },
          error: function (data) { 
            console.log("error:" + data);
          },
        });
      }
    });

  
  //------------------------------------------------------------닉네임 중복 확인 체크
    $("#nick-check-btn").on("click", function () {
      var nick = $.trim($("#nickName").val());
      
      if (nick.length < 2) {
        alert("닉네임은 2자 이상 입력해주세요.");
        $("#nickName").focus();
        var newValue = '부적합';
        $('#nick-check-btn').val(newValue);
        $('#nick-check-btn').css('color', '#FF007A');
        $('#nick-check-btn').css('border', '1px solid #FF007A');
        $('.check-icon-02').css('opacity', '0');
        return;
      } else {
        $.ajax({
          url: "nickNameCheck.do",
          type: "GET",
          dataType: "html",
          data: {      
            nickName: nick
          },
          success: function (data) {
            var nickNameCheck; // idCheck 변수가 적절한 범위에 선언되어야 합니다.
            
            if (data == 1) {
              console.log("data : " + data);
              nickCheck = false;
              alert("중복된 닉네임입니다.");
              var newValue = '중복확인';
              $('#nick-check-btn').val(newValue);
              $('#nick-check-btn').css('color', '#FF007A');
              $('#nick-check-btn').css('border', '1px solid #FF007A');
              $('.check-icon-02').css('opacity', '0');
              return;
              
            } else if (data == 0) {
              console.log("data : " + data);
              nickCheck = true;
              alert("사용가능한 닉네임입니다.");
              var newValue = '사용가능';
              $('#nick-check-btn').val(newValue);
              $('#nick-check-btn').css('color', '#6B53FF');
              $('#nick-check-btn').css('border', '1px solid #6B53FF');
              $('.check-icon-02').css('opacity', '1');
              console.log("nickCheck : " + nickCheck);
            } else {
              console.log("data : " + data);
              nickCheck = false;
              alert("서버에 이상이 있습니다.");
            }
          },
          error: function (data) { 
            console.log("error:" + data);
          },
        });
      }
    });
  
  
  //------------------------------------------------------------닉네임 중복 확인 체크
    $("#email-check-btn").on("click", function () {
      var email = $.trim($("#email").val());
      if (email.length < 1){
          alert('이메일 입력 후 전송버튼을 눌러주세요.');
          emailCheck = false;
          $("#email").focus();
          return;
          
        } else if (exptext.test(email) == false) {
          // 이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
          alert("이메일 형식이 올바르지 않습니다.");
          emailCheck = false;
          $("#email").focus();
          return;
          
        } else {
        	
        $.ajax({
          url: "emailCheck.do",
          type: "GET",
          dataType: "html",
          data: {      
            email: email
          },
          success: function (data) {
            var emailCheck; // idCheck 변수가 적절한 범위에 선언되어야 합니다.
            
            if (data == 1) {
              console.log("data : " + data);
              emailCheck = false;
              alert("중복된 이메일입니다.");
              var newValue = '중복확인';
              $('#email-check-btn').val(newValue);
              $('#email-check-btn').css('color', '#FF007A');
              $('#email-check-btn').css('border', '1px solid #FF007A');
              $('.check-icon-03').css('opacity', '0');
              return;
              
            } else if (data == 0) {
              console.log("data : " + data);
              emailCheck = true;
              alert("사용가능한 이메일입니다.");
              var newValue = '사용가능';
              $('#email-check-btn').val(newValue);
              $('#email-check-btn').css('color', '#6B53FF');
              $('#email-check-btn').css('border', '1px solid #6B53FF');
              $('.check-icon-03').css('opacity', '1');
              console.log("emailCheck : " + emailCheck);
            } else {
              console.log("data : " + data);
              emailCheck = false;
              alert("서버에 이상이 있습니다.");
            }
          },
          error: function (data) { 
            console.log("error:" + data);
          },
        });
      }
    });
  
  
  //--------------------------------------------------------------
  // 이메일 인증번호 보내기 버튼
    $('#email-send-btn').click(function() {
      const email = $('#email').val(); // 이메일 주소값 얻어오기!
      const checkInput = $('#checkInput'); // 인증번호 입력하는곳
      let emailConfirm = $("input[type=button][name=emailConfirmBtn]").val();
      
      if (emailConfirm != "사용가능") {
    	  alert("이메일 중복 확인 후 이용해주세요.");
    	  return;
    	  
      } else {
    	  $.ajax({
    		  type : 'get',
    		  url : "numCheck.do?email=" + email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
    		  success : function(data) {
    		    code = data;  // code 변수에 data 값을 할당합니다.
    		    emailCheck = true;
    		    $('#checkInput').attr('disabled', false);
    		    alert('인증번호가 전송되었습니다.')
    		    console.log(email);
    		    console.log("data : " + data);
    		    $("#email-send-btn").attr("id", "newId");

    		    var newValue = '인증번호 확인';
    		    $('#newId').val(newValue);

    		  }
    		}); // end ajax
			}
    }); // end send eamil
    
    // 인증번호 비교
    $('#checkInput').keyup(function() {
      const inputCode = $('#checkInput').val();

      if (inputCode == code) {
        
        $('.num-check-btn').val("일치");
        $('.num-check-btn').css('color', '#6B53FF');
        $('.num-check-btn').css('border', '1px solid #6B53FF');
        $('.check-icon-04').css('opacity', '1');
        pwCheck = true;
        certified_Email = 'Y';
        console.log(certified_Email);
        console.log("emailCeck : " + emailCheck);
        
      } else {

         $('.num-check-btn').val("불일치");
         $('.num-check-btn').css('color', '#FF007A');
         $('.num-check-btn').css('border', '1px solid #FF007A');
         $('.check-icon-04').css('opacity', '0');
         pwCheck = false;
         certified_Email = 'N';
         return;
         
      }
    });
    
      //-----------이름----------///
        $("#memberName").keyup(function(){
        var name = $.trim($("#memberName").val());
        
        // [가-힣]{2,10}
        if(name.length < 2){
          $("#nameCheckDiv").removeClass("alert-success");
          $("#nameCheckDiv").addClass("alert-danger");
          $("#nameCheckDiv").text("이름은 2자 이상 입력해주세요.");
          return;
          
        } else if(name.length > 20){
          $("#nameCheckDiv").removeClass("alert-success");
          $("#nameCheckDiv").addClass("alert-danger");
          $("#nameCheckDiv").text("이름은 20자 이내로 입력해주세요.");
          return;
          
        } else if(/^[가-힣]+$/.test(name) == false){
          $("#nameCheckDiv").removeClass("alert-success");
          $("#nameCheckDiv").addClass("alert-danger");
          $("#nameCheckDiv").text("이름의 형식이 올바르지 않습니다.");
          return;
          
        } else {
          $("#nameCheckDiv").text( name + "님 환영합니다");
        }
        
        
      });
/////////////////////////////////////////////////////////////////////////////////////              

    // 비밀번호 관련 로직 처리--o
    $("#confirm_password").keyup(function() {
      var password = document.getElementById("password").value;
      var confirm_password = document.getElementById("confirm_password").value;
      var password_error = document.getElementById("password_error");
      var confirm_password_error = document
          .getElementById("confirm_password_error");
      
      if (password.length < 8 || password.length > 12) {
        var newValue = '부적합';
        $('.pwbtn').val(newValue);
        $('.pwbtn').css('color', '#FF007A');
        $('.pwbtn').css('border', '1px solid #FF007A');
        $('#register').attr('disabled', true);
        return;
    
      } else {
        var newValue = '적합';
        $('.pwbtn').val(newValue);
        $('.pwbtn').css('color', '#6B53FF');
        $('.pwbtn').css('border', '1px solid #6B53FF');
        $('#register').attr('disabled', true);
    
        if (confirm_password.trim().length === 0) {
    
          } else if (password !== confirm_password) {
            var newPWCeheckValue = '불일치';
            $('.pw-check-btn').val(newPWCeheckValue);
            $('.pw-check-btn').css('color', '#FF007A');
            $('.pw-check-btn').css('border', '1px solid #FF007A');
            $('.check-icon-05').css('opacity', '0');
            $('#register').attr('disabled', true);
            
          } else {
              var newPWCeheckValue = '일치';
              $('.pw-check-btn').val(newPWCeheckValue);
              $('.pw-check-btn').css('color', '#6B53FF');
              $('.pw-check-btn').css('border', '1px solid #6B53FF');
              $('.check-icon-05').css('opacity', '1');
              $('#register').attr('disabled', false);
              console.log("pwCheck : " + pwCheck);
          }
        }

    });

//------------------------------------------------------------

    //회원정보 전송
		$("#register").on("click", function(e) {
	    e.preventDefault(); // 폼 제출을 막음
	  
	    let ck = $("input[type=radio][name=agree]:checked").val();
	    
	    // 중복 검증
	    let idConfirm = $("input[type=button][name=idConfirmBtn]").val();
	    let nickConfirm = $("input[type=button][name=nickConfirmBtn]").val();
	    let emailConfirm = $("input[type=button][name=emailConfirmBtn]").val();
	    let emailConfirmCk = $("input[type=button][name=emailConfirmCkBtn]").val();
	    let pwConfirm = $("input[type=button][name=pwConfirmBtn]").val();
	    let pwConfirmCk = $("input[type=button][name=pwConfirmCkBtn]").val();
	    
	    // 정보 확인
	    let name = $("input[id=memberName]").val().trim();
	    let num = $("input[id=phoneNumber]").val().trim();
	    let password = $("input[id=password]").val().trim();
	   
	    if (idConfirm != "사용가능") {
	    	alert("아이디 중복 확인을 해주세요.");
	    	return;
	    }
	    
	    if (nickConfirm != "사용가능") {
	    	alert("닉네임 중복 확인을 해주세요.");
	    	return;
	    }
	    
	    if (emailConfirm != "사용가능") {
	    	alert("이메일 중복 확인을 해주세요.");
	    	return;
	    }
	    
	    if (emailConfirmCk != "일치") {
	    	alert("이메일 인증 번호를 확인해주세요.");
	    	return;
	    }
	    
	    if (name == "") {
	    	alert("이름을 입력해주세요.");
	    	return;
	    }
	    
	    if (num == "") {
	    	alert("전화번호를 입력해주세요.");
	    	return;
	    }
	    
	    if (password == "") {
	      alert("비밀번호를 입력해주세요.");
	      return;
	    }
	    
	    if (pwConfirm != "적합") {
	    	alert("비밀번호를 다시 설정해주세요.");
	    	return;
	    }
	    
	    if (pwConfirmCk != "일치") {
	    	alert("비밀번호가 일치하지않습니다.");
	    	return;
	    }
	    
	    if (ck == "N") {
	      alert("이용약관에 동의해주세요.");
	      return;
	    }
	    
	    $.ajax({
			  type: "POST",
			  url: "/ehr/member/join.do",
			  asyn:"true",
			  dataType:"html",   
			  data: $('#register-form').serialize(),
			  success:function(data){
			      let parsedJson = JSON.parse(data);
			      
			      if ("1" == parsedJson.msgContents){
			        alert("회원가입이 완료되었습니다.\n로그인해주세요.");
			        location.href = "../member/memberLogin.do";
			      } else{
			        alert("회원가입이 실패되었습니다. : " + parsedJson.msgContents);
			      }
			    }, error: function(xhr, status, error) {
			      // Handle form submission error
			      alert("회원가입에 실패했습니다. 관리자에게 문의해주세요. : " + parsedJson.msgContents);
			      window.scrollTo({ top: 0, behavior: "smooth" });
			    }
			}); // ajax 종료
	  });


  ////////////////////////////////////////////////////////////////////////
  
}); // document.ready -------------------------------------------------





//---------------------------------------------------------------

  </script>
