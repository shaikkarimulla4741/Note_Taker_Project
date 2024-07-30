<%@page import="hibernate.noteTaker.note.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="hibernate.noteTaker.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Show Notes</title>
<%@include file="all_js_css.jsp"%>
</head>

<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">All Notes:</h1>

		<%
		//  Creating the session to fetch the data from Data Base using the hibernate
		Session s = FactoryProvider.getFactory().openSession();
		//	Creating a Query to fetch the data using the session	
		Query q = s.createQuery("from Note");
		//  Storing the retrieved data in list
		List<Note> dataList = q.list();
		//  Using for Each loop to traverse and print the data
		for (Note note : dataList) {
			//out.println(note.getId() + " : " + note.getTitle());
		%>

		<div class="card mt-4">

			<div class="card-body mt-2">
				<img class="card-img-top pt-2" style="max-width: 100px;"
					src="img/notes.png" alt="Card image cap">

				<h5 class="card-title "><%=note.getTitle()%></h5>
				<p class="card-text pt-4"><%=note.getContent()%></p>
				<p class="card-text pt-2 pb-2"><%=note.getAddedDate()%></p>
				<a href="DeleteNoteServlet?noteId=<%=note.getId()%>"
					class="btn btn-danger">Delete</a>

				<!-- Sending the Note Id to the update_notes.jsp to fetch the Note from the Data Base using the Note Id -->
				<a href="update_notes.jsp?noteId=<%=note.getId()%>"
					class="btn btn-primary">Update</a>

			</div>

		</div>

		<%
		}
		s.close();
		%>

	</div>

</body>

</html>