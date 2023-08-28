<%@page import="com.pcwk.ehr.cmn.StringUtil"%>
<%@page import="com.pcwk.ehr.cmn.DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../resources/css/hand-board.css">
<link rel="stylesheet" href="../resources/css/list.css">
<link rel="stylesheet" href="../resources/css/common.css">
<style>
.cate {
	width: 300px;
	position: relative;
	border-style: solid;
	border-width: 1px 1px 0 1px;
	border-color: #000;
}

.cate:last-child {
	border-bottom: 1px solid #000;
}

.cate .menu {
	display: block;
	position: relative;
	width: 100%;
	background: gray;
	height: 80px;
}

.cate .menu .menulink {
	display: block;
	color: #fff;
	text-decoration: none;
	width: 70%;
	padding-left: 15px;
	line-height: 80px;
}

.cate .menu .subopen {
	position: absolute;
	width: 8px;
	height: 8px;
	right: 15px;
	padding: 0;
	top: 0;
	bottom: 0;
	margin: auto;
	border-right: 1px solid #fff;
	border-bottom: 1px solid #fff;
	transform: rotate(45deg);
}

.cate ul li {
	padding: 5px 10px;
}

.cate ul li:first-child {
	padding-top: 20px;
}

.cate ul li:last-child {
	padding-bottom: 20px;
}

.admin-contents {
	background-color: pink;
	width: 50%
}

.admin-con {
	display: flex;
}

/* 新しいスタイル */
.search-form {
	background-color: inherit;
	padding: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	height: 80px; /* メニュー項目と同じ高さに設定 */
}

.search-form>div {
	margin-bottom: 10px;
	text-align: center;
}

/* 検索区分のテキストを中央に配置 */
#searchDiv {
	text-align: center;
}

* /

#pagetop {
	clear: both;
	padding-top: 40px;
	padding-right: 10px;
}

#pagetop a {
	color: #fff; /*文字色*/
	font-size: 20px; /*文字サイズ*/
	text-decoration: none;
	text-align: center;
	display: block;
	float: right;
	margin-bottom: 50px;
	background: #222; /*背景色*/
	color: #999; /*文字色*/
	width: 60px; /*幅*/
	line-height: 60px; /*高さ*/
	border-radius: 50%; /*角丸のサイズ*/
}
</style>
<title>보이지 않는 회원조회</title>
</head>
<body>

	<!-- *---container Start---* -->
	<!-- accordion 메뉴 -->
	<div class="h60px"></div>
	<div class="c">
		<div class="accordion">
			<div class="cate">
				<span class="menu"> <a href="${CP}/admin/admin.do"
					class="menulink">회원관리</a> <a href="javascript:void(0);"
					class="subopen"></a>
				</span>
				<ul>
					<li><a href="${CP}/admin/adminSearch.do">회원조회</a></li>
				</ul>
			</div>
			<div class="cate">
				<span class="menu"> <a href="${CP}/admin/admin.do"
					class="menulink">서비스 관리</a> <a href="javascript:void(0);"
					class="subopen"></a>
				</span>
				<ul>
					<li><a href="${CP}/admin/adminSubChargeChange.do">구독제 요금
							변경</a></li>
				</ul>
			</div>
		</div>

	</div>
	<!-- accordion 메뉴 end -->

	<div class="container">
		<h1>회원관리</h1>

		<%-- sessionScope.user:${sessionScope.user } --%>
		<div class="button-area">
			<!-- 검색  -->

			<form action="#" name="user_frm">
				<input type="hidden" name="pageNo" id="pageNo">
				<!-- 검색구분 -->
				<select name="searchDiv" id="searchDiv">
					<option value="">전체</option>
					<option value="">닉네임</option>
					<option value="">등급</option>
					<option value="">이메일</option>
				</select>
				<!-- 검색어 -->
				<input type="text" value="${search.searchWord}" name="searchWord"
					id="searchWord" placeholder="검색어를 입력하세요.">
				<!-- pageSize:10,20,30,50,100,200 -->
				<select name="pageSize" id="pageSize">
					<option value="10">10</option>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="50">50</option>
					<option value="100">100</option>
					<option value="200">200</option>
				</select> <input type="button" class="btn" value="조회" id="#" onclick="#">
			</form>
		</div>
		<table id="boardTable"
			class="table table-sm table-hover table-borderless">
			<thead class="board-thead">
				<tr>
					<th class="text-center">회원ID</th>
					<th class="text-center">닉네임</th>
					<th class="text-center">회원이름</th>
					<th class="text-center">등급</th>
					<th class="text-center">이메일</th>
					<th class="text-center">등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${memberList}">
					<tr>
						<td class="c-txt">${vo.memberId}</td>
						<td class="c-txt">${vo.nickName}</td>
						<td class="c-txt">${vo.memberName}</td>
						<td class="c-txt">${vo.memberGrade}</td>
						<td class="c-txt">${vo.email}</td>
						<td class="c-txt">${vo.updateDate}</td>
					</tr>
				</c:forEach>
				<c:choose>
					<c:when test="${not empty list }">
						<c:forEach var="vo" items="${list}">
							<tr>
								<!-- <td class="text-center  col-sm-2  col-md-1  col-lg-1"><c:out value="${vo.num}"/></td> -->
								<td class="text-center  col-sm-2  col-md-1  col-lg-1"></td>
								<td class="text-left    col-sm-6  col-md-6  col-lg-7"><a
									href="#"></a></td>
								<td class="text-center  col-sm-2  col-md-2  col-lg-2"></td>
								<td class="text-center  col-sm-2  col-md-2  col-lg-1"></td>
								<td class="text-end     col-sm-0  col-md-1  col-lg-1"></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td class="text-center col-sm-12  col-md-12  col-lg-12"
								colspan="99">no data</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div class="d-flex justify-content-center">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
		<!-- paging : 1. java, 2.javascript -->
		<div class="d-flex justify-content-center"></div>


		<!--// paging --------------------------------------------------------------->
		<!-- button -->
		<div class="button-area ">
			<input type="button" class="btn" value="조회" id="search" onclick="#">
			<input type="button" class="btn" value="수정" id="update"> <input
				type="button" class="btn" value="삭제" id="deleteOne"> <input
				type="button" class="btn" value="탈퇴" id="Unsubscribe">

		</div>
		<!-- button ----------------------------------------------------------------->
		<!-- 관리 폼 -->
		<div class="container">
			<form action="#" name="reg_frm">
				<div class="form-group">
					<label for="intLevel">등급</label> <select name="intLevel"
						id="intLevel">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
					</select>
				</div>
				<div class="form-group">
					<label for="recommend">이메일</label> <input type="text" name="email"
						id="email" placeholder="이메일을 입력 하세요." maxlength="320">
				</div>
				<div class="form-group">
					<label for="reg_dt">등록일</label> <input type="text" name="reg_dt"
						id="reg_dt" placeholder="등록일을 입력 하세요." maxlength="20">
				</div>
			</form>
		</div>

		<!-- 관리 폼 end --------------------------------------------------------------->
		<fmt:formatNumber value="${totalCnt}" pattern="#,##0" />
	</div>

	<!-- ---------------------------------------------------------------------- -->
	<!-- 검색구분 -->

	<p id="pagetop" class="inner">
		<a href="#">↑</a>
	</p>
	<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
	<script src="${CP}/resources/js/util.js"></script>
	<script>
    (function($) {
      // クリックされたメニューを開く関数
      function openMenu($menu) {
        $menu.addClass('active');
        $menu.find('ul').slideDown('slow');
      }

      // クリックされたメニューを閉じる関数
      function closeMenu($menu) {
        $menu.removeClass('active');
        $menu.find('ul').slideUp('slow');
      }

      $('.cate ul').hide();

      // すべてのメニューを開く
      $('.accordion .cate').each(function() {
        openMenu($(this));
      });

      $('.cate .menu .subopen').click(function(event) {
        event.stopPropagation(); // イベントが親要素に伝播しないようにする

        var $parent = $(this).parent().parent();
        var isActive = $parent.hasClass('active');

        // クリックされたメニューが閉じている場合は開く、開いている場合は閉じる
        if (isActive) {
          closeMenu($parent);
        } else {
          openMenu($parent);
        }
      });
    })(jQuery);
  </script>
</body>
</html>