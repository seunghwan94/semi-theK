package servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signup123")
public class UserController extends HttpServlet {
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("인트로는 나오는데");
//		req.getRequestDispatcher("/WEB-INF/k/user/intro.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");//한글 깨짐 방지
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String att = req.getParameter("att");
		String nickname = req.getParameter("nickname");
		
		System.out.println("asd");
		System.out.println(id);
		System.out.println(pw);
		System.out.println(att);
		System.out.println(nickname);
		
	}
	
}
