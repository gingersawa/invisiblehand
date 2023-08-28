    //뉴스 관련
    $(document).ready(function () {
	
      $.ajax({
        type: "GET",
        url: "/ehr/main/doNaverSearch.do",
        asyn:"true",
        dataType: "json",
        data: {
          query: "중소기업"
        },
        success: function (data) {
            console.log("success data:", data); // 서버에서 반환한 JSON 데이터를 그대로 출력
              // 서버에서 반환한 JSON 데이터를 그대로 사용
              let newsHeadlines = $("#newsHeadlines");
              let newItems = data.items;
              
              
              // data를 배열로 가정하고 forEach 메서드를 이용하여 각 뉴스 아이템에서 헤드라인과 URL을 추출하여 HTML로 구성
              newItems.forEach(function (item) {
                  let newsTitle = (item.title).replace(/<\/?b>/g, ''); //볼드체 제거                    
                  let newsUrl = item.link;
                
                console.log("newsTitle"+newsTitle);
                console.log("newsUrl"+newsUrl);
            	   
                // 생성한 HTML을 동적으로 추가
                newsHeadlines.append("<li><a href='"+newsUrl+"' target='_blank' class=link>'"+newsTitle+"'</a></li>");                 
            	});

             	  noticeRollingEffect();

        },
        error: function (xhr, status, error) {
        	  console.log("데이터를 불러오지 못했습니다. 오류 메시지:", error);
        	}
      });

      //함수로 변경
      function noticeRollingEffect() {
        let height = $(".news").height(); //공지사항의 높이값
        let num = $(".rolling li").length; // 공지사항의 개수
        let max = height * num; //총 높이
        let move = 0; //초기값을 설정
        function noticeRolling() {
          move += height; // move = move + height 값
          $(".rolling").animate({ "top": -move }, 600, function () {
               if (move >= max) { //if문을 통해 최대값보다 top값을 많이 올렸다면 다시
              $(this).css("top", 0); //0으로
              move = 0; //초기값도 다시 0으로 
            };     
          });
        };
        noticeRollingOff = setInterval(noticeRolling, 3000); //1000 = 1초마다 함수 실행
        $(".rolling").append($(".rolling li").first().clone()); //마지막이 안보이므로 clone을 통해 첫번째li 복사
      }    
    });