<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>MODIFY ACTOR</title>

</head>
<body class="container-fluid">
	<div class="row">
		<div class="col-sm-2 mt-5">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<div class="col-sm-9 mb-3 mt-3 ms-4">
			<!-- main content -->
			<h1 class="text-center">MODIFY ACTOR</h1>
			<hr>
				<table class="table table-bordered text-center">
					<tr>
						<td>FIRST NAME</td>
						<td>
							<form id="formFirstName" method="post" action="${pageContext.request.contextPath}/on/modifyActor">
								<input type="hidden" name="actorId" value="${actor.actorId}">
								<input type="text" value="${actor.firstName}" name="firstName" id="firstName">
								<button type="button" id="btnFirstName">FIRST NAME 수정</button>
							</form>
						</td>
					</tr>
					<tr>
						<td>LAST NAME</td>
						<td>
							<form id="formLastName" method="post" action="${pageContext.request.contextPath}/on/modifyActor">
								<input type="hidden" name="actorId" value="${actor.actorId}">
								<input type="text" value="${actor.lastName}" name="lastName" id="lastName">
								<button type="button" id="btnLastName">LAST NAME 수정</button>
							</form>
						</td>
					</tr>
				</table>
		</div>
	</div>
</body>

<script>
	$('#btnFirstName').click(function() {
		if($('#firstName').val() == ''){
			alert('수정할 firstName을 입력하세요');
		} else {
			$('#formFirstName').submit();
		}
	});

	$('#btnLastName').click(function() {
		if($('#lastName').val() == ''){
			alert('수정할 lastName을 입력하세요');
		} else {
			$('#formLastName').submit();
		}
	});

</script>
</html>	