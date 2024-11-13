<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>INVENTORY LIST</title>

</head>
<body class="container-fluid">
	<div class="row">
		<div class="col-sm-2 mt-5">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<div class="col-sm-9 mb-3 mt-3 ms-4">
			<!-- main content -->
			<h1 class="text-center">INVENTORY LIST</h1>
			<hr>
			
			<h3 class="text-center mt-4">${storeId} 지점 </h3>
			
			<table class="table table-bordered text-center mt-4">
				<tr>
					<td>인벤토리 ID</td>
					<td>필름 ID</td>
					<td>제목</td>
					<td>마지막 수정</td>
				</tr>
				<c:forEach var="iv" items="${inventoryList}">
					<tr>
						<td>${iv.inventoryId}</td>
						<td>${iv.filmId}</td>
						<td>${iv.title}</td>
						<td>${iv.lastUpdate}</td>
					</tr>
				</c:forEach>
			</table>
			
			<div class="text-center">
				<c:if test="${currentPage > 1}">
					<a href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId}&currentPage=1">처음</a> &nbsp;
					<a href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId}&currentPage=${currentPage-1}">이전</a> &nbsp;
				</c:if>
				[${currentPage}] &nbsp;
				<c:if test="${currentPage < lastPage}">
					<a href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId}&currentPage=${currentPage+1}">다음</a> &nbsp;
					<a href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId}&currentPage=${lastPage}">마지막</a> &nbsp;
				</c:if>
			</div>
		</div>
		
	</div>
</body>
</html>	