package servlet.gall;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CategorySerivceImpl;
import service.CategoryService;

@WebServlet("/kallery")
public class Gallery extends HttpServlet{
	private CategoryService categoryService = new CategorySerivceImpl();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("subC", categoryService.listSub());
		req.getRequestDispatcher("/WEB-INF/k/gall/gallery.jsp").forward(req, resp);
	}
}
