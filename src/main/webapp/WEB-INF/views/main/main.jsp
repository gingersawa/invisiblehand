<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="shortcut icon" type="image/x-icon" href="/ehr/favicon.ico">
  <link rel="stylesheet" href="../resources/css/common.css">
  <link rel="stylesheet" href="../resources/css/chart.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />
  <title>보이지 않는 손 레이아웃</title>
</head>
<body>

  <!-- *---container Start---* -->
  <div class="h60px"></div>
  <div class="container-1400 con-main">
    <div class="wrap-1000 main-wrap">
    
      <h4>주요 뉴스 헤드라인</h4>  
      <section class="sec01 sec-news">
        <div class="news-slide">
          <div class="news">
            <ul class="rolling" id="newsHeadlines">
              <!-- 여기에 동적으로 헤드라인이 추가됩니다. -->
            </ul>
          </div>
        </div>
      </section>
      
      <h4>중소기업 경기전망조사(SBHI)</h4>
      <section class="sec02 sec-chart">
        <div class="chart-nav">
				  <select id="mainCategorySelect" name="mainCategory">
						    <option value="비제조업" selected="selected">비제조업</option>
						    <option value="제조업">제조업</option>
					</select>
					<button id="restoreButton">모두 보기</button> <!-- Restore 버튼 추가 -->
				</div>
				
				<c:choose>
	        <c:when test="${null != sessionScope.member && not empty sessionScope.member}">
						<div class="chart-wrapper">
						  <jsp:include page="/WEB-INF/views/chart/chart01.jsp"/>
						</div>
	        </c:when>
	        <c:otherwise>
						<div class="chart-wrapper" style="opacity: 0.5; filter: blur(5px);" onclick='doLogin()'>
						  <jsp:include page="/WEB-INF/views/chart/chart01.jsp"/>
						</div>
	        </c:otherwise>
	      </c:choose>
	
      </section>
      
      <h4>추천 게시글</h4>
      <section class="sec03 sec-board">
       
	      <div>
	        <a href = "${CP}/post/postList.do?categoryNumber=10">자유게시판으로 이동</a>	        	        
	        <a href = "${CP}/post/postList.do?categoryNumber=30">Q&A 게시판으로 이동</a>	     
	      </div>
	      
	      <div>
		       <table class="main-post-table">
		          <thead class="main-post-thead">
		            <tr>
		            <th>No.</th>
		            <th>제목</th>
		            <th>글쓴이</th>
		            <th>작성일</th>
		            <th>조회수</th>
		            <th>추천수</th>
		            </tr>
		          </thead>
		          <tbody id="tableBody" class="main-post-tbody">
							<!-- 여기에 데이터가 동적으로 추가될 예정입니다 -->
							</tbody>							
						</table>	
	      </div>
      </section>
    </div>
    <!-- **---wrap End---** -->
    <div class="rank-area">
    <h3>업종별 변동 현황</h3>
        <table class="main-rank-table">
            <thead>
                <tr>
                <th>등수</th>
                <th>업종명</th>                
                <th>등수변동</th>
                <th>화살표</th>
                </tr>
           </thead>
           <tbody id="rankBody">
            <!-- 여기에 데이터가 동적으로 추가될 예정입니다 -->
           </tbody>
        </table>   
    </div>
  </div>
  <!-- **---container End---** -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script src="../resources/js/jquery-3.7.0.js"></script>
  <!-- main페이지 기능 관련 js -->
  <script src="../resources/js/mainBoard.js"></script> <!-- 게시판 -->
  <script src="../resources/js/mainNews.js"></script>  <!-- 뉴스 -->
  <script src="../resources/js/mainRank.js"></script>  <!-- 랭킹 -->
  <!-- main페이지 기능 관련 js end -->
  
<script>
const mainCategorySelect = document.getElementById("mainCategorySelect");
mainCategorySelect.addEventListener("change", function() {
    submitButton.click();
});

function doLogin() {
 alert("로그인 후 이용해주세요");
 location.href = "../member/memberLogin.do";
}
</script>
</body>
</html>
