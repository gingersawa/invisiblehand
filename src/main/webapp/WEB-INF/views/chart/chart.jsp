<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/chart.css">
<title>보이지 않는 손 레이아웃</title>
</head>
<body>
  <div class="h60px"></div>
  <div class="container-1400">
    <div class="wrap-1000">
        <!-- *---차트 카테고리---* -->
      <div class="category_wrap">
        <div class="categorybox active" data-tab="tab1">
          <div class="chart01">
          <p>chart01</p>
          </div>
        </div>
        <div class="categorybox" data-tab="tab2">
          <div class="chart02">
          <p>chart02</p>
          </div>
        </div>
        <div class="categorybox" data-tab="tab3">
          <div class="chart03">
          <p>chart03</p>
          </div>
        </div>
        <div class="categorybox" data-tab="tab4">
          <div class="chart04">
          <p>chart04</p>
          </div>
        </div>
      </div><!-- **---카테고리랩 End---** -->

      <!-- 차트 영역 1234 -->

      <div class="category-title">
        <p>
          chart01
        </p>
      </div>
      <div class="tab-box tab1 active">
        <div class="sector">
          <p>종목선택<i class='fas fa-play fa-xs fa-rotate-90' style='color:#979797; font-size: 10px;'></i></p>
          <ul class="hide">
            <li>메뉴1-1</li>
            <li>메뉴1-2</li>
            <li>메뉴1-3</li>
            <li>메뉴1-4</li>
            <li>메뉴1-5</li>
            <li>메뉴1-6</li>
          </ul>
        </div>
        <div class="chart-area">
          <div class="chart-login">
            <div class="desc">
              <p>인공지능이 예측한 자료 열람하기</p>
            </div>
            <div class="btn">
              <a href="/ehr/resources/hand-login.html"><span>로그인</span></a>
            </div>
          </div>
        </div>
        <div class="explain">
          <p>
            때에, 것은 날카로우나 수 그들은 것이다.
            같으며, 너의 청춘을 들어 위하여서.
            온갖 되는 귀는 능히 길지 사막이다. 것이 그들의 맺어,
            이는 불러 살았으며, 것이다. 같이 천고에 불어 타오르고 대한 살았으며,
            않는 전인 운다. 무한한 없으면 옷을 피가 영락과 위하여 있는가? 뜨고,
            따뜻한 할지니, 인류의 낙원을 더운지라 살 풀이 위하여서.
            풀이 풀밭에 인간은 아름다우냐? 이상, 청춘의 위하여서 보라.
            하는 별과 설레는 안고, 싹이 이성은 밥을 뜨거운지라,
            인류의 봄바람이다. 싸인 열락의 품고 무한한 이상 끓는 힘있다.
          </p>
        </div>
      </div>

      <div class="tab-box tab2">
      </div>
      
      <div class="tab-box tab3">
      </div>
      
      <div class="tab-box tab4">
      </div>

    </div><!-- **---wrap End---** -->
  </div> <!-- **---container End---** -->




<script src="js/jquery-3.7.0.js"></script>
<script>
$(".categorybox").click(function() {
    $(this).siblings().removeClass("active");
    $(this).addClass("active");
   // $("html, body").scrollTop($(".tab-box").height());
    let clickTab = $(this).attr("data-tab");
    $(".tab-box").removeClass("active");
    $("." + clickTab).addClass("active");
});
</script>
</body>
</html>