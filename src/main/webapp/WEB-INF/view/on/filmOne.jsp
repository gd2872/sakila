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
			● 1-2) film 삭제 : /on/removeFilm(inventory 렌탈정보확인 + film_category 삭제 + film_actor 삭제 + film 삭제)
			
			● 2) film_category 리스트
			● 2-1) film_category 추가 /on/addFilmCategory -> 카테고리 전체 목록에서 => [이슈] 이미 추가된 카테고리 다시 추가 시 PK 중복 에러
			● 2-2) film_category 삭제 /on/removeFilmCaterory
			
			● 3) film_actor 리스트
			● 3-1) film_actor 추가 /on/addActorByFilm -> 배우 "검색" 후 선택
			3-2) film_actor 삭제 /on/removeFileActor
			
			4) inventory 정보
		-->		
		
		<div class="col-sm-9 mb-3 mt-3 ms-4">
			<!-- main content -->
			<h1 class="text-center">FILM ONE</h1>
			
			<hr>
			
			<div>
				<h3>작품 장르 (CATEGORY)</h3>
				
				<!-- 해당 영화 카테고리 추가 -->
				<form id="formFilmCategory" method="post" 
					action="${pageContext.request.contextPath}/on/addFilmCategory"> 
					<input type="hidden" name="filmId" value="${film.filmId}">
					<select name="categoryId" id="categoryId">
						<option value="">카테고리 선택</option>
						<!-- model.allCategoryList -->
						<c:forEach var="ac" items="${allCategoryList}">
							<option value="${ac.categoryId}">${ac.name}</option>
						</c:forEach>
					</select>
						<button type="button" id="btnFilmCategory">해당 영화 카테고리 선택</button>
				</form>
				
				<!-- 카테고리 리스트 model.filmCategoryList-->
				<div>
					<c:forEach var="fc" items="${filmCategoryList}">
						<div>
							${fc.name}
							&nbsp;
							<a href="${pageContext.request.contextPath}/on/removeFilmCategory?filmId=${fc.filmId}&categoryId=${fc.categoryId}">삭제</a>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<br>
			
			<div>
				<table class="table table-bordered text-center">
					<tr>
						<td>영화 ID</td>
						<td>${film.filmId}</td>
					</tr>
					<tr>
						<td>제목</td>
						<td>${film.title}</td>
					</tr>
					<tr>
						<td>관람 등급</td>
						<td>${film.rating}</td>
					</tr>
					<tr>
						<td>상영 시간</td>
						<td>${film.length}분</td>
					</tr>
					<tr>
						<td>개봉 연도</td>
						<td>${film.releaseYear}</td>
					</tr>
					<tr>
						<td>줄거리</td>
						<td>${film.description}</td>
					</tr>
					<tr>
						<td>쿠키</td>
						<td>${film.specialFeatures}</td>
					</tr>
					<tr>
						<td>대여 요금</td>
						<td>${film.rentalRate}$</td>
					</tr>
					<tr>
						<td>대여 기간</td>
						<td>${film.rentalDuration}</td>
					</tr>
					<tr>
						<td>수정일</td>
						<td>${film.lastUpdate}</td>
					</tr>
					<tr>
						<td>분실 비용</td>
						<td>${film.replacementCost}$</td>
					</tr>
					<tr>
						<td>언어</td>
						<td>${film.language}</td>
					</tr>
				</table>
			</div>
				
			<div class="text-end">
				<a href="${pageContext.request.contextPath}/on/modifyFilm?filmId=${film.filmId}">필름 수정</a>
				<a href="${pageContext.request.contextPath}/on/removeFilm?filmId=${film.filmId}">필름 삭제</a>
				<span class="text-danger">${removeFilmMsg}</span>
			</div>
				
				<hr>
			
			<div>
				<h3>작품 출연 배우</h3>
				<div>
					<!-- 배우 이름 검색 후 -->
					<form id="formSearchName" method="get"
						action="${pageContext.request.contextPath}/on/filmOne">
						
						<input type="hidden" name="filmId" value="${film.filmId}">
						
						<input type="text" name="searchName" id="searchName">
						<button type="button" id="btnSearchName">이름 검색</button>
					</form>
				
					<!-- 출연 배우 추가 -->
					<form method="post" id="formFilmActor"
						action="${pageContext.request.contextPath}/on/addFilmActorByFilm">
						<input type="hidden" name="filmId" value="${film.filmId}">
						<select name="actorId" id="actorId">
							<option value="">배우 선택</option>
							<!-- model.searchActorList -->
							<c:forEach var="sa" items="${searchActorList}">
								<option value="${sa.actorId}">${sa.firstName} &nbsp; ${sa.lastName}</option>
							</c:forEach>
						
						</select>
						<button type="button" id="btnFilmActor">출연배우 추가</button>
					</form>
				
					<c:forEach var="a" items="${actorList}">
						<div>
							<a href="${pageContext.request.contextPath}/on/actorOne?actorId=${a.actorId}">
								${a.firstName} ${a.lastName}
							</a>
							&nbsp;
							<a href="${pageContext.request.contextPath}/on/removeFilmActorByFilm?filmId=${film.filmId}&actorId=${a.actorId}">
							삭제</a>
						</div>
					</c:forEach>
				</div>
			</div>
				
		</div>
	</div>
</body>

<script>

	$('#btnFilmActor').click(function() {
		if($('#actorId').val() == null || $('#actorId').val() == ''){
			alert('출연배우를 선택하세요');
		} else {
			$('#formFilmActor').submit();
		}
	});

	$('#btnSearchName').click(function() {
		if($('#searchName').val() == ''){
			alert('배우 이름을 입력하세요');
		} else {
			$('#formSearchName').submit();
		}
	});

	$('#btnFilmCategory').click(function() {
		if($('#categoryId').val() == ''){
			alert('categoryId를 선택하세요');
		} else {
			$('#formFilmCategory').submit();
		}
	});
</script>
</html>	