package servlet.user;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import at.favre.lib.crypto.bcrypt.BCrypt;
import service.UserEmailServiceImpl;
import service.UserService;
import service.UserServiceImpl;
import vo.User;
import vo.UserEmail;

@WebServlet("/signin")
public class Signin extends HttpServlet {
	private UserService service = new UserServiceImpl();

//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		req.getRequestDispatcher("/WEB-INF/k/user/signin.jsp").forward(req, resp);
//	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("useremail");
		String pw = req.getParameter("pwd");
		String saveid = req.getParameter("remember-id");
		System.out.println("123");
		System.out.println(id);

		
		System.out.println("111111111");
		
		if (service.login(id, pw)) {
			HttpSession session = req.getSession();
			session.setAttribute("user", service.findBy(id));
			System.out.println("22222222222");
			if (saveid != null) {
				Cookie cookie = new Cookie("remember-id", id);
				cookie.setMaxAge(60 * 60 * 3);
				resp.addCookie(cookie);
			} else {
				Cookie[] cookies = req.getCookies();
				for (Cookie c : cookies) {
					if (c.getName().equals("remember-id")) {
						c.setMaxAge(0);
						resp.addCookie(c);
						break;
					}
				}
			}
			System.out.println("333333333");
			String redirectURL = req.getContextPath() + "/index";
			String url = req.getParameter("url");
			if (url != null && !url.equals("")) {
				redirectURL = URLDecoder.decode(url, "utf-8");
			}
			resp.sendRedirect(redirectURL);
		} else {
			resp.sendRedirect("login?msg=fail");
		}

	}
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		Gson gson = new Gson();
//		String email = req.getParameter("email");
//		String pw = req.getParameter("pw");
////		System.out.println(email);
////		System.out.println(att);
//		
////		User user = new User().builder().id(id).pw(pw).build();
//		 User uesrid= new UserServiceImpl().login();
//		 resp.setContentType("application/json; charset=utf-8");
//		 if(uesrid==null) {
//			 resp.getWriter().print(gson.toJson("fail"));          	
//			 System.out.println("아이디가 존재하지 않습니다");
//		 }else {
//			 return;
//		 }
//	}
}
