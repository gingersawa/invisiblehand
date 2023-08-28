<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<div class="container-1200 min-100vh con-login">
		<div class="login-wrap">
        <form action="/member/login" method="post">
          <div class="login-logo">
            <a href="#"><img class="login-logo-img" src="../resources/image/pngaaa.com-589654.png" alt="logo" /></a>
          </div>

      <div class="line3px"></div>
      <div class="line1px"></div>
      <div class="input-wrap">
          <!-- Email -->
          <p class="input-title">Email</p>
          <label> 
	          <input class="size email" type="text" id="email" name="email" 
	          placeholder="example@mail.com">
          </label>

          <!-- Password -->
          <p class="input-title password">Password</p>
          <label> <input type="password" name="password"
            placeholder="********" class="size" id="password">
          </label>
      </div>   
      <div class="line1px"></div>
      <div class="line3px"></div>
        <p class="find">
          <span><a href="find">비밀번호 찾기</a></span> 
          <span><a href="save">회원가입</a></span>
        </p>
        <!-- <input type="submit" value="확인"> -->
        <p>
          <input type="submit" value="login" id ="fn_email" name="fn_email" class="btn w100 login-btn">
        </p>
        <span class="back-home"><a href="index">메인페이지로 돌아가기</a></span>
        </form>
		</div><!-- **---wrap End---** -->
	</div>

	<!-- **---container End---** -->

</body>
</html>