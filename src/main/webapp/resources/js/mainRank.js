  $(document).ready(function() { 
	  updateTable()
	    function updateTable(data) {
	        let tableBody = document.getElementById('rankBody');
	        let newTableBody = document.createElement('tbody'); // 새로운 tbody 엘리먼트 생성
	        $.ajax({
	            url: '/ehr/main/Rank.do',
	            type: 'GET',
	            //data: {                      },
	            dataType: 'json',
	            success: function(data) {            
	                console.log("데이터를 가져옴");
	                console.log(data);
	                data.forEach(function(item,index){
	                    let row = '<tr>' + 
	                      '<td>' + item.currentRank + '</td>' +
	                      '<td>' + item.name + '</td>' +                     
	                      '<td>' + item.changeRank + '</td>' +
	                      '<td>' + item.changeRank + '</td>' +
	                      '</tr>';
	            newTableBody.innerHTML += row;

	        });
	        
	        // 기존 tbody 엘리먼트를 새로운 tbody로 교체
	        tableBody.parentNode.replaceChild(newTableBody, tableBody);
	    
	            },  //success
	            error: function(xhr, status, error) {
	                // AJAX 요청이 실패했을 때 실행되는 부분
	                console.log("데이터를 불러오지 못했습니다. 오류 메시지:", error);
	                console.error(error);
	            } //error
	        }); //ajax
	      }
  });  