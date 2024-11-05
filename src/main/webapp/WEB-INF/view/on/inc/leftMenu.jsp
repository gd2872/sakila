<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<ul class="list-group text-center mb-3 mt-5">
		<li class="list-group-item bg-light">
			<a href="${pageContext.request.contextPath}/on/main"> 홈 </a>
		</li>
		<li class="list-group-item bg-secondary">
			::: ${loginStaff.username}님 :::
		</li>
		<li class="list-group-item bg-light">
			<a href="${pageContext.request.contextPath}/on/staffOne"> 마이페이지 </a>
		</li>
		<li class="list-group-item bg-light">
			<a href="${pageContext.request.contextPath}/on/logout"> 로그아웃 </a>
		</li>
			
		<li class="list-group-item bg-secondary">
			::: 지점 :::
		</li>
		<li class="list-group-item bg-light">
			<a href=""> 지점 리스트 </a>
		</li>
		<li class="list-group-item bg-light">
			<a href=""> 지점 추가 </a>
		</li>
		
		<li class="list-group-item bg-secondary">
			::: STAFF :::
		</li>
		<li class="list-group-item bg-light">
			<a href="${pageContext.request.contextPath}/on/staffList"> STAFF 리스트 </a>
		</li>
		<li class="list-group-item bg-light">
			<a href="${pageContext.request.contextPath}/on/addStaff"> STAFF 추가 </a>
		</li>
		
		<li class="list-group-item bg-secondary">
			::: 고객 :::
		</li>
		<li class="list-group-item bg-light">
			<a href=""> 고객 리스트 </a>
		</li>
		<li class="list-group-item bg-light">
			<a href=""> 고객 추가 </a>
		
		<li class="list-group-item bg-secondary">
			::: 배우 :::
		</li>
		<li class="list-group-item bg-light">
			<a href=""> 배우 리스트 </a>
		</li>
		<li class="list-group-item bg-light">
			<a href="${pageContext.request.contextPath}/on/addActor"> 배우 추가 </a>
		</li>
	</ul>
</div>