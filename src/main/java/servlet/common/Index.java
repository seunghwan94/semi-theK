package servlet.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CategorySerivceImpl;
import vo.Category;

@WebServlet("/index")
public class Index extends HttpServlet {
	List<Category> categories =  new CategorySerivceImpl().selectMain();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("categories", categories);	
		req.getRequestDispatcher("/WEB-INF/k/main/index.jsp").forward(req, resp);
	}
	
}
