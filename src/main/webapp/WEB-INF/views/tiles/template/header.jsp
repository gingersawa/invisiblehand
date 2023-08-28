<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>

<c:url value="/post/postList.do" var="freePostURL">
  <c:param name="categoryNumber" value="10" />
</c:url>

<c:url value="/post/postList.do" var="qnaPostURL">
  <c:param name="categoryNumber" value="20" />
</c:url>

<c:url value="/post/postList.do" var="postURL">
  <c:param name="categoryNumber" value="30" />
</c:url>

<!DOCTYPE html>
<html>

<body>
  <!-- *---header Start---* -->
  <header class="header">
    <div class="inner">
      <div class="logo">
       <a href="${CP}/main/main.do"><img src="../resources/image/pngaaa.com-589654.png" alt="logo" /></a>
       <a href="${CP}/main/main.do" style="color: #fff;">INVISIBLE HAND</a>
      </div>
      <nav class="gnb_wrap">
        <ul class="global_nav_bar">
          <li>
          <c:choose>
            <c:when test="${null != sessionScope.member && not empty sessionScope.member}">
              <a href="#" onclick="paymentCheckIf()">차트</a>
            </c:when>
            <c:otherwise>
              <a href="#" id="loginBtn" onclick="doLogin()">차트</a>
            </c:otherwise>
          </c:choose>
          </li>
          <li><a href="${CP}/solution/solution_Q.do">솔루션</a></li>
          <li><a href="${freePostURL}">커뮤니티</a></li>

        </ul>
        <ul class="local_nav_bar">
          <li>
            <ul class="sub-menu nav-tabs">
              <li class="tab-li"><a href="#chart01">SBHI</a></li>
              <li class="tab-li"><a href="#chart02">기업경영분석지표</a></li>
              <li class="tab-li"><a href="${CP}/chart/chart.do#chart03">성장성</a></li>
              <li class="tab-li"><a href="${CP}/chart/chart.do#chart04">수익성</a></li>
            </ul>
          </li>
          <li>
            <ul class="sub-menu">
              <li><a href="#">서브메뉴2</a></li>
              <li><a href="#">서브메뉴2</a></li>
              <li><a href="#">서브메뉴2</a></li>
              <li><a href="#">서브메뉴2</a></li>
            </ul>
          </li>
          <li>
            <ul class="sub-menu">
              <li><a href="${freePostURL}">자유 게시판</a></li>
              <li><a href="${qnaPostURL}">Q&A 게시판</a></li>
              <li><a href="${postURL}">공지사항</a></li>
            </ul>
          </li>
        </ul>
      </nav>


      <div class="login-menu">
        <div class="login">
          <c:choose>
            <c:when test="${null != sessionScope.member && not empty sessionScope.member}">
              <a href="javascript:doLogout('${sessionScope.member.nickName}');"><span>로그아웃</span></a>
            </c:when>
            <c:otherwise>
              <a href="${CP}/member/memberLogin.do"><span>로그인</span></a>
            </c:otherwise>
          </c:choose>
        </div>
        <div class="munu-btn-wrap">
         <div class="menu-btn">
           <span></span>
           <span></span>
           <span></span>
         </div>
        </div>
      </div>
      
    </div>
      <div class="mypage-box">
           <c:choose>
            <c:when test="${null != sessionScope.member && not empty sessionScope.member}">
              <p>${sessionScope.member.nickName}님 환영합니다!</p> 
              <p><a href="/ehr/mypage/mypage.do">마이페이지</a></p> 
              <p>고객지원</p> 
            </c:when>
            <c:otherwise>
              <p style="display: none;"></p>
            </c:otherwise>
          </c:choose>
      </div>
  </header>

  <!-- **---header End---** -->
<script src="../resources/js/jquery-3.7.0.js"></script>
<script>
$(document).ready(function() {
    $('.menu-btn').click(function() {
        $('.menu-btn span').toggleClass('act'); // 클릭한 요소에 'act' 클래스를 토글
        $('.header').toggleClass('act'); // 클릭한 요소에 'act' 클래스를 토글
    });
});

function doLogout(name) {
  if (confirm(name + '님 로그아웃하시겠습니까?') == false)
    return;
  console.log("doLogout");

  window.location.href = "${CP}/member/logout.do";
}
    
function doLogin() {
  alert("로그인 후 이용해주세요.");
  location.href = "../member/memberLogin.do";
}

function paymentCheckIf() {
	let email = '${sessionScope.member.email}';
	
  $.ajax({
      url: "/ehr/payment/payment_check.do",
      type: "GET",
      dataType: "html",
      data: {
    	  email : email
      }, success: function(data) {
    	  if (data == 1) {
 	        location.href = "../chart/chart.do";
    	  } else {
    		  alert("유료 결제 페이지입니다. 구독 후 이용해주세요.");
    		  location.href = "../payment/payment_view.do";
    	  }
    	}, error: function(data) {
    	  alert("구독 여부 확인에 실패하였습니다. 관리자에게 문의해주세요" + data);
      }
  });
}
</script>