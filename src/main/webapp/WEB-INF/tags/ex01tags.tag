<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="current"%>

<c:url value="/ex01/board1/list" var="listUrl"></c:url>
<c:url value="/ex01/board1/write" var="writeUrl"></c:url>

<nav class="navbar navbar-expand-sm navbar-light bg-light mb-3">
	<div class="container">
		<a class="navbar-brand" href="${listUrl }">
			<i class="fa-solid fa-house"></i>
		</a>

		<butten class="navbar-toggler" data-bs-toggle="collapas"
			data-bs-target="navbarSupportedContent"> <span
			class="navbar-toggler-icon"></span> </butten>


		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<a class="nav-link ${current == 'list' ? 'active' : '' }"
						href="${listUrl }">목록보기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link ${current == 'write' ? 'active' : '' }"
						href="${writeUrl }">글쓰기</a>
				</li>
			</ul>
			<form action="${listUrl }" class="d-flex">
				<select name="type" id="" class="form-select">
					<option value="all"
						${param.type != 'title' && param.type != 'body'? 'selected' : ''}selected }>전체</option>
					<option value="title" ${param.type == 'title' ? 'selected' : ''}>제목</option>
					<option value="body" ${param.type == 'body' ? 'selected' : ''}>본문</option>

				</select>

				<input type="search" class="form-control me-2" name="keyword" />
				<button class="btn btn-outline-success">
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>


			</form>

		</div>
	</div>
</nav>