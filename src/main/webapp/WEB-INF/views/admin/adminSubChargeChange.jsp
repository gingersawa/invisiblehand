<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/common.css">
<style>

/* 新しいスタイル */
.additional-text {
  /* 追加テキストのスタイルを設定 */
  position: absolute;
  top: 0;
  right: 0; /* 追加テキストの位置を調整 */
  bottom: 0;
  left: 0;
  display: flex;
  align-items: center;
  justify-content: center; /* 水平方向に中央揃え */
  color: #000;
  font-weight: bold;
}

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

.cate ul {
  display: none;
}

.cate.active ul {
  display: block;
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
<title>보이지 않는 손 레이아웃</title>
</head>
<body>
  <span class="additional-text">구독제 요금 변경</span>

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
  <p id="pagetop" class="inner">
    <a href="#">↑</a>
  </p>
  <script src="../resources/js/jquery-3.7.0.js"></script>
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
      })(jQuery); </script>
</body>
</html>