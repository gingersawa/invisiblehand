<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="image/favicon-32x32.png">
<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/mypage2.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />
<title>마이페이지 입니다</title>
<style>


h2, p, label, input, span, button {
    font-size: 20px; 

}
textarea.size {
    width: 100%; 
    height: 150px; 
    border: 1px solid #ccc;
    padding: 8px;
    font-size: 16px;
}



</style>
</head>
<body>
	<!-- *---container Start---* -->

	<div class="h60px"></div>
	<div class="container-1400 min-100vh con-login">
		<div class="mypage-wrap">
			<div class="box-area" >

					<div class="form-h3">
					<div class="line1px"></div>
					<div class="line3px"></div>
					<h3>회원 탈퇴</h3>
					<div class="line3px"></div>
					<div class="line1px"></div>
				</div>

				<form>
	        <div class="label-margin">
	            <p class="input-title">비밀번호 입력</p>
	            <label>
	                <input type="password" name="password" placeholder="비밀번호를 입력하세요" class="size border-bottom" required>
	            </label>
	        </div>
	
	        <div class="label-margin">
	            <p class="input-title">탈퇴 사유 입력</p>
	            <label>
	                <textarea name="reason" placeholder="회원탈퇴를 원하는 이유를 간략히 입력하세요" class="size border-bottom" required></textarea>
	            </label>
	        </div>
	
	        <div class="label-margin">
            <!-- "확인" 버튼에 onclick 이벤트를 추가하여 확인 메시지를 띄우고 탈퇴 완료 메시지를 보여줍니다. -->
            <label>
                <!-- onclick 이벤트에서 확인 대화 상자를 띄우도록 수정하였습니다. -->
                <button type="button" class=0"btn btn-primary" onclick="confirmWithdrawal()">확인</button>
            </label>
	            <label>
	                <button type="button" class="btn btn-primary">취소</button>
	            </label>
	        </div>
	    </form>
	   <script>
        function confirmWithdrawal() {
            // 확인 대화 상자를 띄우고 사용자가 확인 버튼을 누를 경우 탈퇴 완료 메시지를 보여줍니다.
            if (confirm("정말로 탈퇴하시겠습니까?")) {
                alert("탈퇴가 완료되었습니다.");
                // 탈퇴 처리를 진행하는 코드를 추가해야 합니다.
            }
        }
    </script>
    
	
	    <!-- 주의 사항 안내 -->
	    <div>
	        <p>주의: 회원탈퇴 시 관련 데이터가 모두 삭제되며, 탈퇴 후에는 복구가 어려울 수 있습니다.</p>
	        <p>탈퇴 후에는 동일한 계정으로 재가입이 불가능할 수 있습니다.</p>
	    </div>
								
			</div>
		</div><!-- **---wrap End---** -->
	</div>

	<!-- **---container End---** -->
	

</body>
</html>