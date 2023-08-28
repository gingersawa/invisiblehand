   
//(좋아요 높은순 5개)커뮤니티 글 출력 관련
    $(document).ready(function() {
        // 페이지가 로드되면 초기값 '10'으로 게시글 불러오기
        loadBoardData('10');
  
    function loadBoardData(categoryNumber) {
        $.ajax({
            url: '/ehr/main/doRetrieve.do',
            type: 'GET',
            data: {
                categoryNumber: categoryNumber
            },
            dataType: 'json',
            success: function(result) {            
         
                // AJAX 요청이 성공했을 때 실행되는 부분
                // result에 받아온 데이터가 들어있음
                // 이 데이터를 가지고 게시글 목록을 업데이트하는 로직을 작성  
                console.log("데이터를 가져옴");
                console.log(result);
                updateTable(result); // 테이블 업데이트 함수 호출
                
    
            },
            error: function(xhr, status, error) {
                // AJAX 요청이 실패했을 때 실행되는 부분
                console.log("데이터를 불러오지 못했습니다. 오류 메시지:", error);
                console.error(error);
            }
        });
    };
    
    function updateTable(data) {
        let tableBody = document.getElementById('tableBody');
        let newTableBody = document.createElement('tbody'); // 새로운 tbody 엘리먼트 생성
        
        // 받아온 데이터를 테이블에 추가
        data.forEach(function(item, index) {
        	      	       	 
            let row = '<tr>' +
                      '<td>' + item.num + '</td>' +
                      '<td><a href="/ehr/post/doSelectOne.do?categoryNumber=' + item.categoryNumber + '&postNumber=' + item.postNumber + '">' + item.title + '</a></td>' +                     
                      '<td>' + item.nickname + '</td>' +
                      '<td>' + item.writtenDate + '</td>' + 
                      '<td>' + item.views + '</td>' +
                      '<td>' + item.likes + '</td>' +
                      '</tr>';
            newTableBody.innerHTML += row;
        });
        
        // 기존 tbody 엘리먼트를 새로운 tbody로 교체
        tableBody.parentNode.replaceChild(newTableBody, tableBody);
    }
   }); 