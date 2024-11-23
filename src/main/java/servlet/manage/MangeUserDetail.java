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
@WebServlet("/manage/userDetail")
public class MangeUserDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("id");
		
		req.setAttribute("menu", "manage");
		req.setAttribute("tab", "u");
		req.setAttribute("email", email);	
		req.getRequestDispatcher("/WEB-INF/k/manage/manageUserDetail.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
}
