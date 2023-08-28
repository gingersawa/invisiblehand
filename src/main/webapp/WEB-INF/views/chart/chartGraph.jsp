<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/ehr/favicon.ico">
<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/chart.css">
<title>보이지 않는 손 레이아웃</title>
</head>
<body>
  <!-- *---container Start---* -->

  <div class="h60px"></div>
  <div class="container-1200 con-main">
    <div class="wrap-1000">
      <!-- *---차트 카테고리---* -->
      <div class="category_wrap">
        <div class="categorybox active" data-tab="tab1" id="chart01">
          <div class="chart01">
            <p>중소기업 경기전망조사(SBHI)</p>
          </div>
        </div>
        <div class="categorybox" data-tab="tab2" id="chart02">
          <div class="chart02">
            <p>chart02</p>
          </div>
        </div>
        <div class="categorybox" data-tab="tab3" id="chart03">
          <div class="chart03">
            <p>chart03</p>
          </div>
        </div>
        <div class="categorybox" data-tab="tab4" id="chart04">
          <div class="chart04">
            <p>chart04</p>
          </div>
        </div>
      </div>
      <!-- **---카테고리랩 End---** -->

      <!-- 차트 영역 1234 -->
      <div class="tab-box tab1 active" id="chart01">
      <div>
          <jsp:include page="chart01.jsp"/>
      </div>
       
       <div class="chart-nav">
          <select id="mainCategorySelect" name="mainCategory">
                <option value="비제조업" selected="selected">비제조업</option>
                <option value="제조업">제조업</option>
          </select>
          <select id="subCategorySelect" name="subCategory">
            <option value="-" selected="selected">평균</option>
            <option value="건설업">건설업</option>
            <option value="교육서비스업">교육서비스업</option>
            <option value="도매 및 소매업">도매 및 소매업</option>
            <option value="부동산업 및 임대업">부동산업 및 임대업</option>
            <option value="사업시설관리 및 사업지원서비스업">사업시설관리 및 사업지원서비스업</option>
            <option value="서비스업">서비스업</option>
            <option value="수리 및 기타개인서비스업">수리 및 기타개인서비스업</option>
            <option value="숙박 및 음식점업">숙박 및 음식점업</option>                                           
            <option value="예술,스포츠 및 여가관련서비스업">예술,스포츠 및 여가관련서비스업</option>
            <option value="운수업">운수업</option>
            <option value="전문,과학 및 기술서비스업">전문,과학 및 기술서비스업</option>
            <option value="출판,영상,방송통신 및 정보서비스업">출판,영상,방송통신 및 정보서비스업</option>
          </select>
          <button id="submitButton" style="display: none;">Submit</button>
        </div>
      </div>
     
      <div class="tab-box tab2" id="chart02">
        <div id="line_chart2"></div>
      </div>

      <div class="tab-box tab3" id="chart03">
        <div id="line_chart3"></div>
      </div>

      <div class="tab-box tab4" id="chart04">
        <div id="chart_div"></div>
      </div>

    </div>
    <!-- **---wrap End---** -->
  </div>
  <!-- **---container End---** -->


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="../resources/js/jquery-3.7.0.js"></script>
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
<script>
// mainCategorySelect 요소를 가져옴
const mainCategorySelect = document.getElementById("mainCategorySelect");

// subCategorySelect 요소옴
const subCategorySelect = document.getElementById("subCategorySelect");
			subCategorySelect.addEventListener("change", function() {
			    // 서브 카테고리 선택이 변경될 때마다 submit 버튼을 누른 것처럼 처리
			    submitButton.click();
			});
// mainCategorySelect 값이 변경될 때마다 실행되는 함수를 정의
mainCategorySelect.addEventListener("change", function() {
    // 현재 선택된 mainCategorySelect의 값 가져오기
    const selectedMainCategory = mainCategorySelect.value;
    
    // subCategorySelect의 내용을 변경
    if (selectedMainCategory === "비제조업") {
        // 비제조업이 선택된 경우의 subCategory 목록을 설정
        subCategorySelect.innerHTML = `
        	<option value="-" selected="selected">평균</option>
            <option value="건설업">건설업</option>
            <option value="교육서비스업">교육서비스업</option>
            <option value="도매 및 소매업">도매 및 소매업</option>
            <option value="부동산업 및 임대업">부동산업 및 임대업</option>
            <option value="사업시설관리 및 사업지원서비스업">사업시설관리 및 사업지원서비스업</option>
            <option value="서비스업">서비스업</option>
            <option value="수리 및 기타개인서비스업">수리 및 기타개인서비스업</option>
            <option value="숙박 및 음식점업">숙박 및 음식점업</option>                                           
            <option value="예술,스포츠 및 여가관련서비스업">예술,스포츠 및 여가관련서비스업</option>
            <option value="운수업">운수업</option>
            <option value="전문,과학 및 기술서비스업">전문,과학 및 기술서비스업</option>
            <option value="출판,영상,방송통신 및 정보서비스업">출판,영상,방송통신 및 정보서비스업</option>`;
    } else if (selectedMainCategory === "제조업") {
        // 제조업이 선택된 경우의 subCategory 목록을 설정
        subCategorySelect.innerHTML = `
        	 <option value="-" >평균</option>
        	 <option value="식료품">식료품</option>
        	 <option value="음료">음료</option>
        	 <option value="섬유제품 의복제외">섬유제품 의복제외</option>
        	 <option value="의복 의복액세서리 및 모피제품">의복 의복액세서리 및 모피제품</option>
        	 <option value="가죽 가방 및 신발">가죽 가방 및 신발</option>
        	 <option value="목재 및 나무제품">목재 및 나무제품</option>
        	 <option value="펄프 종이 및 종이제품">펄프 종이 및 종이제품</option>
        	 <option value="인쇄 및 기록매체">인쇄 및 기록매체</option>
        	 <option value="화학물질 및 화학제품">화학물질 및 화학제품 </option>
        	 <option value="의료용 물질 및 의약품">의료용 물질 및 의약품</option>
        	 <option value="고무제품 및 플라스틱제품">고무제품 및 플라스틱제품</option>
        	 <option value="비금속 광물제품">비금속 광물제품</option>
        	 <option value="1차 금속">1차 금속</option> 
        	 <option value="금속가공제품">금속가공제품</option>
        	 <option value="전자부품 컴퓨터 영상 음향 및 통신장비">전자부품 컴퓨터 영상 음향 및 통신장비</option>
        	 <option value="의료 정밀 광학기기 및 시계">의료 정밀 광학기기 및 시계</option>
        	 <option value="전기장비">전기장비</option> 
        	 <option value="기타 기계 및 장비">기타 기계 및 장비</option>
        	 <option value="자동차 및 트레일러">자동차 및 트레일러</option> 
        	 <option value="기타 운송장비">기타 운송장비</option>
        	 <option value="가구">가구</option>
        	 <option value="기타 제품">기타 제품</option>
            `;
    }

    // 초기 선택값에 따라서 서브 카테고리 선택 및 submitButton을 초기화
    subCategorySelect.value = "-";
    submitButton.style.display = "none";
    submitButton.click();
});


</script>
</body>
</html>