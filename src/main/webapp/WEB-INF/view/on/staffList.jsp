<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>STAFF LIST</title>

<style>
	td {
		white-space : nowrap;
	}
	
    .pagination {
        display: flex;
        justify-content: center; /* 중앙 정렬 */
        margin-top: 20px; /* 테이블과의 간격 */
    }
	
</style>

</head>
<body class="container-fluid">
	<div class="row">
		<div class="col-sm-2 mt-5">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<div class="col-sm-9 mb-3 mt-3 ms-4">
			<!-- main content -->
			<h1 class="text-center">STAFF LIST</h1>
			<hr class=" mb-4 mt-3">
			
			<table class="table table-bordered">
				<tr>
					<td>StaffId</td>
					<td>Name</td>
					<td>addressId</td>
					<td>email</td>
					<td>storeId</td>
					<td>username</td>
					<td>마지막 수정일</td>
					<td>활성화 상태</td>
					<td>활성화 여부</td>
				</tr>
				<c:forEach var="s" items="${staffList}">
					<tr>
						<td>${s.staffId}</td>
						<td>${s.firstName} ${s.lastName}</td>
						<td>${s.addressId}</td>
						<td>${s.email}</td>
						<td>${s.storeId}</td>
						<td>${s.username}</td>
						<td>${s.lastUpdate}</td>
						<td>${s.active}</td>
						<td>
							<a href="${pageContext.request.contextPath}/on/modifyStaffActive?staffId=${s.staffId}&active=${s.active}" class="btn btn-secondary">
								<c:if test="${s.active == 1}">비활성화</c:if>
								<c:if test="${s.active == 2}">활성화</c:if>
							</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			
			<div class="text-center">
				<c:if test="${currentPage > 1}">
					<a href="${pageContext.request.contextPath}/on/staffList?currentPage=1">처음</a> &nbsp;
					<a href="${pageContext.request.contextPath}/on/staffList?currentPage=${currentPage - 1}">이전</a> &nbsp;
				</c:if>
				[${currentPage}] &nbsp;
				<c:if test="${currentPage < lastPage}">
					<a href="${pageContext.request.contextPath}/on/staffList?currentPage=${currentPage + 1}">다음</a> &nbsp;
					<a href="${pageContext.request.contextPath}/on/staffList?currentPage=${lastPage}">마지막</a> &nbsp;
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>