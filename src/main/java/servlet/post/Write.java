package servlet.post;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/post/write")
public class Write extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getParameter("pno");
		req.getRequestDispatcher("/WEB-INF/k/post/write.jsp").forward(req, resp);
//		req.setAttribute("criteria", criteria);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String title = req.getParameter("title"); 
		String content = req.getParameter("content"); 
		String writer  = req.getParameter("writer");
		
	}
	
	
	
}
