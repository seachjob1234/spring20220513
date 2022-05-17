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
	$(document).ready(function() {
		$("#edit-button1").click(function() {
			$("#input1").removeAttr("readonly");
			$("#textarea1").removeAttr("readonly");
			$("#modify-submit1").removeClass("d-none");
			$("#delete-submit1").removeClass("d-none");
		});

		$("#delete-submit1").click(function(e) {
			e.preventDefault();

			if (confirm("삭제하시겠습니까?")) {
				let form1 = $("#form1");
				let actionAttr = "${appRoot}/ex01/board/remove";
				form1.attr("action", actionAttr);

				form1.submit();
			}

		});
		$(".reply-edit-toggle-button").click(function() {
			console.log("버튼클릭");
			const replyId = $(this).attr("data-reply-id");
			const displayDivId = "#replyDisplayContainer" + replyId;
			const editFormId = "#replyEditFormContainer" + replyId;

			console.log(replyId);
			console.log(displayDivId);
			console.log(editFormId);

			$(displayDivId).hide();
			$(editFormId).show();
		});

		// reply-delete-button 클릭시
		$(".reply-delete-button").click(function() {
			const replyId = $(this).attr("data-reply-id");
			const message = "댓글을 삭제하시겠습니까?";

			if (confirm(message)) {
				$("#replyDeleteInput1").val(replyId);
				$("#replyDeleteForm1").submit();
			}
		});
	});
</script>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>글 본문</h1>
				<button id="edit-button1" class="btn btn-secondary">
					<i class="fa-solid fa-pen-to-square"></i>
				</button>
				</h1>

				<c:if test="${not empty param.success }">
					<c:if test="${param.success }">
						<div class="alert alert-primary">게시물이 수정되었습니다.</div>
					</c:if>
					<c:if test="${not param.success }">
						<div class="alert alert-danger">게시물 수정 중 문제가 발생하였습니다.</div>
					</c:if>
				</c:if>


				<c:url value="/ex01/board/modify" var="modifyLink"></c:url>
				<h1>${board1.id }번게시물</h1>
				<div>
					<form id="form1" action="${modifyLink }" method="post">
						<input type="hidden" name="id" value="${board1.id }" /> 제목 : <input
							type="text" value="${board1.title }" name="title" /> <br /> 본문:
						<textarea cols="30" rows="10" name="body">${board1.body }</textarea>
						<br />


						<div>
							<label for="input2" class="form-label"> 작성일시 :</label> <input
								type="datetime-local" value="${board1.inserted }" readonly /> <br />
						</div>





						<button id="modify-submit1" class="btn btn-primary">수정</button>
						<button id="delete-submit1" class="btn btn-danger">삭제</button>
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

						<button class="btn btn-outline-secondary">
							<i class="fa-solid fa-comment-dots"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
		<hr />
		<div class="container mt-3">
			<div class="row">
				<div class="col">
					<h3>댓글 ${board1.numOfReply } 개</h3>
					<ul class="list-group">
						<c:forEach items="${replyList }" var="reply">
							<li class="list-group-item">

								<div style="border: 1px solid black; margin-bottom: 3px;">
									${reply.inserted } :

									<c:url value="/ex02/reply/modify" var="replyModifyLink" />
									<form action="${replyModifyLink }" method="post">
										<input type="hidden" value="${reply.id }" name="id" /> <input
											type="hidden" name="boardId" value="${board1.id }" /> <input
											type="text" value="${reply.content }" name="content" />
										<button>수정</button>
									</form>
							</li>
						</c:forEach>
					</ul>
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
	</div>
	</div>

</body>

</html>