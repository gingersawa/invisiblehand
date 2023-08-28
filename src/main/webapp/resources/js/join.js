$(document).ready(function() {
	
  	var pwCheck = false;
//-----------이름----------///
  	$("#name").keyup(function(){
		var name = $.trim($("#name").val());
		
		// [가-힣]{2,10}
		if(name.length < 2){
	    $("#nameCheckDiv").removeClass("alert-success");
	    $("#nameCheckDiv").addClass("alert-danger");
	    $("#nameCheckDiv").text("이름은 2자 이상 입력해주세요.");
	    return;
	  } else if(name.length > 20){
	    $("#nameCheckDiv").removeClass("alert-success");
	    $("#nameCheckDiv").addClass("alert-danger");
	    $("#nameCheckDiv").text("이름은 20자 이내로 입력해주세요.");
	    return;
	  } else if(/^[가-힣]+$/.test(name) == false){
	    $("#nameCheckDiv").removeClass("alert-success");
	    $("#nameCheckDiv").addClass("alert-danger");
	    $("#nameCheckDiv").text("이름의 형식이 올바르지 않습니다.");
	    return;
	  } else {
	    $("#nameCheckDiv").text("");
	  }
		
		
	});
  	
//-----------아이디----------/// 	  
	// 아이디 중복 체크 버튼
  
  	$("#id-check-btn").click(function() {
    var id = $.trim($("#ID").val());
    
    $.ajax({
      type: "POST",
      url: "/ehr/login/idCheck.do",
      asyn:"true",
      dataType:"html",
      data: {
      	id: id
      },
      success: function(data){ // 통신 성공
    	  let parsedJson = JSON.parse(data);
    	  // 중복 아이디
    	  if ("1" === parsedJson.msgId) {
    	    alert(parsedJson.msgContents);
    	  } else {
    	    if (id.length < 4) {
    	      alert("아이디는 4자 이상 입력해주세요.");
    	    } else if (id.length > 20) {
    	      alert("아이디는 20자 이내로 입력해주세요.");
    	    } else if (/^[A-Za-z0-9]+$/.test(id) === false) {
    	      alert("아이디 형식이 올바르지 않습니다.");
    	    } else {
    	        alert(parsedJson.msgContents);
    	    }
          }
        },
        error: function(data) { // 실패시 처리
          console.log("error: " + data);
        }
      }); // ajax
    }); // idCheckBtn
    

  
  
/////////////////////////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////////////////////////
  $("#email").keyup(function(){
	  var email = $.trim($("#email").val());

    // 이메일 정규식 패턴
    var emailPattern = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
    
    // 이메일 유효성 검사
    if (!emailPattern.test(email)) {
        $("#emailCheckDiv").removeClass("alert-success");
        $("#emailCheckDiv").addClass("alert-danger");
        $("#emailCheckDiv").text("유효한 이메일 주소를 입력해주세요.");
        $("#emailCheckDiv").css("color", "red");
    } else {
    // 이메일 유효성 검사 통과
    $("#emailCheckDiv").removeClass("alert-danger");
    $("#emailCheckDiv").addClass("alert-success");
    $("#emailCheckDiv").text("");
    }

 }); // email keyup()
 
 $("#emailCheckBtn").click(function() {
	    var email = $.trim($("#email").val());
	    
	    $.ajax({
	      type: "POST",
	      url: "/ehr/login/emailCheck.do",
	      asyn:"true",
	      dataType:"html",
	      data: {
	        email: email
	      },
	      success: function(data){ // 통신 성공
	        let parsedJson = JSON.parse(data);
	        // 중복 이메일
	        if ("1" === parsedJson.msgId) {
	          alert(parsedJson.msgContents);
	        } else {
	        	if (email.length < 1) {
	        		alert("이메일을 입력해주세요.")
	        	} else if (/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/.test(email) === false) {
	            alert("이메일 형식이 올바르지 않습니다.");
	          } else {
	              alert(parsedJson.msgContents);
	          }
	          }
	        },
	        error: function(data) { // 실패시 처리
	          console.log("error: " + data);
	        }
	      });
	    }); // emailCheckBtn
 
    


/////////////////////////////////////////////////////////////////////////////////////

      $("#pw, #pw2").keyup(validateForm);

      function clearPasswordError() {
        $("#pwCheckDiv").empty();
        $("#pwCheckDiv").css("color", "");
        $("#pw2CheckDiv").empty();
        $("#pw2CheckDiv").css("color", "");
      }

      function validateForm() {
        clearPasswordError();

        var pw = $("#pw").val();
        var pw2 = $("#pw2").val();

        if (pw === "") {
          $("#pwCheckDiv").empty();
          return;
        }

        if (pw.length < 8 || pw.length > 20) {
          $("#pwCheckDiv").text("비밀번호는 8자 이상 20자 이하여야 합니다.");
          $("#pwCheckDiv").css("color", "red");
          pwCheck = false;
        } else {
          $("#pwCheckDiv").text("");
          pwCheck = true;
        }

        if (pw2 === "") {
          $("#pw2CheckDiv").empty();
          return;
        }

        if (pw !== pw2) {
          $("#pw2CheckDiv").text("비밀번호가 일치하지 않습니다.");
          $("#pw2CheckDiv").css("color", "red");
          pwCheck = false; // 비밀번호 확인 실패
        } else {
            $("#pw2CheckDiv").removeClass("alert-danger");
            $("#pw2CheckDiv").addClass("alert-success");
            $("#pw2CheckDiv").text("비밀번호가 일치합니다.");
            $("#pw2CheckDiv").css("color", "blue");
            pwCheck = true;

          }
        }
              
//////////////////////////////////////////////////////////////////////////////////////              
	    $("#height").keyup(function(){
	  var height = $.trim($("#height").val());
	
	  // 입력 값이 소수점 이하 한 자리까지만 유효한지 검증
	  var isValid = /^\d{1,3}(\.\d{0,1})?$/.test(height);
	
	  // 유효하지 않은 경우, 입력 값을 수정하여 업데이트
	  if (!isValid) {
	          var validValue = height.match(/^\d{1,3}(\.\d{0,1})?$/);
	          if (validValue) {
	            $("#height").val(validValue[0]);
	          } else {
	            $("#height").val('');
	          }
	        }
	      });
	
	
	    $("#weight").keyup(function(){
	        var weight = $.trim($("#weight").val());
	      
	        // 입력 값이 소수점 이하 한 자리까지만 유효한지 검증
	        var isValid = /^\d{1,3}(\.\d{0,1})?$/.test(weight);
	      
	        // 유효하지 않은 경우, 입력 값을 수정하여 업데이트
	        if (!isValid) {
	          var validValue = weight.match(/^\d{1,3}(\.\d{0,1})?$/);
	          if (validValue) {
	            $("#weight").val(validValue[0]);
	          } else {
	            $("#weight").val('');
	          }
	        }
	      });
	    
	    $("#targetWeight").keyup(function(){
	        var targetWeight = $.trim($("#targetWeight").val());
	      
	        // 입력 값이 소수점 이하 한 자리까지만 유효한지 검증
	        var isValid = /^\d{1,3}(\.\d{0,1})?$/.test(targetWeight);
	      
	        // 유효하지 않은 경우, 입력 값을 수정하여 업데이트
	        if (!isValid) {
	          var validValue = targetWeight.match(/^\d{1,3}(\.\d{0,1})?$/);
	          if (validValue) {
	            $("#targetWeight").val(validValue[0]);
	          } else {
	            $("#targetWeight").val('');
	          }
	        }
	      });
              
              
              
/////////////////////////////////////////////////////////////////////////////////////              

     function submitForm() {
  	  // 폼 제출
  	  $("#writeForm")[0].submit();
  	}
  	
      $("#writeForm").submit(function(event){
         event.preventDefault();
          
         
      // 중복 아이디 체크
         var id = $.trim($("#id").val());
           $.ajax({
            type: "POST",
            url: "/ehr/login/idCheck.do",
            asyn: "true",
            dataType: "html",
            data: {
              id: id
            },
            success: function(data) { // 통신 성공
              let parsedJson = JSON.parse(data);
              // 중복 아이디
              if ("1" === parsedJson.msgId) {
                alert(parsedJson.msgContents);
                $("#id").focus();
              }
            },
            error: function(data) { // 실패시 처리
              console.log("error: " + data);
            }
          }); // ajax

          
         // 중복 이메일 체크 
         var email = $.trim($("#email").val());
           $.ajax({
               type: "POST",
               url: "/ehr/login/emailCheck.do",
               asyn: "true",
               dataType: "html",
               data: {
                 email: email
               },
               success: function(data) { // 통신 성공
                 let parsedJson = JSON.parse(data);
                 // 중복 이메일
                 if ("1" === parsedJson.msgId) {
                   alert(parsedJson.msgContents);
                   $("#email").focus();
                 }
               },
               error: function(data) { // 실패시 처리
                 console.log("error: " + data);
               }
             }); // ajax 
             
             
         // 비밀번호 체크 
         if(!pwCheck){
           alert("비밀번호를 확인해주세요.");
           $("#pw").focus();
           return;
         }
         
         
          // Submit the form using AJAX
          $.ajax({
            url: "${CP}/login/signUp.do",
            method: "POST",
            data: $("#writeForm").serialize(),
            success: function(result) {
              // Handle successful form submission
              alert("회원가입이 완료되었습니다.");
              // Redirect to the next page
              window.location.href = "${CP}/login/loginView.do";
            },
            error: function(xhr, status, error) {
              // Handle form submission error
              alert("회원가입을 실패했습니다.: " + error);
              // Clear the form fields
              $("#id").val("");
              $("#pw").val("");
              $("#pw2").val("");
              // Reset the validation status
              pwCheck = false;
            }
          });
      });
                
                
////////////////////////////////////////////////////////////////////////
              // 취소버튼 -> 이전 페이지
               $("#cancel").on("click", function(e) {
                   e.preventDefault(); // 기본 동작 중단
                   if (confirm("작성을 중단하시겠습니까?") == true){
                	   history.back();
                   } else {
                     e.stopPropagation();
                   }
              });
              
////////////////////////////////////////////////////////////////////////
}); // document.ready
