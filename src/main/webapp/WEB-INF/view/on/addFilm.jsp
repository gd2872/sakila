<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>ADD FILM</title>

</head>
<body class="container-fluid">
	<div class="row">
		<div class="col-sm-2 mt-5">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<div class="col-sm-9 mb-3 mt-3 ms-4">
			<!-- main content -->
			<h1 class="text-center">ADD FILM</h1>
			<hr>
			
			<form id="formAddFilm" method="post" action="${pageContext.request.contextPath}/on/addFilm">
				<table class="table table-bordered text-center" style="width : 80%">
					<tr>
						<td>title</td>
						<td>
							<input type="text" id="title" name="title">
						</td>
					</tr>
					<tr>
						<td>description</td>
						<td>
							<!-- textarea -->
							<textarea rows="3" cols="50" id="description" name="description"></textarea>
						</td>
					</tr>
					<tr>
						<td>releaseYear</td>
						<td>
							<input type="number" id="releaseYear" name="releaseYear">
						</td>
					</tr>
					<tr>
						<td>languageId</td>
						<td>
							<select id="languageId" name="languageId">
								<option value="">언어 선택</option>
								<c:forEach var="la" items="${languageList}">
									<option value="${la.languageId}">${la.name}</option>
								</c:forEach>
							</select>	
						</td>
					</tr>
					<tr>
						<td>originalLanguageId</td>
						<td>
							<select id="originalLanguageId" name="originalLanguageId">
								<option value="">오리지널 언어 선택</option>
								<c:forEach var="la" items="${languageList}">
									<option value="${la.languageId}">${la.name}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>rentalDuration</td>
						<td>
							<!-- DB 기본값 : 3 -->
							<input type="number" id="rentalDuration" name="rentalDuration" value="3">
						</td>
					</tr>
					<tr>
						<td>rentalRate</td>
						<td>
							<!-- DB 기본값 : 4.99 -->
							<input type="number" id="rentalRate" name="rentalRate" value="4.99">
						</td>
					</tr>
					<tr>
						<td>length</td>
						<td>
							<input type="number" id="length" name="length">분
						</td>
					</tr>
					<tr>
						<td>replacementCost</td>
						<td>
							<!-- DB 기본값 : 19.99 -->
							<input type="number" id="replacementCost" name="replacementCost" value="19.99">$
						</td>
					</tr>
					<tr>
						<td>rating</td>
						<td>
							<!-- radio, enum(G, PG, PG-13, R, NC-17), DB 기본값 : 'G'  -->
							<input type="radio" name="rating" class="rating" value="G">G<br>
							<input type="radio" name="rating" class="rating" value="PG">PG<br>
							<input type="radio" name="rating" class="rating" value="PG-13">PG-13<br>
							<input type="radio" name="rating" class="rating" value="R">R<br>
							<input type="radio" name="rating" class="rating" value="NC-17">NC-17<br>
						</td>
					</tr>
					<tr>
						<td>specialFeatures</td>
						<td>
							<!-- checkbox
							, set('Trailers','Commentaries','Deleted Scenes','Behind the Scenes')
							DB 기본값	 -->
							<input type="checkbox" name="specialFeatures" class="specialFeatures"
								value="Trailers">Trailers<br>
							<input type="checkbox" name="specialFeatures" class="specialFeatures"
								value="Commentaries">Commentaries<br>
							<input type="checkbox" name="specialFeatures" class="specialFeatures"
								value="Deleted Scenes">Deleted Scenes<br>
							<input type="checkbox" name="specialFeatures" class="specialFeatures"
								value="Behind the Scenes">Behind the Scenes<br>
						</td>
					</tr>
				</table>
				<button type="button" id="btnAddFilm">영화 추가</button>
			</form>
		</div>
	</div>
</body>

<script>
	$('#btnAddFilm').click(function() {
		// 폼 유효성 검사
		$('#formAddFilm')
	});
</script>

</html>	