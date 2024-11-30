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
import service.common.ServiceCommon;
import utils.Commons;
import vo.Post;
import vo.User;

@WebServlet("/list/modify")
public class Modify extends HttpServlet{
	private PostService service = new PostServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pnoStr = req.getParameter("pno");
		Object userObj = req.getSession().getAttribute("user");
		Criteria criteria = new Criteria(req);
		String redirectURL = "list?" + criteria.getQs2();
		if(pnoStr == null || userObj == null) {
			Commons.printMsg("SYSTEM :: ERR / INVALID APPROACH", redirectURL, resp);
			return;
		}
		
		Integer pno = Integer.valueOf(pnoStr);
		String e = service.findBy(pno).getUserId();
		if(!((User)userObj).getId().equals(service.findBy(pno).getUserId())) { // 작성자와 접근자의 아이디가 같지 않을 경우 return;
			Commons.printMsg("SYSTEM :: ERR / POST CAN BE ONLY REMOVED BY WRITER OF IT\\'S OWN", redirectURL, resp);
			return;
		}
		req.setAttribute("criteria", criteria);
		req.setAttribute("post", service.findBy(pno));
		req.getRequestDispatcher("/WEB-INF/k/post/modify.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PostService service = new PostServiceImpl();
		Criteria criteria = new Criteria(req);
		Post post = ServiceCommon.getJson(req, Post.class);
		if(post.getUserId() == null) {
			Commons.printMsg("SYSTEM :: ERR / INVALID APPROACH", "list?" +criteria.getQs2(), resp);
			return;
		}
		service.update(post);
		ServiceCommon.sendJson(resp, "success");
	}
}
