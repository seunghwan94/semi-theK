package servlet.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CategorySerivceImpl;
import service.CategoryService;
import service.PostService;
import service.PostServiceImpl;
import service.UserService;
import service.UserServiceImpl;
import utils.Commons;
import vo.User;

@WebServlet("/index")
public class Index extends HttpServlet {
	private PostService postService = new PostServiceImpl();
	private CategoryService categoryService = new CategorySerivceImpl();
//	private UserService userService = new UserServiceImpl();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		System.out.println("---------인덱스 시작");
		req.setAttribute("subC", categoryService.listSub());
		req.setAttribute("posts", postService.lastPost());
//		System.out.println("오브젝트 잘 들어오나?");
//		Object userObj = req.getSession().getAttribute("user");
		User user = (vo.User)req.getSession().getAttribute("user");
		System.out.println((User)user);
		if(user == null) {
//			Commons.printMsg("SYS :: No Session Info ; Log in first", "/WEB-INF/k/user/intro.jsp", resp);
//			resp.sendRedirect("/WEB-INF/k/user/intro.jsp");
			req.getRequestDispatcher("/WEB-INF/k/user/intro.jsp").forward(req, resp);
	        return;
		}
//		User user = (User) userObj;
	    System.out.println("SYS :: User Info : " + user);
		System.out.println(user);
		req.getRequestDispatcher("/WEB-INF/k/main/index.jsp").forward(req, resp);
	}
}