<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.container {
		display : flex; /* 전체 정렬 */ 
		flex-direction : column; /* 내용 전체 세로 정렬 */
		justify-content : center; /* 상하 중앙 배치 */
		align-items : center; /* 좌우 중앙 배치 */
		height : 100vh; /* 화면 전체 */
	}
	
	.form-container {
		width : 300px;
		background-color : #f8f9fa;
	}
</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>
<body class="container">
	<h1 class="text-center"> STAFF LOGIN <span>${msg}</span></h1>

	<form id="form" action="${pageContext.request.contextPath}/off/login" method="post" style="width : 300px" class="form-container;"><!-- 폼 너비 설정 300px -->
		<div class="mb-3 mt-3">
			<label for="staffId" class="form-label"> 스태프 ID : </label> 
			<input id="staffId" type="text" name="staffId" class="form-control" value="1">
		</div>
		<div class="mb-3">
			<label for="password" class="form-label"> 스태프 PW : </label> 
			<input id="password" type="password" name="password" class="form-control" value="1234">
		</div>
		<button id="btn" type="button" class="btn btn-primary w-100"> 로그인 </button><!-- 버튼 너비 설정 w-100 -->
		<!-- jQuery를 위해 submit => button으로 바꿔야함  -->
	</form>
</body>

<script> // body보다 늦게 진행
	// btn 버튼 클릭 시 폼 값 유효성 검사
	$('#btn').click(function(){
		console.log('click');
		// 숫자가 아니면 isNaN() or $.isNumeric() // 자바스크립트 API or jQuery
		if($.isNumeric($('#staffId').val()) == false) {
			alert('스태프 ID는 숫자만 입력 가능');
		} else if ($('#password').val().length < 4) {
			alert('스태프 PW는 4자 이상 가능');
		} else {
			$('#form').submit();
		}
	});
</script>

</html>