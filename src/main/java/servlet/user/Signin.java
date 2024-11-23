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

import service.UserService;
import service.UserServiceImpl;
import vo.User;

@WebServlet("/signin")
public class Signin extends HttpServlet {
	private UserService service = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("/WEB-INF/k/user/signin.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String saveid = req.getParameter("remember-id");

		if (service.login(id, pw)) {
			HttpSession session = req.getSession();
			session.setAttribute("user", service.findBy(id));

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

}
