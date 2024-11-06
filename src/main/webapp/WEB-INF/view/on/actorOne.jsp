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
				<a href="">수정</a>
			</div>
			
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
					<td>
						<img alt="" src="${pageContext.request.contextPath}/upload/${af.filename}.${af.ext}"
							download="${af.originname}.${af.ext}">
					</td>
					<td>${af.type}</td>
					<td>${af.size} Byte</td>
					<td>${af.createDate}</td>
					<td><a href="">삭제</a></td>
				</c:forEach>
			</table>
			
			<div><!-- 이미지파일 추가 폼으로 이동 -->
				<a href="">이미지파일 추가</a>
			</div>
			
			<!-- FILM -->
			<h2>출연 작품</h2>
			<c:forEach var="f" items="${filmList}">
				<a href="${pageContext.request.contextPath}/on/filmOne?filmId=${f.filmId}">
					${f.title}
				</a> &nbsp;
			</c:forEach>
		</div>
	</div>
</body>
</html>	