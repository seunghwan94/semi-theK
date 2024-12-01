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
import service.common.ServiceCommon;
import vo.Taboo;
import vo.User;
import vo.UserEmail;
import vo.UserLog;

@WebServlet("/signin")
public class Signin extends HttpServlet {
	private UserService service = new UserServiceImpl();


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user = ServiceCommon.getJson(req, User.class);
//		UserLog userLog = ServiceCommon.getJson(req, UserLog.class);
		
		req.setCharacterEncoding("utf-8");
		String saveid = req.getParameter("remember-id");
		resp.setContentType("application/json; charset=utf-8");
		
		if (service.login(user.getId(),user.getPw())) {
			HttpSession session = req.getSession();
			session.setAttribute("user", service.findBy(user.getId()));
			if (saveid != null) {
				Cookie cookie = new Cookie("remember-id", user.getId());
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

			System.out.println(user.getId());
			
			UserLog userLog = UserLog.builder()
					.userId(user.getId())
					.build();
			
			String redirectURL = req.getContextPath() + "/index";
			String url = req.getParameter("url");
			if (url != null && !url.equals("")) {
				redirectURL = URLDecoder.decode(url, "utf-8");
			}
			service.register(userLog);
			ServiceCommon.sendJson(resp, "success");
			/* resp.sendRedirect(redirectURL); */
		} else {
			ServiceCommon.sendJson(resp, "fail");
			/* resp.sendRedirect("login?msg=fail"); */
			
		}

	}

}
