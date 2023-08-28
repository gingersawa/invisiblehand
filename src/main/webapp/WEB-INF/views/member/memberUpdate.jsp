<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/login.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />
<title>보이지 않는 손 레이아웃</title>
</head>
<body>
  <!-- *---container Start---* -->

  <div class="h60px"></div>
  <div class="container-1400 con-login">
    <div class="join-wrap">
      <form action="/member/join" method="post" id="register-form">
        <div class="login-logo">
          <a href="#"><img class="login-logo-img" src="../resources/image/pngaaa.com-589654.png" alt="logo" /></a>
          
        </div>

        
        <!--본인인증 -->
        <div class="form-h3">
          <div class="line1px"></div>
          <div class="line3px"></div>
          <h3>회원정보</h3>
          <div class="line3px"></div>
          <div class="line1px"></div>
        </div>

       <div class="label-margin">
          <p class="input-title">이름</p>
          <label> 
            <input type="name" name="name" id="name" placeholder="이름을 입력하세요" class="size border-bottom" required="required">
            <div class="alert alert-danger" id="nameCheckDiv" style="height:20px; color: red;">이름을 입력해주세요.</div>
 
          </label>
        </div> 
        
       <div class="label-margin">
          <p class="input-title">ID</p>
          <label> 
            <input type="ID" name="ID" id="ID" placeholder="ID를 입력하세요" class="size border-bottom" required="required">
            <input id="id-check-btn" onclick = "fn_idChk();" type="button" value="중복확인" class="btn btn-white id-check-btn">
          </label>
        </div> 

        <div class="label-margin">
          <p class="input-title">닉네임</p>
          <label> 
            <input type="nickname" name="nickname" id="nickname" placeholder="닉네임을 입력하세요" class="size border-bottom" required="required">
            <input onclick = "fn_nicknameChk();" type="button" value="중복확인" class="btn btn-white nick-Check-btn">
          </label>
        </div> 
        
        <div class="label-margin">
          <p class="input-title">E-mail</p></p>
          <label> 
            <input type="E-mail" name="E-mail" id="E-mail" placeholder="E-mail을 입력하세요" class="size border-bottom" required="required">
            <input onclick = "fn_EmailChk();" type="button" value="인증번호 전송" class="btn btn-white email-check-btn">
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
          

        <!--비밀번호설정-->
        <div class="form-h3">
          <div class="line1px"></div>
          <div class="line3px"></div>
          <h3>비밀번호 변경</h3>
          <div class="line3px"></div>
          <div class="line1px"></div>
        </div>

        <div class="label-margin">
          <p class="input-title">비밀번호 입력</p>
          <label for="password"> 
            <input placeholder="비밀번호는 8이상 12자 이하로 설정바랍니다" type="password" class="size border-bottom" id="password" name="password" required>
            <input onclick = "fn_idChk();" type="button" value="부적합" class="btn btn-white pwbtn">

          </label>
        </div>
          
        <div class="label-margin">
          <p class="input-title">비밀번호 확인</p>
          <label for="confirm_password"> 
            <input type="password" class="size border-bottom checkmark" id="confirm_password" name="confirm_password"
            required oninput="validateForm()" placeholder="비밀번호를 다시 한번 입력하세요"> 
            <i class='fas fa-check-circle fa-sm' style='color:#4200FF; margin-left: -20px; opacity:0; transition:0.5s;'></i>
            <input onclick = "fn_idChk();" type="button" value="불일치" class="btn btn-white pw-check-btn">
            
          </label>
        </div>
          

       

        <div class="line1px"></div>
        <div class="line3px"></div>

        <!-- 버튼 -->
        <div class="submit">
          <input id="register" type="submit" value="수정하기" class="btn w70">
        </div>

        <p class="find join">
          <span><a href="${CP}/member/memberLogin.do">로그인페이지로 이동</a></span> 
          <span><a href="${CP}/main/main.do">메인페이지로 돌아가기</a></span>
        </p>
      </form>
    </div><!-- **---wrap End---** -->
  </div>

  <!-- **---container End---** -->

<script src="../resources/js/jquery-3.7.0.js"></script>

<script>
//공백 문자 처리 함수
let eUtil = {}
var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; // 이메일 정규
// 표현식
var email_Check = false;
var certified_Email = false;

// 회원가입 동의 여부 버튼
const agreeRadio = document.getElementById('m_y');
const disagreeRadio = document.getElementById('m_n');

//-----------이름----------o
$("#name").keyup(function(){
var name = $.trim($("#name").val());

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
  $("#nameCheckDiv").text("");
}


});

// 숫자만 입력되도록 처리--o
$(".numberOnly").on("keyup", function(e) {
  console.log('numberOnly keyup' + $(this).val());
  // REG EXP
  $(this).val($(this).val().replace(/[^0-9]/g, ""));
}); // numberOnly end------------------------
// str이 비어있으면 true
// 그렇지 않으면 false
eUtil.ISEmpty = function(str) {
  if (str != null && undefined != str) {
    str = str.toString();

    // 공백 제거: " james " -> "james"
    if (str.replace(/ /gi, "").length == 0) {
      return true;
    }
  }

  return false;

}

// 아이디 중복 확인 체크
function fn_idChk() {
  var id = $.trim($("#ID").val());
  if (id.length < 4) {
      alert("아이디는 4자 이상 입력해주세요.");
      $("#ID").focus();
  } else {

    $.ajax({
      url : "/ehr/login/idCheck.do",
      type : "post",
      dataType : "html",
      data : 'memberid=' + memberid,

      success : function(data) {
        if (data == 1) {
          console.log("data : " + data);
          idCheck = false;
          alert("중복된 아이디입니다.");
        } else if (data == 0) {
          if (eUtil.ISEmpty($('#ID').val()) == true) {
            alert('아이디를 입력 하세요.');
            $("#ID").focus();
            idCheck = false;
            return;
          } else {
            console.log("data : " + data);
            idCheck = true;
            alert("사용가능한 아이디입니다.")
            
          }
        }
      }
    })
  }
}

// 이메일 인증 버튼
$('#mail-Check-Btn').click(function() {
  const email = $('#email').val(); // 이메일 주소값 얻어오기!
  const checkInput = $('#checkInput'); // 인증번호 입력하는곳
  if (eUtil.ISEmpty($('#email').val()) == true) {
    alert('이메일 입력 후 중복확인을 진행해주세요.');
    email_Check = false;
    $("#email").focus();

  } else if (exptext.test(email) == false) {
    // 이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
    alert("이메일 형식이 올바르지 않습니다.");
    email_Check = false;
    $("#email").focus();
  } else {
    $.ajax({
      type : 'get',
      url : "mailCheck?email=" + email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
      success : function(data) {

        console.log("data : " + data);
        $('#checkInput').attr('disabled', false);
        code = data;
        alert('인증번호가 전송되었습니다.')
      }
    }); // end ajax
  }

}); // end send eamil

// 인증번호 비교
// blur -> focus가 벗어나는 경우 발생
$('#checkInput').blur(function() {
  const inputCode = $(this).val();
  const $resultMsg = $('#mail-check-warn');

  if (inputCode == code) {
    $resultMsg.html('인증번호가 일치합니다.');
    $resultMsg.css('color', 'green');
    $resultMsg.css('display', 'block');
    $resultMsg.css('font-size', '13px');
    $('#mail-Check-Btn').attr('disabled', true);
    $('#email').attr('readonly', true);
    $('#register').attr('disabled', false);
    certified_Email = true;
  } else {
    certified_Email = false;
    $resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!');
    $resultMsg.css('color', 'red');
    $resultMsg.css('display', 'block');
    $resultMsg.css('font-size', '13px');
  }
});
// 회원 가입 폼 유효성 검사
const form = document.getElementById('register-form');

form.addEventListener('submit', function(event) {
  event.preventDefault(); // 전송 안되게 처리
  $('#register').on("click", function() {
    console.log(email_Check);
    console.log(certified_Email);

    if ($('input:radio[name="agree"]:checked').is(':checked')) {
      if ((email_Check == true) && (certified_Email == true)) {
        form.submit();
        alert("회원가입을 축하합니다.");
        $("#register").off("click");
      } else {
        alert("나머지 항목들의 값이 올바른지 재확인 해주십시오.");
        $("#register").off("click");

      }
    } else {
      alert('이용약관 동의를 체크해주세요.');
    }
  });
});

disagreeRadio.addEventListener('click', function() {
    alert('회원가입에 동의해주셔야 합니다.');
    agreeRadio.checked = true; // 비동의 버튼 클릭 시 자동으로 동의 버튼 선택 처리
  });

// 비밀번호 관련 로직 처리--o
function validateForm() {
  var password = document.getElementById("password").value;
  var confirm_password = document.getElementById("confirm_password").value;
  var password_error = document.getElementById("password_error");
  var confirm_password_error = document
      .getElementById("confirm_password_error");

  if (password.trim().length === 0) {
    password_error.innerHTML = "";
  } else if (password.length < 8 || password.length > 12) {
    $('.pwbtn').css('color', 'red');
    $('.pwbtn').css('border', '1px solid red');
    $('#register').attr('disabled', true);

  } else {
    var newValue = '적합';
    $('.pwbtn').val(newValue);
    $('.pwbtn').css('color', 'blue');
    $('.pwbtn').css('border', '1px solid blue');
    $('#register').attr('disabled', true);

    if (confirm_password.trim().length === 0) {

      } else if (password !== confirm_password) {
        $('.pw-check-btn').css('color', 'red');
        $('.pw-check-btn').css('border', '1px solid red');
        $('#register').attr('disabled', true);
      } else {
    	    var newPWCeheckValue = '일치';
    	    $('.pw-check-btn').val(newPWCeheckValue);
    	    $('.pw-check-btn').css('color', 'blue');
    	    $('.pw-check-btn').css('border', '1px solid blue');
			    $('.fa-check-circle').css('opacity', '1');
          $('#register').attr('disabled', false);
      }
    }
  if (password_error.innerHTML === ""
      && confirm_password_error.innerHTML === "") {
    return true;
  } else {
    return false;
  }
}

function clearPasswordError() {
  var password_error = document.getElementById("password_error");
  var confirm_password_error = document
      .getElementById("confirm_password_error");

  password_error.innerHTML = "";
  confirm_password_error.innerHTML = "";
}
</script>
</body>
</html>