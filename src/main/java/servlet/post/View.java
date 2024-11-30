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

@WebServlet("/list/view")
public class View extends HttpServlet{

	private PostService postService = new PostServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria criteria = new Criteria(req);
//		String cnoString = req.getParameter("cno");
		Object userObj = req.getSession().getAttribute("user");
//		String redirectURL = criteria.getQs2();
		
		System.out.println(userObj + ":::::");
//		System.out.println(userObj + ":::::");
		
//		if (((User)userObj) == null || cnoString == null) {
//	    	Commons.printMsg("SYSTEM :: ERR / INVALID APPROACH", redirectURL, resp);
//	        return;
//		}
		
		int idx = req.getQueryString().indexOf('=');
		String pno = req.getQueryString().substring(idx+1);
		
		System.out.println(pno);
		
		req.setAttribute("post", postService.view(Integer.parseInt(pno)));
		req.setAttribute("criteria", criteria);
		req.getRequestDispatcher("/WEB-INF/k/post/view.jsp").forward(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
}
