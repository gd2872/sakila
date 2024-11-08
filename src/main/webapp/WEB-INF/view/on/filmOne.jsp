<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>FILM ONE</title>

</head>
<body class="container-fluid">
	<div class="row">
		<div class="col-sm-2 mt-5">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<!-- 
			● 1) film 상세
			1-1) film 수정 : /on/modifyFilm
			1-2) film 삭제 : /on/removeFilm(film_category 삭제 + film_actor 삭제 + film 삭제)
			
			2) film_category 리스트
			2-1) film_category 추가 /on/addFilmCategory -> 카테고리 전체 목록에서
			2-2) film_category 삭제 /on/removeFilmCaterory
			
			● 3) film_actor 리스트
			3-1) film_actor 추가 /on/addActorByFilm -> 배우 검색 후 선택
			3-2) film_actor 삭제 /on/removeFileActor
		
		-->		
		
		<div class="col-sm-9 mb-3 mt-3 ms-4">
			<!-- main content -->
			<h1 class="text-center">작품 상세</h1>
			<hr>
					${film}
			<div>
			<div>
				<a href="">영화 수정</a>
			</div>
			<table class="table table-bordered text-center">
				<tr>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
			</table>
			</div>
			
			<hr>
			
			<div>
				<h3>출연 배우</h3>
				<div>
					<c:forEach var="a" items="${actorList}">
						<div>
							<a href="${pageContext.request.contextPath}/on/actorOne?actorId=${a.actorId}">
								${a.firstName} ${a.firstName}
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
				
		</div>
	</div>
</body>
</html>	