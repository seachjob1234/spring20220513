<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
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
<script>
	
</script>
<body>
	<div class="container">
		<div class="row">
			<div class="col">

				<c:url value="/ex01/board/modify" var="modifyLink"></c:url>
				<h1>${board1.id }번게시물</h1>
				<div>
					<form action="${modifyLink }" method="post">
						<input type="hidden" name="id" value="${board1.id }" /> 제목 : <input
							type="text" value="${board1.title }" name="title" /> <br /> 본문:
						<textarea cols="30" rows="10" name="body">${board1.body }</textarea>
						<br /> 작성일시 : <input type="datetime-local"
							value="${board1.inserted }" readonly /> <br />
						<button class="btn btn-primary">수정</button>
					</form>

					<c:url value="/ex01/board/remove" var="removeLink" />
					<form action="${removeLink }" method="post">
						<input type="hidden" name="id" value="${board1.id }" />
						<button class="btn btn-danger">삭제</button>
					</form>
				</div>
			</div>
		</div>


		<h1>댓글</h1>
		<div class="container mt-3">
			<div class="row">
				<div class="col">
					<c:url value="/ex02/reply/add" var="replyAddLink" />
					<form action="${replyAddLink }" method="post">
						<input type="hidden" name="boardId" value="${board1.id }" /> 댓글 :
						<input type="text" name="content" size="50" />

						<button>쓰기</button>
					</form>
					<hr />
					<div>
						<c:forEach items="${replyList }" var="reply">
							<div style="border: 1px solid black; margin-bottom: 3px;">
								${reply.inserted } :

								<c:url value="/ex02/reply/modify" var="replyModifyLink" />
								<form action="${replyModifyLink }" method="post">
									<input type="hidden" value="${reply.id }" name="id" /> <input
										type="hidden" name="boardId" value="${board1.id }" /> <input
										type="text" value="${reply.content }" name="content" />
									<button>수정</button>
								</form>
							</div>
					</div>
				</div>

				<c:url value="/ex02/reply/remove" var="replyRemoveLink" />
				<form action="${replyRemoveLink }" method="post">
					<input type="hidden" name="id" value="${reply.id }" /> <input
						type="hidden" name="boardId" value="${board1.id }" />
					<button>삭제</button>
				</form>

			</div>

			</c:forEach>
		</div>
</body>

</html>