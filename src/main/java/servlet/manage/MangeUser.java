package servlet.manage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ManageServiceImpl;
import vo.User;

@SuppressWarnings("serial")
@WebServlet("/manage/user")
public class MangeUser extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<User> userArr =  new ManageServiceImpl().list();
		System.out.println(userArr);
		
		req.setAttribute("menu", "manage");
		req.setAttribute("tab", "u");
		req.setAttribute("users", userArr);	
		req.getRequestDispatcher("/WEB-INF/k/manage/manageUser.jsp").forward(req, resp);
	}
}
