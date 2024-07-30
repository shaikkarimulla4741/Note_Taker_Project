package hibernate.noteTaker.deleteNote;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import hibernate.noteTaker.helper.FactoryProvider;
import hibernate.noteTaker.note.Note;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteNoteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		Getting the Id of the Note from the show_notes.  
		int id = Integer.parseInt(request.getParameter("noteId").trim());

//		Using the Note ID to fetch the data from the Data Base using the Hibernate and deleting it.
		Session s = FactoryProvider.getFactory().openSession();
		
//		Creating the Transaction to save the physical changes to the Data Base after deleting the Note.
		Transaction t = s.beginTransaction();
		
//		Fetching the data using Note Id.
		Note note = (Note) s.get(Note.class, id);
		
//		Deleting the Note in Data Base.
		s.delete(note);
		
//		Saving the changes in the Data Base.
		t.commit();
		s.close();
		
//		Again redirecting the 
		response.sendRedirect("show_notes.jsp");

	}

}
