<%@page import="hibernate.noteTaker.note.Note"%>
<%@page import="hibernate.noteTaker.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Notes</title>
<%@include file="navbar.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="all_js_css.jsp"%>
		<h1>Update Notes</h1>
		<br>
		<%
		int id = Integer.parseInt(request.getParameter("noteId").trim());
		Session s = FactoryProvider.getFactory().openSession();
		
		// Since we've used the id, that means we get the data that belongs to that id.
		// The fetched data is stored in the note object, using the note object, 
		// We can get the requried field and edit it.
		Note note = (Note) s.get(Note.class, id);
		%>

		<!-- Creating the Form to Update the Notes  -->
		<div class="container">
			<%@include file="navbar.jsp"%>
			<br>
			<form action="UpdatingNoteServlet" method="post">
			
			<!-- Sending the ID to use it in the Servlet -->
			<input  value="<%=note.getId()%>" name="noteId" type="hidden"/>
			
				<div class="form-group">
					<label for="title">Note Title</label> <input name="noteTitle"
						required type="text" class="form-control" id="title"
						aria-describedby="title" placeholder="Enter Title"
						value="<%=note.getTitle()%>">
				</div>

				<div class="form-group">
					<label for="Content">Note Content</label>
					<textarea name="noteContent" required id="content"
						placeholder="Enter your content here" class="form-control"
						style="height: 300px"><%=note.getContent()%></textarea>
				</div>
				<div class="container text-center">
					<button type="submit" class="btn btn-success">Save</button>
				</div>
			</form>
		</div>

	</div>
</body>
</html>