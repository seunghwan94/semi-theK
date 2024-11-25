package servlet.manage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ManageServiceImpl;
import vo.Category;

@SuppressWarnings("serial")
@WebServlet("/manage/menu")
public class ManageMenu extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Category> categories =  new ManageServiceImpl().listMenu();
		
		req.setAttribute("menu", "manage");
		req.setAttribute("tab", "m");
		req.setAttribute("menuCategory", categories);
		
		req.getRequestDispatcher("/WEB-INF/k/manage/manageMenu.jsp").forward(req, resp);
	}
	
}
