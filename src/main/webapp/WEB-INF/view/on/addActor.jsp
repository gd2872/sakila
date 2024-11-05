<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>ADD ACTOR</title>

</head>
<body class="container-fluid">
	<div class="row">
		<div class="col-sm-2 mt-5">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<div class="col-sm-9 mb-3 mt-3 ms-4">
			<!-- main content -->
			<h1 class="text-center">ADD ACTOR</h1>
			<hr class=" mb-3 mt-3">
			
			<table class="">
				<tr>
					<td>First Name</td>
					<td><input type="text" name="firstName"></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><input type="text" name="lastName"></td>
				</tr>
				<tr>
					<td>File</td>
					<td>
						<div id="fileDiv">
							<button type="button" id="btnAddFile">파일 추가</button>
							<button type="button" id="btnRemoveFile">파일 삭제</button>
						</div>
					</td>
				</tr>
			</table>
			<button type="button">배우 추가</button>
		</div>
	</div>
</body>

<script>
	$('#btnAddFile').click(function() {
		/* 자바스크립트 API 사용 
		let arr = $('.actorFile');
		arr.forEach(function(item, index) {
		});
		*/
		
		/* jQuery API 사용 */
		let flag = true;
		$('.actorFile').each(function() { // 매개값(index, item), item == $(this)
			if($(this).val() == ''){
				flag = false;
			}
			console.log($(this).val());
		});
		if(flag) {
			// addFile 버튼 누를때마다 파일 선택 추가(여러 파일 선택 가능)
			let html = '<input type="file" name="actorFile" class="actorFile">'; 
			$('#fileDiv').append(html);
		} else {
			alert('첨부하지 않은 파일이 이미 존재합니다');
		}
	});
	
	/*
		<input type="file" name="actorFile" class="actorFile">
		<input type="file" name="actorFile" class="actorFile">
		<input type="file" name="actorFile" class="actorFile">
	*/
	
	$('#btnRemoveFile').click(function() {
		// 마지막으로 추가된 <input type="file" name="actorFile" class="actorFiel"> 태그 제거
		// console.log($('.actorFile').length);
		$('.actorFile').last().remove(); // 마지막 파일선택 삭제
	});
</script>
</html>	