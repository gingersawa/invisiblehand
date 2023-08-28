<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<meta charset="UTF-8">
<link rel="icon" href="image/favicon-32x32.png">
<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/mypage.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />
<!-- *---container Start---* -->

<div class="h60px"></div>
<div class="container-1400 min-100vh con-login">
	<div class="mypage-wrap">
		<div class="box-area">

			<div class="mybox mybox01">
				<div class="line1px"></div>
				<div class="line3px"></div>
				<h2>회원정보</h2>
				<div class="my-info">
					<div class="my-grade">
						<div class="myid"></div>
						<div class="bedge"></div>
					</div>
					<div class="my-info-list">
						<span><a href="../member/memberPWChange.do">회원정보 수정</a></span>
						<span><a href="../member/memberDelete.do">회원 탈퇴</a></span>
						<span><a href="javascript:doLogout('${sessionScope.member.nickName}');">로그아웃</a></span>
					</div>
				</div>
				<div class="line3px"></div>
				<div class="line1px"></div>
			</div>
			<div class="mybox mybox02">
				<div class="line1px"></div>
				<div class="line3px"></div>
				<h2>나의활동</h2>
				<div class="my-info">
					<div class="my-info-list">
						<span><a href="login">작성한 게시글 보기</a></span>
						<span><a href="login">작성한 댓글 보기</a></span>
						<span><a href="login">문의글 보기</a></span>
					</div>
				</div>
				<div class="line3px"></div>
				<div class="line1px"></div>
			</div>
			<div class="mybox mybox03">
				<div class="line1px"></div>
				<div class="line3px"></div>
				<h2>구독관리</h2>
				<div class="my-info">
					<div class="my-info-list">
						<span><a href="../payment/payment_view.do">결제정보 수정</a></span> <span><a
							href="../payment/payment_detail.do">구독현황</a></span>
					</div>
				</div>
				<div class="line3px"></div>
				<div class="line1px"></div>
			</div>

		</div>
	</div>
	<!-- **---wrap End---** -->
</div>

<!-- **---container End---** -->

<script>
	function doLogout(name) {
		if (confirm(name + '님 로그아웃하시겠습니까?') == false)
			return;
		console.log("doLogout");

		window.location.href = "${CP}/member/logout.do";
	}
</script>