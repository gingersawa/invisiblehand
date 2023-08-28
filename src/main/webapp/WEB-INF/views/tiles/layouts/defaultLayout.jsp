<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <!-- 화면에 100% 보여 준다.(핸펀 화면 기준으로 축소 방지) -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%-- 동적으로 브라우저 제목을 처리 --%>
    <title><tiles:getAsString name="title"/></title>
    <link rel="icon" href="../resources/image/favicon-32x32.png">
    <link rel="shortcut icon" type="image/x-icon" href="/ehr/favicon.ico" > 
    <link rel="stylesheet" href="../resources/css/common.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />
  </head>
 
<body>
   <div>
      <header>
         <tiles:insertAttribute name="header"/>
      </header>
      <article>
         <tiles:insertAttribute name="body"/>
      </article>
      <footer>
         <tiles:insertAttribute name="footer"/>
      </footer>
   </div>
</body>
</html>