<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>Staff One</title>

</head>
<body class="container-fluid">
	<div class="row">
		<div class="col-sm-2">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<div class="col-sm-10">
			<!-- staff 정보 -->
			<h1 class="text-center">마이페이지</h1>
				<hr>
				<br>
				<table class="table table-bordered">
					<tr>
						<td class="text-center">STAFF ID</td>
						<td>${staff.staffId}</td>
					</tr>
					<tr>
						<td class="text-center">STAFF 이름</td>
						<td>${staff.firstName} ${staff.lastName}</td>
					</tr>
					<tr>
						<td class="text-center">STAFF 닉네임</td>
						<td>${staff.username}</td>
					</tr>
					<tr>
						<td class="text-center">STAFF 주소</td>
						<td>${staff.addressId}</td>
					</tr>
					<tr>
						<td class="text-center">STAFF 메일</td>
						<td>${staff.email}</td>
					</tr>
					<tr>
						<td class="text-center">지점 ID</td>
						<td>${staff.storeId}</td>
					</tr>
					<tr>
						<td class="text-center">마지막 수정일</td>
						<td>${staff.lastUpdate}</td>
					</tr>
				</table>
	${staff}
		</div>
	</div>
</body>
</html>