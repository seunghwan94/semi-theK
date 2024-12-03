package servlet.post;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import service.PostService;
import service.PostServiceImpl;
import service.UserService;
import service.UserServiceImpl;
import utils.Commons;
import vo.Post;
import vo.User;

@WebServlet("/list/view")
public class View extends HttpServlet{

	private PostService postService = new PostServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria criteria = new Criteria(req);
		String cnoString = req.getParameter("pno");
		Object userObj = req.getSession().getAttribute("user");
		String redirectURL = criteria.getQs2();
		userObj = (User)userObj;
		if (userObj == null || cnoString == null) {
	    	Commons.printMsg("SYSTEM :: ERR / INVALID APPROACH", redirectURL, resp);
	        return;
		}
		
		String pno = req.getParameter("pno");
		Post pnoView = postService.view(Integer.parseInt(pno));
		
		req.setAttribute("user", userObj);
		req.setAttribute("post", pnoView);
		System.out.println(pnoView);
		req.setAttribute("criteria", criteria);
		req.getRequestDispatcher("/WEB-INF/k/post/view.jsp").forward(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
}
