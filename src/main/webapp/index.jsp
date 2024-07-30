<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">

<title>Home</title>

</head>

<body>

	<div class="container">
		<%@include file="all_js_css.jsp"%>
	</div>

	<div class="container">
		<%@include file="navbar.jsp"%>
		<div class="card mt-2">
			<div class="container mt-4 text-center">
			
				<h1 class="text-primary text-uppercase text-center mt-3">Welcome
					to Note Taker</h1>
					
				<img class="card-img-top pt-2" style="max-width: 350px;"
					src="img/note.png" alt="Card image cap">
					
				<div class="container text-center">
					<button class="btn btn-primary text-center mt-4"
						onclick="window.location.href='add_notes.jsp';">Add Notes</button>
				</div>


			</div>
		</div>
	</div>

</body>

</html>