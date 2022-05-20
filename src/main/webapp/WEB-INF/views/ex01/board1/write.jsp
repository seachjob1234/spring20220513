<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<%@ taglib prefix="my"  tagdir = "/WEB-INF/tags/" %>
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
<my:ex01tags current="write"></my:ex01tags>
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>글 작성</h1>


				<c:url value="/ex01/board/write" var="writeLink" />

				<form action="${writeLink }" method="post">
					<div>
						<label class="form-label" for="input1">제목</label> 
						<input class= "form-control" type="text" name="title" value="새 제목" repuired id="input1" /> <br />

					</div>
					네 테그 누르면 오류가 뜹니다.

					<div>
						<label for="textareal1">본문 </label> 
						<textarea class="form-control" name = "body" id="" cols="30" rows="10">새 글</textarea> <br />
					</div>
					<button class="btn btn-primary">등록</button>
				</form>
			</div>
		</div>
	</div>
</body>

</html>