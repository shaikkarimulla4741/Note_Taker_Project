package hibernate.noteTaker.updateNote;

import java.io.IOException;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import hibernate.noteTaker.helper.FactoryProvider;
import hibernate.noteTaker.note.Note;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdatingNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdatingNoteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			
			int id = Integer.parseInt(request.getParameter("noteId").trim());
			String title = request.getParameter("noteTitle");
			String content = request.getParameter("noteContent");
//			Note note = new Note(title,content,new Date());

//			Storing the data in the Data Base.
//			Starting the session to save the data in session.
			Session s = FactoryProvider.getFactory().openSession();

//			Creating  Transaction to make the physical changes in Data Base.
			Transaction t = s.beginTransaction();

//			Using the ID retrieved from the form we get the same data corresponding to the ID,
//			And add the updated data with updated date and replacing the previous one.
			Note note = (Note) s.get(Note.class, id);
			note.setTitle(title);
			note.setContent(content);
			note.setAddedDate(new Date());

//			Saving the data in session.
			s.save(note);
			t.commit();
			s.close();

//			Sending the user back to the Show Notes page after successfully updating the Note.
			response.sendRedirect("show_notes.jsp");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
