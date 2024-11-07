<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>ADD ACTOR FILE</title>

</head>
<body class="container-fluid">
	<div class="row">
		<div class="col-sm-2 mt-5">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<div class="col-sm-9 mb-3 mt-3 ms-4">
			<!-- main content -->
			<h1 class="text-center">ADD ACTOR FILE</h1>

			<div>%{msg}</div>
			
			<hr>
			<form method="post" id="formAddActorFile" enctype="multipart/form-data"
					action="${pageContext.request.contextPath}/on/addActorFile">
				<table class="table table-bordered text-center">
					<tr>
						<td>actorid</td>
						<td>
							<input type="text" name="actorId" value="${actorId}" readonly>
						</td>
					</tr>
					<tr>
						<td>file</td>
						<td>
							<div id="fileDiv">
								<button type="button" id="btnAddFile">파일추가</button>
								<button type="button" id="btnRemoveFile">파일삭제</button>
								<input type="file" name="actorFile" class="actorFile">
							</div>
						</td>
					</tr>
				</table>
				<button type="button" id="btnAddActorFile">배우 사진 추가</button>
			</form>
		</div>
	</div>
</body>

<script>
	$('#btnAddActorFile').click(function() {
		// 파일이 공백인지
		if($('.actorFile').length == 0) {
			alert('첨부할 파일이 없습니다');	
		} else if($('.actorFile').last().val() == '') {
			alert('첨부되지 않은 파일이 있습니다');	
		} else {
			$('#formAddActorFile').submit();
		}
	});

	//파일 추가
	$('#btnAddFile').click(function() {
		if($('.actorFile').last().val() == '') { // 마지막 input=file 값이 공백이라면
			alert('첨부하지 않은 파일이 이미 존재합니다');
		} else {
			let html = '<input type="file" name="actorFile" class="actorFile">'; 
			$('#fileDiv').append(html);
		}
	});
	
	// 파일 삭제
	$('#btnRemoveFile').click(function() {
		// 마지막으로 추가된 <input type="file" name="actorFile" class="actorFiel"> 태그 제거
		// console.log($('.actorFile').length);
		if($('.actorFile').length == 0) { // class="actorFile"이 없다
			alert('삭제할 빈 input=file이 존재하지 않습니다');	
		} else {
			$('.actorFile').last().remove(); // 마지막 파일선택 삭제
		}
	});
</script>

</html>	