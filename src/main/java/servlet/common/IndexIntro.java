package servlet.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.User;

@SuppressWarnings("serial")
@WebServlet("/indexIntro")
public class IndexIntro extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		User user = (vo.User)req.getSession().getAttribute("user");
//		if(user == null) {
//			resp.sendRedirect("/K/intro");
//	        return;
//		}
		
		
		req.getRequestDispatcher("/WEB-INF/k/main/indexIntro.jsp").forward(req, resp);
	}
}