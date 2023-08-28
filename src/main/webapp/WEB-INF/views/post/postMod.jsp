<%@page import="com.pcwk.ehr.VO.PostVO"%>
<%@page import="com.pcwk.ehr.VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    PostVO vo = (PostVO)request.getAttribute("inVO");
    String ctgNumValue = vo.getCategoryNumber();
    String ctg    = "자유게시판";//10 자유게시판, 20 QnA게시판, 30 공지게시판
    
    if ("20".equals(ctgNumValue)) {
         ctg = "Q&A게시판";
     } else if ("30".equals(ctgNumValue)) {
         ctg = "공지사항";
     }
    
    request.setAttribute("ctg", ctg);
%>
<c:set var="CP" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="image/favicon-32x32.png">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>


<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/post.css">

<title>보이지 않는 손 레이아웃</title>
</head>
<body>
  <!-- *---container Start---* -->

  <div class="h60px"></div>
  <div class="container-1200 con-main min-100vh">
  
    <div class="wrap-1000 ">
      <h1><c:out value="${ctg}" /> 수정</h1>

      <!-- 버튼 -->
      <div class="row g-1 d-flex justify-content-end btn-area">
        <div class="col-auto">
          <input type="button" class="btn" value="목록" id="moveToList">
          <input type="button" class="btn" value="수정 완료" id="doUpdate">
        </div>
      </div>
      <!--// 버튼 ------------->
    <div class="contents-area">

      <form action="${CP}/post/postMod.do" method="post" name="mod_frm" id="mod_frm" onsubmit="submit">
        <input type="hidden" name="categoryNumber" id="categoryNumber" value="${inVO.getCategoryNumber()}">
        <input type="hidden" name="postNumber" id="postNumber" value="${inVO.getPostNumber()}">
    
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">제목</label>
            <input type="text" id="title" name="title" class="form-control title_cls" value="${outVO.title}" required="required" maxlength="66">
        </div>
    
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">닉네임</label>
            <input type="text" class="form-control" id="nickname" name="nickname" value="${outVO.getNickname()}" readonly="readonly">
        </div>
    
        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">내용</label>
            <textarea class="form-control" id="content" name="content" rows="3" required="required">${outVO.content}</textarea>
        </div>
                  
      </form>
    </div>
    </div><!-- **---wrap End---** -->
  </div> <!-- **---container End---** -->
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
  
      function moveToListView() {
          window.location.href = "${CP}/post/postList.do?categoryNumber=" + $("#categoryNumber").val()
      }
      
      $(document).ready(function () {
            $("#moveToList").on("click", function () {
                if (confirm('목록하면으로 이동합니다.') == false) return;
      
                moveToListView();
            });
        });
      
      $("#doUpdate").on("click",function(){
              console.log("doUpdate");
              //제목,내용,categoryNumber,nickname(session),postNumber
              
              if(eUtil.ISEmpty($("#title").val()) == true){
                 alert("제목을 입력하세요.");
                 $("#title").focus();
                 return;
              }
              
              if(eUtil.ISEmpty($("#content").val()) ==true  ){
                 alert("내용을 입력하세요.");
                 $("#content").focus();
                 return;
              } 
              console.log("nickname:"+"${outVO.getNickname()}");
              if(confirm('수정 하시겠습니까?') == false) return;
              
              //ajax로 비동기 통신 
              $.ajax({
                  type: "POST",
                  url:"/ehr/post/doUpdate.do",
                  asyn:"true",
                  dataType:"html",
                  data:{
                    categoryNumber: $("#categoryNumber").val(),
                    title: $("#title").val(),
                    content: $("#content").val(),
                    nickname: $("#nickname").val(),
                    postNumber: $("#postNumber").val()  
                  },
                  success:function(data){//통신 성공
                    console.log("success data:"+data);
                    //성공(1),실패
                    
                    let parsedJson = JSON.parse(data);
                    if("1" == parsedJson.msgId){
                      alert(parsedJson.msgContents);
                      moveToListView();
                    }else{
                      alert(parsedJson.msgContents);
                    }
                    
                  
                  },
                  error:function(data){//실패시 처리
                    console.log("error:"+data);
                  }
               });
              
              
        });//doUpdate-------------------
    
        $("#doDelete").on("click",function(){
            console.log("doDelete");
            if(confirm('삭제 하시겠습니까')==false)return;
            
            $.ajax({
                type: "GET",
                url:"/ehr/post/doDelete.do",
                asyn:"true",
                dataType:"html",
                data:{
                  categoryNumber: $("#categoryNumber").val(),
                  postNumber: $("#postNumber").val()
                },
                success:function(data){//통신 성공
                    console.log("success data:"+data);
                    //성공, 실패
                    //성공->board_list.jsp로 이동
                    let parsedJson = JSON.parse(data);
                    if("1" == parsedJson.msgId){
                      alert(parsedJson.msgContents);
                      moveToListView();
                    }else{
                      alert(parsedJson.msgContents);
                    }
                    
                },
                error:function(data){//실패시 처리
                   console.log("error:"+data);
                }
            });
            
        });//--doDelete-----------------------------------------------------------    
      
      

  </script>  
</body>
</html>