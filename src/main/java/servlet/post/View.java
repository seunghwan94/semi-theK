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
import utils.Commons;

@WebServlet("/list/view")
public class View extends HttpServlet{

	private PostService postService = new PostServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria criteria = new Criteria(req);
//		String cnoString = req.getParameter("cno");
//		Object userObj = req.getSession().getAttribute("userId");
//		String redirectURL = "list?" + criteria.getQs2();
//		if(cnoString == null || userObj == null) {
//			Commons.printMsg("SYSTEM :: ERR / INVALID APPROACH", redirectURL, resp);
//			return;
//		}
		
		int idx = req.getQueryString().indexOf('=');
		String pno = req.getQueryString().substring(idx+1);
		
		req.setAttribute("post", postService.view(Integer.parseInt(pno)));
		req.setAttribute("criteria", criteria);
		req.getRequestDispatcher("/WEB-INF/k/post/view.jsp").forward(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
}
