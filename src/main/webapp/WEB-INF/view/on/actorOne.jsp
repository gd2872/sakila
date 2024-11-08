<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>ACTOR ONE</title>

</head>
<body class="container-fluid">
	<div class="row">
		<div class="col-sm-2 mt-5">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<!-- 
			● 1) actor 상세
			1-1) actor 수정 : /on/modifyActor
			1-2) actor 삭제 : /on/removeActor(actor_file 삭제 + film_actor 삭제 + actor 삭제)
			
			● 2) actor_file 리스트
			● 2-1) actor_file 추가
			● 2-2) actor_file 삭제 /on/removeActorFile
			
			● 3) film_actor 리스트
			● 3-1) film_actor 추가 /on/addFilmByActor -> 필름 검색 후 선택
			● 3-2) film_actor 삭제 /on/removeFilmByActor
		
		-->
		
		<div class="col-sm-9 mb-3 mt-3 ms-4">
			<!-- main content -->
			<h1 class="text-center">ACTOR</h1>
			<hr>
			
			<!-- ACTOR -->
			<h2>ACTOR</h2>
			<table class="table table-bordered text-center">
				<tr>
					<td>ACTOR ID</td>
					<td>${actor.actorId}</td>
				</tr>
				<tr>
					<td>NAME</td>
					<td>${actor.firstName} ${actor.lastName}</td>
				</tr>
				<tr>
					<td>LAST UPDATE</td>
					<td>${actor.lastUpdate}</td>
				</tr>
			</table>
			
			<div>
				<a href="${pageContext.request.contextPath}/on/modifyActor?actorId=${actor.actorId}">
					이름 수정
				</a>
				&nbsp;
				<a href="${pageContext.request.contextPath}/on/removeActor?actorId=${actor.actorId}">
					배우 삭제
				</a>
			</div>
			
			<hr class="mb-4 mt-4">
			
			<!-- ACTOR FILE -->
			<h2>ACTOR FILE</h2>
			<table class="table table-bordered text-center">
				<tr>
					<td>image</td>
					<td>type</td>
					<td>size</td>
					<td>createDate</td>
					<td>삭제</td>
				</tr>
				<c:forEach var="af" items="${actorFileList}">
					<tr>
						<td>
							<img src="${pageContext.request.contextPath}/upload/${af.filename}.${af.ext}"
								download="${af.originname}.${af.ext}" class="img-thumbnail" style="max-width: auto; height: auto;">
						</td>
						<td>${af.type}</td>
						<td>${af.size} Byte</td>
						<td>${af.createDate}</td>
						<td><a href="${pageContext.request.contextPath}/on/removeActorFile?actorFileId=${af.actorFileId}&actorId=${actor.actorId}" 
						class="btn btn-warning">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
			
			<div><!-- 이미지파일 추가 폼으로 이동 -->
				<a href="${pageContext.request.contextPath}/on/addActorFile?actorId=${actor.actorId}" class="btn btn-success">이미지파일 추가</a>
			</div>
			
			<hr class="mb-4 mt-4">
			
			<!-- FILM -->
			<h2 class="mb-3">출연 작품</h2>
			
			<div>
				<!-- 출연작 추가 -->
				<form id="formSearchFilm" method="get" 
					action="${pageContext.request.contextPath}/on/actorOne"><!-- 영화 검색 -->
					<!-- 검색 시 actorId 같이 전송 -->
					<input type="hidden" name="actorId" value="${actor.actorId}">
					<input type="text" name="searchTitle">
					<button type="button" id="btnSearchFilm">영화 검색</button>
				</form>
				
				<form id="formAddFilm" method="post"
					action="${pageContext.request.contextPath}/on/addFilmByActor">
					<input type="hidden" name="actorId" value="${actor.actorId}">
					<select size="5" name="filmId">
						<c:forEach var="sf" items="${searchFilmList}">
							<option value="${sf.filmId}">${sf.title}</option>
						</c:forEach>
					</select>
					<button type="button" id="btnAddFilm">영화 추가</button>
				</form>
			</div>
			
			<br>
			
			<table class="table table-bordered text-center">
			    <thead>
			        <tr>
			            <th>출연작품</th>
			        </tr>
			    </thead>
			    <tbody>
			        <tr>
			            <td>
			                <c:forEach var="f" items="${filmList}">
			                    <div>
				                    <a href="${pageContext.request.contextPath}/on/filmOne?filmId=${f.filmId}" class="d-inline-block mb-2 btn">
				                        ${f.title}
				                    </a>
				                    &nbsp;
				                    <a href="${pageContext.request.contextPath}/on/removeFilmActor?filmId=${f.filmId}&actorId=${actor.actorId}" 
				                    class="btn btn-danger">film_actor에서 삭제</a>
				                    <!-- 삭제 시 f.filmId & actor.actorId 필요 (기존쿼리 사용)-->
			                    </div>
			                </c:forEach>
			            </td>
			        </tr>
			    </tbody>
			</table>
		</div>
	</div>
</body>

<script>
	// film title 검색 버튼
	$('#btnSearchFilm').click(function() {
		$('#formSearchFilm').submit();
	});
	
	// 출연작(film) 추가 버튼
	$('#btnAddFilm').click(function() {
		$('#formAddFilm').submit();
	});
	
</script>
</html>	