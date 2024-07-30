<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add_notes</title>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<form action="SaveNoteServlet" method="post">
			<div class="form-group">
				<label for="title">Note Title</label> <input name="noteTitle" required type="text"
					class="form-control" id="title" aria-describedby="title"
					placeholder="Enter Title">
			</div>

			<div class="form-group">
				<label for="Content">Note Content</label>
				<textarea name="noteContent" required id="content" placeholder="Enter your content here"
					class="form-control" style="height:300px"></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form>
	</div>

	<div class="container">
		<%@include file="all_js_css.jsp"%>
	</div>
</body>
</html>