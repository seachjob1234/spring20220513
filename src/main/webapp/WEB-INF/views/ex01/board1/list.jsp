<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags/"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css"
	integrity="sha512-GQGU0fMMi238uA+a/bdWJfpUGKUkBdgfFdgBm72SUQ6BeyWjoY/ton0tEjH+OSH9iP4Dfh+7HM0I9f5eR0L/4w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	referrerpolicy="no-referrer"></script>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	<my:ex01tags />
	<div class="container">
		<div class="row">
			<div class="col">

				<h1 class="text-center">놀이터</h1>
				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>시간</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${boardList }" var="board">
							<tr>
								<td>${board.id }</td>
								<td><c:url value="/ex01/board1/${board.id }" var="link"></c:url>
									<a href="${link }"> ${board.title } </a> <c:if
										test="${board.numOfReply > 0  }">
														[${board.numOfReply }]
									</c:if></td>
								<td>${board.inserted }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>



				<nav>
					<ul class="pagination justify-content-center">

						<li class="page-item"><a class="page-link"
							href="http://localhost:8080/spr/ex01/board1/list?page=${currentPage-1 }">
								<span>&laquo;</span>
						</a></li>

						<c:forEach begin="${startPage }" end="${endPage }" var="pageNum">

							<a
								href="http://localhost:8080/spr/ex01/board1/list?page=${pageNum }">${pageNum }</a>
						</c:forEach>
						<li class="page-item"><a class="page-link"
							href="http://localhost:8080/spr/ex01/board1/list?page=${currentPage+1 }">
								<span>&raquo;</span>
						</a></li>
					</ul>
				</nav>

			</div>
		</div>
	</div>
<%-- 	<ul class="pagination justify-content-center">
		<!-- li.page-item>a.page-link>span{&laquo;} -->

		<c:if test="${prevPage >= 1 }">
			<li class="page-item"><a class="page-link"
				href="S14Servlet19?page=${prevPage }"> <span>&laquo;</span>
			</a></li>
		</c:if>
		<c:forEach begin="${startPage }" end="${endPage }" var="pageNum">
			<li class="page-item ${pageNum == currentPage ? 'active' : '' }">
				<a href="S14Servlet19?page=${pageNum }" class="page-link">${pageNum }</a>
			</li>
		</c:forEach>
		<!-- li.page-item>a>span{&raquo;} -->

		<c:if test="${endPage != lastPage }">
			<li class="page-item"><a class="page-link"
				href="S14Servlet19?page=${nextPage }"> <span>&raquo;</span>--%>
</body>
</html>