<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>ACTOR LIST</title>

</head>
<body class="container-fluid">
	<div class="row">
		<div class="col-sm-2 mt-5">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<div class="col-sm-9 mb-3 mt-3 ms-4">
			<!-- main content -->
			<h1 class="text-center">ACTOR LIST</h1>
			<hr class=" mb-3 mt-3">
			
			<form id="formSearch" method="get" action="${pageContext.request.contextPath}/on/actorList">
				<input type="text" name="searchWord" id="searchWord">
				<button id="btnSearch">이름 검색</button>
			</form>
			
			<table class="table table-bordered text-center">
				<tr>
					<td>ACTOR ID</td>
					<td>NAME</td>
				</tr>
				<c:forEach var="a" items="${actorList}">
					<tr>
						<td>${a.actorId}</td>
						<td>
							<a href="${pageContext.request.contextPath}/on/actorOne?actorId=${a.actorId}">
								${a.firstName} ${a.lastName}
							</a>	
						</td>
					</tr>
				</c:forEach>
			</table>
			
			<div>
				<c:if test="${currentPage > 1}">
					<a href="${pageContext.request.contextPath}/on/actorList?currentPage=1&searchWord=${searchWord}">처음</a> &nbsp;
					<a href="${pageContext.request.contextPath}/on/actorList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a> &nbsp;
				</c:if>
				<c:if test="${currentPage < lastPage}">
				[${currentPage}] &nbsp;
					<a href="${pageContext.request.contextPath}/on/actorList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a> &nbsp;
					<a href="${pageContext.request.contextPath}/on/actorList?currentPage=${lastPage}&searchWord=${searchWord}">마지막</a> &nbsp;
				</c:if>
			</div>
		</div>
	</div>
</body>

<script>
	$('#btnSearch').click(function() {
		if($('#searchWord').val() == ''){
			alert('검색어를 입력하세요');
			return;
		}
		$('#formSearch').submit();
	});
</script>

</html>	