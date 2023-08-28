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

  <div class="container-1200 con-main">
    <div class="wrap-1000">
        <div id="line_chart1"></div>

    </div>
    <!-- **---wrap End---** -->
  </div>
  <!-- **---container End---** -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="../resources/js/jquery-3.7.0.js"></script>
<script>
 //차트 관련
 $(document).ready(function () {      
	 
	 //날짜 변환 함수
	 function formatDate(date) {
		  let year = date.getFullYear();
		  let month = (date.getMonth() + 1).toString().padStart(2, '0');
		  return year + '.' + month;
		}
	 
	 
	  let mainCategory = "비제조업";
	  let subCategory  = "-";
	  
	 function submitbutton() {
	         $("#submitButton").click(function () {
	             // 선택된 값 가져오기
	             let selectedMainCategory = $("#mainCategorySelect").val();
	             let selectedSubCategory = $("#subCategorySelect").val();

	             mainCategory = selectedMainCategory; // mainCategory 값을 선택한 값으로 업데이트

	             loadChartData(selectedMainCategory, selectedSubCategory);
	         });
	     }
	     
    function loadChartData(selectedMainCategory, selectedSubCategory) {

        $.ajax({
            url: '/ehr/chart/chart01.do',
            type: 'GET',
            data: { 
             mainCategory: selectedMainCategory,
             subCategory : selectedSubCategory
            }, 
            dataType: 'json',
            success: function(data) {            
                console.log("데이터를 가져옴");
                console.log(data);
                let chartData = [];
                chartData.push(["Year","경기전반","고용수준","내수판매","수출","영업이익","자금사정"]);
                
                if (selectedMainCategory === '제조업') {
                  chartData[0].push("원자재조달사정","생산설비수준","제품제고수준","생산");
                }
                
                for (let i = 0; i < data.length; i++) {
                  let row = [];
                  let date = new Date(data[i][0]);
                  let formattedDate = formatDate(date); // 날짜를 "YYYY.MM" 형식으로 변환
                  row.push(formattedDate);
                  row.push(data[i][3]);
                  row.push(data[i][4]);
                  row.push(data[i][5]);
                  row.push(data[i][6]);
                  row.push(data[i][7]);
                  row.push(data[i][8]);

                  if (selectedMainCategory === '제조업') {
                    row.push(data[i][9]);
                    row.push(data[i][10]);
                    row.push(data[i][11]);
                    row.push(data[i][12]);
                  }
                  
                  chartData.push(row);
                }
                
                console.log(chartData);
                drawChart(chartData);
                                
    
            },  //success
            error: function(xhr, status, error) {
                // AJAX 요청이 실패했을 때 실행되는 부분
                console.log("데이터를 불러오지 못했습니다. 오류 메시지:", error);
                console.error(error);
            } //error
        }); //ajax
    } //loadChartData
  
    //구글 차트 api
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(function() {
        loadChartData(); // 일단 loadChartData 호출
        submitbutton(); // submitbutton 함수를 호출하여 이벤트 등록
    });
    
    
   
    
    
    function drawChart(data) {
        const originalData1 = new google.visualization.arrayToDataTable(data);

        let chartData1 = originalData1.clone();
          
        let options1 = {
          /* title: '중소기업 경기전망조사(SBHI)', */
        
          width : 1000,
          height : 500,
          chartArea: {
              left: 100, // 왼쪽 공백 크기
              right:100, // 오른쪽 공백 크기
              top: 50,     // 위쪽 공백 크기
              width: '60%',  // 차트 영역의 너비 설정 (70%로 설정)
              height:'70%' // 차트 영역의 높이 설정 (70%로 설정)
            },
            
            chartArea: {
                backgroundColor: {
                    fill: '#222',
                },
            },
            backgroundColor: {
                fill: '#222',
            },
          titleTextStyle: { color: '#fff' },
          hAxis: {
              textStyle: { fontSize: 15, color: '#fff' },
              baselineColor: '#fff',
          },
          vAxis: {
              //title: 'title',
              textStyle: { color: '#fff' },
              ticks: [0, 20, 40, 60, 80, 100, 120, 140, 160],
              format: '###',
          },
          legend: {
            textStyle: { position: 'top', fontSize: 13, color: '#fff' },
          },
          series: {
              0: { color: '#F0A57C', lineWidth: 2, visibleInLegend: true },
              1: { color: '#91FFC3', lineWidth: 2, visibleInLegend: true }
          }
        }; //options1

        let chart1 = new google.visualization.LineChart(document.getElementById('line_chart1'));
        
        //차트 초기화//
        let hiddenSeries = {}; // 숨겨진 시리즈를 추적하기 위한 객체
        // "Restore" 버튼 클릭 이벤트 리스너
        $('#restoreButton').click(function () {
          for (let seriesIndex in hiddenSeries) {
            for (let i = 0; i < chartData1.getNumberOfRows(); i++) {
              chartData1.setValue(i, parseInt(seriesIndex) + 1, originalData1.getValue(i, parseInt(seriesIndex) + 1));
              console.log("parseInt(seriesIndex) : "+ parseInt(seriesIndex))
            }
          }
          chart1.draw(chartData1, options1);
          
        });
        hiddenSeries = {}; // 숨겨진 시리즈 리스트 초기화
        //차트 초기화 end//
        
        // 이벤트 리스너 1 추가
        google.visualization.events.addListener(chart1, 'click', function(target) {
          if (target.targetID.match(/legendentry#\d+/)) {
            let index = parseInt(target.targetID.slice(12));
        
            for (let i = 0; i < chartData1.getNumberOfRows(); i++) {
              let value = chartData1.getValue(i, index + 1);
        
              if (value === null) {
                chartData1.setValue(i, index + 1, originalData1.getValue(i, index + 1));
                delete hiddenSeries[index]; // 숨겨진 시리즈에서 제거
              } else {
                chartData1.setValue(i, index + 1, null);
              }
            }            
            chart1.draw(chartData1, options1);
            hiddenSeries[index] = true; // 숨겨진 시리즈로 추가
          }
        }); //이벤트 리스터 1
        
        chart1.draw(chartData1, options1);
    } //funciton drawChart

}); //차트 관련 doucument


 </script>
</body>
</html>