package servlet.user;

import java.io.IOException;
import java.net.URLDecoder;

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

//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.getRequestDispatcher("/WEB-INF/k/user/intro.jsp").forward(req, resp);
//		System.out.println("회원가입 버튼 눌렀을때");
//	}
//	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.setCharacterEncoding("utf-8");//한글 깨짐 방지
		String id = req.getParameter("useremail");
		String pw = req.getParameter("pwd");
		String att = req.getParameter("att");
		String nickname = req.getParameter("nickname");
		System.out.println("222222");
		System.out.println(id);
	
		User user = User.builder()
			
				.id(id)
				.att(att)
				.pw(pw)
				.nickName(nickname)
				.build();
//		
		System.out.println(user);
		String redirectURL = req.getContextPath() + "/intro";
		String url = req.getParameter("url");
		if (url != null && !url.equals("")) {
			redirectURL = URLDecoder.decode(url, "utf-8");
		}
		resp.sendRedirect(redirectURL);

		System.out.println(user);
		
		service.register(user);
		resp.sendRedirect("/signup");
	}
	
	
}
