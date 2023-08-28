<%@page import="com.pcwk.ehr.cmn.StringUtil"%>
<%@page import="com.pcwk.ehr.VO.PostVO"%>
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
         request.setAttribute("ctgNumValue", ctgNumValue);
         
         //paging
         int bottomCount = 10;
         int pageSize    = 10;
         int pageNo      =  1;
         int totalCnt    =  0;
         String searchWord = "";
         String searchDiv  = "";
           
         if(null != vo){
              pageSize   = vo.getPageSize();
              pageNo     = vo.getPageNo();
              searchDiv  = vo.getSearchDiv();
              searchWord = vo.getSearchWord();
         }
         
         if(null !=  request.getAttribute("totalCnt")){
              totalCnt = Integer.parseInt(request.getAttribute("totalCnt").toString());
         }
         
         String cPath  = request.getContextPath();
         
         String defaultSearchDiv = (searchDiv == null || searchDiv.isEmpty()) ? ctgNumValue : searchDiv;
      
         
%>
<c:set var="CP" value="${pageContext.request.contextPath }"/> 
<c:set var="defaultSearchDiv" value="${defaultSearchDiv}"/>
<c:url value="/post/postList.do" var="freePostURL">
  <c:param name="categoryNumber" value="10" />
</c:url>

<c:url value="/post/postList.do" var="qnaPostURL">
  <c:param name="categoryNumber" value="20" />
</c:url>

<c:url value="/post/postList.do" var="postURL">
  <c:param name="categoryNumber" value="30" />
</c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/post.css">
<title>보이지 않는 손 레이아웃</title>
</head>
<body>
  
  <!-- *---container Start---* -->

  <div class="h60px"></div>
  <div class="container-1200 con-main min-100vh">
    <div class="wrap-1000 ">
  
      
      <!-- *---검색,글쓰기 Start---* -->
      <div class="table-search">
        <form action="${CP}/post/postList.do" method="get" name="postFrm">
          <input type="hidden" name="pageNo" id="pageNo">
          <input type="hidden" name="categoryNumber"    id="categoryNumber" value='${inVO.getCategoryNumber()}'>
          <div class="post-nav">
  
            <div>
               <input type="text" name="searchWord" id="searchWord" value="<c:out value='${inVO.searchWord }'/>" placeholder="검색어를 입력 하세요" class="form-control">
            </div>
 
            <div class="list-btn">  
              <a href="#" id="doRetrieve"><i class='fas fa-search fa-sm' style='color:#FFA000;'></i></a>
              <a href="#" class="btn button btn-b" style="margin-left: 30px;" onclick="doMoveToPostReg();" >글쓰기</a>  
            </div>      
          </div>  
        </form>
      </div>
      <!-- **---form End---** -->



      <!-- *---Table Start---* -->
      
      <div class="category-selecter">
        <a class="selecter-list act" href="${freePostURL}">자유 게시판</a>
        <a class="selecter-list" href="${qnaPostURL}">Q&A 게시판</a>
        <a class="selecter-list" href="${postURL}">공지사항</a>
      </div>
      <table id="postTable" class="table table-sm table-hover table-borderless">
          <thead class="post-thead">
            <tr >
               <th class="text-c">No.</th>
               <th class="text-c">제목</th>  
               <th class="text-c">글쓴이</th>
               <th class="text-c">작성일</th> 
               <th class="text-c">조회수</th>
            </tr>
          </thead>
          <tbody>
            <c:choose>
               <%-- 조회 데이터가 있는 경우--%>
               <c:when test="${not empty list }">
                  <c:forEach var="vo" items="${list}">
                    <tr class="cell">
                      <td class="text-c"><c:out value="${vo.num}"/></td>
                      <td class="text-l"><a href="#"><c:out value="${vo.title}"/></a></td>
                      <td class="text-c"><c:out value="${vo.nickname}"/></td>
                      <td class="text-c"><c:out value="${vo.writtenDate}"/></td>
                      <td class="text-c"><c:out value="${vo.views}"/></td>
                      <td style="display:none;"><c:out value="${vo.postNumber}"/></td>
                    </tr>            
                  </c:forEach>
               </c:when>
               
               <%-- 조회 데이터가 없는 경우--%>
               <c:otherwise>
                 <tr>
                    <td  class="text-c" colspan="99">No data found.</td>
                 </tr>
               </c:otherwise>
             </c:choose>  
          </tbody>
       </table> <!-- **---table End---** -->
       <!-- 페이징 -->
       <div class="d-flex justify-content-center">
       <%=StringUtil.renderPaging(totalCnt, pageNo, pageSize, bottomCount, cPath+"/post/postList.do", "do_Retrieve") %>
       </div> 
       <!--// 페이징 ---------------------------------------------------------------->
       

    </div><!-- **---wrap End---** -->
  </div> <!-- **---container End---** -->


<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<script>
/* 게시판 카테고리 선택시 노란색으로 변경 */

	    $('.selecter-list').click(function() {
	    	   $('.selecter-list').siblings().removeClass("act");
	    	   $('.selecter-list').addClass("act");
	    });

/* 게시판 카테고리 선택시 노란색으로 변경끝 */
	
	
  function do_Retrieve(url, pageNo){
    console.log("url:"+url);
    console.log("pageNo:"+pageNo);
    
    let frm = document.postFrm;
    frm.action = url;
    frm.pageNo.value=pageNo;
    frm.submit();//controller call  
  }
  
  //table 목록 click시 postNumber값 찾기
  $("#postTable>tbody").on("click","tr",function(e){
    console.log("#postTable>tbody");
    let tdArray = $(this).children();
    console.log('tdArray:'+tdArray);
    let postNumber = tdArray.eq(5).text();
    console.log('postNumber:'+postNumber);
    
    if( confirm("상세 조회 test: 이건 없앨거임") == false ) return;
    
    //categoryNumber,postNumber
    ////http://localhost:8080/ehr/post/doSelectOne.do?div=10&postNumber=393
    window.location.href = "${CP}/post/doSelectOne.do?categoryNumber="+$("#categoryNumber").val()+"&postNumber=" + postNumber;
    
  });
  
  function doMoveToPostReg(){
      console.log("doMoveToPostReg");
      let frm = document.postFrm;
      console.log("frm.categoryNumber.value:"+frm.categoryNumber.value);
      frm.pageNo.value=1;
      
      /* frm.searchDiv.value = "all";   // Set searchDiv to "all"
      frm.searchWord.value = "";     // Set searchWord to an empty string */
      frm.action = "${CP}/post/doMoveToPostReg.do"
      
      frm.submit();
    }
    
   function doRetrieveCall(pageNo){
        let frm = document.postFrm;
        frm.pageNo.value=pageNo;//javascript
        frm.submit();//controller call    
    }
    
    $("#searchWord").on("keypress",function(e){
      console.log("searchWord");
      if(13 == e.which){
        e.preventDefault();
        doRetrieveCall(1);
      }
    });
    
    $("#doRetrieve").on("click",function(){
        console.log("doRetrieve");
        doRetrieveCall(1);
    });

$(".categorybox").click(function() {
    $(this).siblings().removeClass("active");
    $(this).addClass("active");
   // $("html, body").scrollTop($(".tab-box").height());
    let clickTab = $(this).attr("data-tab");
    $(".tab-box").removeClass("active");
    $("." + clickTab).addClass("active");
});
</script>
</body>
</html>