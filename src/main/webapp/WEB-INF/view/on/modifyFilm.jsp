<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>MODIFY FILM</title>

</head>
<body class="container-fluid">
	<div class="row">
		<div class="col-sm-2 mt-5">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<div class="col-sm-9 mb-3 mt-3 ms-4">
			<!-- main content -->
			<h1 class="text-center">MODIFY FILM</h1>
			<hr>
			
			<form>
				<table class="table table-bordered text-center">
					<tr>
						<td>영화 ID</td>
						<td><input readonly></td>
					</tr>
					<tr>
						<td>제목</td>
						<td></td>
					</tr>
					<tr>
						<td>관람 등급</td>
						<td></td>
					</tr>
					<tr>
						<td>상영 시간</td>
						<td></td>
					</tr>
					<tr>
						<td>개봉 연도</td>
						<td></td>
					</tr>
					<tr>
						<td>줄거리</td>
						<td></td>
					</tr>
					<tr>
						<td>쿠키</td>
						<td></td>
					</tr>
					<tr>
						<td>대여 요금</td>
						<td></td>
					</tr>
					<tr>
						<td>대여 기간</td>
						<td></td>
					</tr>
					<tr>
						<td>분실 비용</td>
						<td></td>
					</tr>
					<tr>
						<td>언어</td>
						<td></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>	