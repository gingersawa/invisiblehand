<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="image/favicon-32x32.png">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/post.css">
<title>보이지 않는 손 레이아웃</title>
</head>
<body>
	<!-- *---container Start---* -->

	<div class="h60px"></div>
	<div class="container-1200 con-main min-100vh">
	
		<div class="wrap-1000 ">
		  <h1>게시판</h1>
		  


		  <!-- 버튼 -->
	    <div class="row g-1 d-flex justify-content-end btn-area">
	      <div class="col-auto">
	        <input type="button" class="btn" value="목록" id="moveToList">
	        <input type="button" class="btn" value="등록" id="doSave">
	      </div>
	    </div>
	    <!--// 버튼 ------------->
    <div class="contents-area">

	    <form action="#"  name="reg_frm" id="reg_frm">
	       <input type="hidden" name="div" id="div" value="${inVO.getDiv()}">
	        <div class="contents-title">
	          <input type="text" class="form-title" id="title"  name="title"
	             placeholder="제목을 입력 하세요." required="required" maxlength="66">
	        </div>
	        
	        
	        <div class="contents">    
	          <textarea class="form-contents" id="contents" name="contents" rows="3" required="required" placeholder="내용을 입력 하세요."></textarea>
	        </div>
	                
	    </form>
    </div>
		</div><!-- **---wrap End---** -->
	</div> <!-- **---container End---** -->
	
<script src="js/jquery-3.7.0.js"></script>
<script src="js/util.js"></script>
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
  
      function moveToListView(){
        window.location.href ="${CP}/board/boardView.do?div="+$("#div").val();
      }
      
  
      $("#moveToList").on("click",function(){
          if(confirm('목록 화면으로 이동 하시겠습니까?')==false)return;
          
          moveToListView();
      });//--moveToList
      
      $("#doSave").on("click",function(){
          console.log("doSave");
          
          //필수 값: title, contents
          
          //JS
          //document.폼이름.input name.value
          let frmTitle = document.reg_frm.title.value;
          console.log("frmTitle:"+frmTitle);
          
          //input id값으로 값 가지고 오기
          //let sTitle = document.querySelector("#title").value;
          
          //class로 선택
          let sTitle = document.querySelector(".title_cls").value;
          //class값으로 값 가지고 오기
          
          
          console.log("sTitle:"+sTitle);
          
          //jquery
/*          if(eUtil.ISEmpty($("#title").val()) == true){
              alert("제목을 입력 하세요.");
              $("#title").focus();
              return;
          } */
          
          if(eUtil.ISEmpty($("#regId").val()) == true){
              alert("등록자를 입력 하세요.");
              $("#regId").focus();
              return;
          }         
          
          if(eUtil.ISEmpty($("#contents").val()) == true){
                alert("내용을 입력 하세요.");
                $("#contents").focus();
                return;             
          }
          
          
          //confirm
          if(confirm('등록 하시겠습니까')==false)return;
          
          //console.log("확인:");
          
          //ajax
            $.ajax({
                type: "POST",
                url:"/ehr/board/doSave.do",
                asyn:"true",
                dataType:"html",
                data:{
                  div: $("#div").val(),       
                  title: $("#title").val(),
                  regId: $("#regId").val(),
                  contents: $("#contents").val()  
                },
                success:function(data){//통신 성공
                    console.log("success data:"+data);
                    let parsedJson = JSON.parse(data);
                    //title 미 입력
                    if("10" == parsedJson.msgId ){
                        alert(parsedJson.msgContents);
                        $("#title").focus();
                        return;
                    }  
                
                     //등록자 미 입력
                     if("20" == parsedJson.msgId ){
                         alert(parsedJson.msgContents);
                         $("#regId").focus();
                         return;
                     }
                     
                     //등록자 미 입력
                     if("30" == parsedJson.msgId ){
                         alert(parsedJson.msgContents);
                         $("#contents").focus();
                         return;
                     }           
                     
                     
                     if("1" == parsedJson.msgId ){
                       alert(parsedJson.msgContents);
                       //javascript
                       //window.location.href ="${CP}/board/boardView.do?div="+$("#div").val();
                       moveToListView();
                     }else{
                       alert(parsedJson.msgContents);
                     }   
                },
                error:function(data){//실패시 처리
                    console.log("error:"+data);
                }
              });
          
          
      });//--doSave
  </script>  
</body>
</html>