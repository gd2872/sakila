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

<style>
</style>

</head>
<body class="container-fluid">
	<div class="row">
		<div class="col-sm-2 mt-5">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<div class="col-sm-9 mb-3 mt-3 ms-4">
			<!-- 마이페이지 -->
			<h1 class="text-center">마이페이지</h1>
			<hr class=" mb-3 mt-3">
				
			<!-- 스태프 정보 -->
			<h3 class="text-center mb-3 mt-4">개인 정보</h3>
			<table class="table table-bordered">
				<tr>
					<td class="text-center">ID</td>
					<td>${staff.staffId}</td>
				</tr>
				<tr>
					<td class="text-center">이름</td>
					<td>${staff.firstName} ${staff.lastName}</td>
				</tr>
				<tr>
					<td class="text-center">우편번호</td>
					<td>(${empty staff.staffPostCode ? '00000' : staff.staffPostCode})</td>
				</tr>
				<tr>
					<td class="text-center">주소</td>
					<td>${staff.staffDistrict} ${staff.staffCity} ${staff.staffCountry}</td>
				</tr>
				<tr>
					<td class="text-center">상세주소</td>
					<td>${staff.staffAddress} ${staff.staffAddress2}</td>
				</tr>
				<tr>
					<td class="text-center">연락처</td>
					<td>${staff.staffPhone}</td>
				</tr>
				<tr>
					<td class="text-center">매장 ID</td>
					<td>
						<a href="${pageContext.request.contextPath}/on/storeOne">
							${staff.storeId}
						</a>
					</td>
				</tr>
			</table>
			
			<div class="text-center">
				<a href="">비밀번호 수정</a> &nbsp;
				<a href="">이메일 수정</a> &nbsp;
				<a href="">주소 수정</a> &nbsp;
				<a href="">매장 수정</a> &nbsp;
			</div>
		</div>
	</div>
</body>
</html>