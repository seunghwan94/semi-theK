package servlet.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/manage/menu")
public class ManageMenu extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("menu", "manage");
		req.setAttribute("tab", "m");
		req.getRequestDispatcher("/WEB-INF/k/manage/manageMenu.jsp").forward(req, resp);
	}
	
}
