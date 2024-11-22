package servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;
import service.UserServiceImpl;
import vo.User;

@WebServlet("/signup")
public class Signup extends HttpServlet{
	private UserService service = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/k/user/intro.jsp").forward(req, resp);// 이거 내일 수정해야 됨
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");//한글 깨짐 방지
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String att = req.getParameter("att");
		String nickname = req.getParameter("nickname");
		
	
		User user = User.builder()
				.id(id)
				.id(id)
				.att(att)
				.pw(pw)
				.pw(pw)
				.nickname(nickname)
				.build();
		
		System.out.println(user);
		service.register(user);
		
		resp.sendRedirect("singup");
	}
	
	
}
