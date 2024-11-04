<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>ADD STAFF</title>

</head>
<body class="container-fluid">
	<div class="row">
		<div class="col-sm-2 mt-5 ">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<div class="col-sm-9 mb-3 mt-3 ms-4 text-center">
			<!-- main content -->
			<h1 class="text-center">ADD STAFF</h1>
			
			<hr>
			
			<h3 class="mb-3 mt-4">주소</h3>
			<form id="formAddress" method="get" action="${pageContext.request.contextPath}/on/addStaff">
				<input type="text" name="searchAddress" id="searchAddress" style="width : 90%; margin-bottom : 10px">
				<button type="button" id="btnAddress">검색</button> <!-- addStaff get 호출 -->
			</form>
			
			<c:if test="${not empty param.searchAddress}">
			
			<div style="margin-top : 25px;">
				<h3 style="margin-bottom : 20px"></h3>
				<select id="resultAddress" size="10" style="width : 90%;">
					<c:forEach var="a" items="${addressList}">
						<option value="${a.addressId}">
								(ADDRESS ID : ${a.addressId}) ${a.address}
						</option>
					</c:forEach>
				</select>
				<br>
				<button type="button" id="btnAddrSel" style="margin-top: 10px;">선택</button>
			</div>
			
			<hr style="margin-top : 30px">
			
			<h3>정보 입력</h3>
			<form id="addForm" method="post" action="${pageContext.request.contextPath}/on/addStaff">
				<table class="table table-bordered">
					<tr>
						<td>STORE ID</td>
						<td>
							<select id="storeId" name="storeId">
								<option value="">::: 선택 :::</option>
								<c:forEach var="s" items="${storeList}" >
									<option value="${s.storeId}">${s.storeId}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					
					<tr>
						<td>ADDRESS ID</td>
						<td>
							<input type="text" name="addressId" id="addressId" readonly>
						</td>
					</tr>

					<tr>
						<td>FIRST NAME</td>
						<td><input type="text" name="firstName" id="firstName"></td>
					</tr>

					<tr>
						<td>LAST NAME</td>
						<td><input type="text" name="lastName" id="lastName"></td>
					</tr>

					<tr>
						<td>EMAIL</td>
						<td><input type="email" name="email" id="email"></td>
					</tr>

					<tr>
						<td>USER NAME</td>
						<td><input type="text" name="username" id="username"></td>
					</tr>
				</table>
				<button id="btnAddStaff" type="button">STAFF 추가</button>
			</form>
			</c:if>
			
		</div>
	</div>
</body>
<script>
	// 액션 서브밋 버튼
	$('#btnAddStaff').click(function(){
		// 입력폼 유효성 검사
		if($('#storeId').val() == null || $('#storeId').val() == '') {
			alert('storeId를 입력하세요');
		} else if ($('#addressId').val() == null || $('#addressId').val() == '') {
			alert('addressId를 입력하세요');
		} else if ($('#firstName').val() == null || $('#firstName').val() == '') {
			alert('firstName를 입력하세요');
		} else if ($('#lastName').val() == null || $('#lastName').val() == '') {
			alert('lastName를 입력하세요');
		} else if ($('#email').val() == null || $('#email').val() == '') {
			alert('email를 입력하세요');
		} else if ($('#username').val() == null || $('#username').val() == '') {
			alert('username를 입력하세요');
		} else {		
			console.log('staff 추가 완료');
			$('#addForm').submit();			
		}	
	});

	// 주소 선택 버튼
	$('#btnAddrSel').click(function(){
		console.log($('#resultAddress').val());
		if($('#resultAddress').val() == null ||  $('#resultAddress').val() == ''){
			alert('주소 선택을 먼저 하세요');
		} else {
			$('#addressId').val($('#resultAddress').val());
		}
	});

	// 주소 검색 버튼
	$('#btnAddress').click(function(){
		if($('#searchAddress').val() == ""){
			alert('주소 검색어를 입력하세요');
		} else {
			$('#formAddress').submit();
		}
	});
</script>
</html>