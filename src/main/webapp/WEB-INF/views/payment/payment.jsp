<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/payment.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/ehr/resources/js/payment.js"></script>
<!-- *---container Start---* -->
<div class="h60px"></div>
<div class="container-1400 min-100vh con-main">
	<div class="wrap-1000">
	
	  <div class="wrap_demo" id="kakaoWrap">
	    
			<div id="kakaoHead">
				<img src="../resources/image/kakaopay_icon.jpg" alt="kakaopay_logo" width="100px" />
			</div>  
			 
			<div id="kakaoContent">
				<div id="paymentBtn">
					<span>더 많은 정보를 원한다면</span>
				</div>
				<button class="btn-hover color-11" id="payBtn">결제하기</button>
			</div> <!-- *** kakaoContent *** -->
			
		</div> <!-- *** kakaoWrap *** -->
		
	</div>
</div>
<!-- **---container End---** -->
<script>
$(function(){
	$('#payBtn').click(function() {
		$.ajax({
			url:'payment/kakaopay.do',
			dataType: 'json',
			success:function(data) {
				alert(data.tid);
			},
			error:function(error){
				alert(error);
			}
		});
	});
});
</script>