package hibernete.noteTaker.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import hibernate.noteTaker.helper.FactoryProvider;
import hibernate.noteTaker.note.Note;


public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveNoteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {

			String title = request.getParameter("noteTitle");
			String content = request.getParameter("noteContent");
			Note note = new Note(title,content,new Date());

//			Storing the data in the Data Base.
//			Starting the session to save the data in session.
			Session s = FactoryProvider.getFactory().openSession();
			
//			Creating  Transaction to make the physical changes in Data Base.
			Transaction t = s.beginTransaction();
			
//			Saving the data in s.
			s.save(note);
			t.commit();
			s.close();

			response.sendRedirect("show_notes.jsp");
			
//			Operation to do after submitting the data
//			response.setContentType("text/html");
//			PrintWriter out = response.getWriter();
//			out.println("<h1 style='text-align:center;'> Note Added Successfully</h1>");
//			out.println("<h1 style='text-align:center;'><a href='show_notes.jsp'>Show All Notes</a></h1>");
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
