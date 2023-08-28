google.load("visualization", "1", {packages:["corechart"]});
google.charts.load('current', {'packages':['corechart']});
google.setOnLoadCallback(drawChart);

// 차트 생성
function drawChart() {
  const originalData1 = new google.visualization.arrayToDataTable([
	    ['Year', 'one', 'two','three'],
	    ['2019', 1030, 540,600],
	    ['2020', 980, 420,700],
	    ['2021', 1170, 460,800],
	    ['2022', 660, 1120,900],
	    ['2023', 1030, 540,1000]
	  ]);

  let data1 = originalData1.clone();
    
  let options1 = {
    title: '차트1',
    pointSize: 15,
    width : 1000,
    height : 500,
    titleTextStyle: { color: 'black' },
    hAxis: {
        textStyle: { fontSize: 15, color: 'black' },
        baselineColor: 'black'
    },
    vAxis: {
        title: 'title',
        ticks: [0, 500, 1000, 1500, 2000],
        format: '#,###',
    },
    legend: {
      textStyle: { position: 'top', fontSize: 13, color: 'black' },
    },
    series: {
        0: { color: '#F0A57C', lineWidth: 2, visibleInLegend: true },
        1: { color: '#91FFC3', lineWidth: 2, visibleInLegend: true }
    }
  };

  let chart1 = new google.visualization.LineChart(document.getElementById('line_chart1'));

  // 이벤트 리스너 추가
  google.visualization.events.addListener(chart1, 'click', function(target) {
    if (target.targetID.match(/legendentry#\d+/)) {
      let index = parseInt(target.targetID.slice(12));
  
      for (let i = 0; i < data1.getNumberOfRows(); i++) {
        let value = data1.getValue(i, index + 1);
  
        if (value === null) {
          data1.setValue(i, index + 1, originalData1.getValue(i, index + 1));
        } else {
          data1.setValue(i, index + 1, null);
        }
      }
  
      chart1.draw(data1, options1);
    }
  });
  
  chart1.draw(data1, options1);

  //차트2
  const originalData2 = new google.visualization.DataTable();
  originalData2.addColumn('string', 'Year');
  originalData2.addColumn('number', 'one');
  originalData2.addColumn('number', 'two');
  
  originalData2.addRows([
    ['2004', 1000, 400],
    ['2005', 1170, 460],
    ['2006', 660, 1120],
    ['2007', 1030, 540]
  ]);

  let data2 = originalData2.clone();

  let options2 = {
    title: '기업 경기 현황',
    width: 1000,
    height: 500,
    vAxis: { // 세로 
      title: 'title', // vAxis 타이틀 수정
      textStyle: { fontSize: 15, color: 'black' },
      ticks: [0, 500, 1000, 1500, 2000],
      format: '#,###',
    },
    legend: {
      textStyle: { position: 'top', fontSize: 13, color: 'black' },
    },
    series: {
      0: { color: 'red', lineWidth: 2, visibleInLegend: true },
      1: { color: 'blue', lineWidth: 2, visibleInLegend: true }
    }
  };

  let chart2 = new google.visualization.LineChart(document.getElementById('line_chart2'));

  // 이벤트 리스너 추가
  google.visualization.events.addListener(chart2, 'click', function(target) {
    if (target.targetID.match(/legendentry#\d+/)) {
      let index = parseInt(target.targetID.slice(12));

      for (let i = 0; i < data2.getNumberOfRows(); i++) {
        let value = data2.getValue(i, index + 1);

        if (value === null) {
          data2.setValue(i, index + 1, originalData2.getValue(i, index + 1));
        } else {
          data2.setValue(i, index + 1, null);
        }
      }

      chart2.draw(data2, options2);
    }
  });

  chart2.draw(data2, options2);
  
  // 차트3
	const originalData3 = new google.visualization.DataTable();
	originalData3.addColumn('string', 'Year');
	originalData3.addColumn('number', 'one');
	originalData3.addColumn('number', 'two');
  
  originalData3.addRows([
    ['2019', 1000, 400],
    ['2020', 1000, 400],
    ['2021', 1170, 460],
    ['2022', 660, 1120],
    ['2023', 1030, 540]
  ]);
  
  let data3 = originalData3.clone();
  
  let options3 = {
    title: '수입성',
    fontSize: 15,
    lineWidth: 5,
    width: 1000,
    height: 500,
    vAxis: { // 세로 
      title: 'title', // vAxis 타이틀 수정
      textStyle: { fontSize: 15, color: 'black' },
      ticks: [0, 500, 1000, 1500, 2000],
      format: '#,###',
    },
    legend: {
      textStyle: { position: 'top', fontSize: 13, color: 'black' },
    },
    series: {
      0: { color: 'black', lineWidth: 2 },
      1: { color: 'blue', lineWidth: 2 }
    }
  };
  
  let chart3 = new google.visualization.LineChart(document.getElementById('line_chart3'));
  
  // 이벤트 리스너 추가
  google.visualization.events.addListener(chart3, 'click', function(target) {
    if (target.targetID.match(/legendentry#\d+/)) {
      let index = parseInt(target.targetID.slice(12));
  
      for (let i = 0; i < data3.getNumberOfRows(); i++) {
        let value = data3.getValue(i, index + 1);
  
        if (value === null) {
          data3.setValue(i, index + 1, originalData3.getValue(i, index + 1));
        } else {
          data3.setValue(i, index + 1, null);
        }
      }
  
      chart3.draw(data3, options3);
    }
  });
  
  chart3.draw(data3, options3);
  
  //차트 4
  const originalData4 = new google.visualization.DataTable();
	originalData4.addColumn('string', 'Month');
	originalData4.addColumn('number', 'A');
	originalData4.addColumn('number', 'B');
	
	originalData4.addRows([
	  ['1월', 300, 500],
	  ['2월', 1010, 1510],
	  ['3월', 800, 1720],
	  ['4월', 1300, 800],
	  ['5월', 740, 500],
	  ['6월', 1500, 1200],
	]);
	
	let data4 = originalData4.clone();
  
  let options4 = {
    title : '이중 차트 테스트',
    fontSize: 15,
    width : 1000,
    height : 500,
    vAxis: { // 세로 
      title: 'title', // vAxis 타이틀 수정
      textStyle: { fontSize: 15, color: 'black' },
      gridlines: { color: '#8898A1' }, // 중간 선 색
      baselineColor: '8898A1',
      ticks: [0, 500, 1000, 1500, 2000],
      format: '#,###',
    },
    hAxis: {title: 'Month'},
    seriesType: 'bars',
    series: {0: {type: 'line', lineWidth: 2 }},
    colors: ['#FFCCFF', '#ccff99']
  };
  let chart4 = new google.visualization.ComboChart(document.getElementById('chart_div'));

  google.visualization.events.addListener(chart4, 'click', function(target) {
	    if (target.targetID.match(/legendentry#\d+/)) {
	      let index = parseInt(target.targetID.slice(12));
	  
	      for (let i = 0; i < data4.getNumberOfRows(); i++) {
	        let value = data4.getValue(i, index + 1);
	  
	        if (value === null) {
	          data4.setValue(i, index + 1, originalData4.getValue(i, index + 1));
	        } else {
	          data4.setValue(i, index + 1, null);
	        }
	      }
	  
	      chart4.draw(data4, options4);
	    }
	  });
  
  chart4.draw(data4, options4);
}


$(window).resize(function() {
 drawChart();
});