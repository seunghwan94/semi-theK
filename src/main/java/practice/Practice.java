package practice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ManageServiceImpl;
import vo.User;

@WebServlet("/test")
public class Practice extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<User> t =  new ManageServiceImpl().list();
		System.out.println(t);
		
		req.setAttribute("menu", "manage");
		req.setAttribute("users", t);
		
		req.getRequestDispatcher("/WEB-INF/k/manage/manage_user.jsp").forward(req, resp);
	}

}
