<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>FILM LIST</title>

</head>
<body class="container-fluid">
	<div class="row">
		<div class="col-sm-2 mt-5">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<div class="col-sm-9 mb-3 mt-3 ms-4">
			<!-- main content -->
			<h1 class="text-center">FLIM LIST</h1>
			<hr>
			
			<!-- 카테고리 선택 -->
			<form method="get" id="formCategory" action="${pageContext.request.contextPath}/on/filmList">
				<select name="categoryId" id="categoryId">
					<option value="0">전체</option>					
					<c:forEach var="c" items="${categoryList}">
						<c:if test="${c.categoryId == currentCategoryId}">
							<option selected value="${c.categoryId}">${c.name}</option>
						</c:if>
						<c:if test="${c.categoryId != currentCategoryId}">
							<option value="${c.categoryId}">${c.name}</option>
						</c:if>
					</c:forEach>
				</select>
			</form>
			
			<table class="table table-bordered text-center mt-4">
				<tr>
					<td>FILM ID</td>
					<td>제목</td>
					<td>관람 등급</td>
					<td>상영 시간</td>
					<td>개봉 연도</td>
					<td>대여 요금</td>
					<td>대여 기간</td>
					<td>분실 비용</td>
				</tr>
				<c:forEach var="f" items="${filmList}">
					<tr>
						<td>${f.filmId}</td>
						<td>
							<a href="${pageContext.request.contextPath}/on/filmOne?filmId=${f.filmId}">
								${f.title}
							</a>
						</td>
						<td>${f.rating}</td>
						<td>${f.length}</td>
						<td>${f.releaseYear}</td>
						<td>${f.rentalRate}</td>
						<td>${f.rentalDuration}</td>
						<td>${f.replacementCost}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>

<script>
	$('#categoryId').change(function() {
		// alert('change!');
		$('#formCategory').submit();
	});
</script>
</html>	