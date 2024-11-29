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
		
//		String pnoStr = req.getParameter("45");
		String pnoStr = req.getParameter("pno");
		Object userObj = req.getSession().getAttribute("user");
		User u = User.builder().id("1@1").build();
		Criteria criteria = new Criteria(req);
		String redirectURL = "list?" + criteria.getQs2();
		System.out.println(u.getId());
		if(pnoStr == null || u == null) {
			Commons.printMsg("SYSTEM :: ERR / INVALID APPROACH", redirectURL, resp);
			return;
		}
		
		Integer pno = Integer.valueOf(pnoStr);
//		User u = (User)userObj;
		String e = service.findBy(pno).getUserId();
		System.out.println(e);
		if(!u.getId().equals(service.findBy(pno).getUserId())) { // 작성자와 접근자의 아이디가 같지 않을 경우 return;
			Commons.printMsg("SYSTEM :: ERR / POST CAN BE ONLY REMOVED BY WRITER OF IT\\'S OWN", redirectURL, resp);
			return;
		}
		req.setAttribute("criteria", criteria);
		req.setAttribute("post", service.findBy(pno));
		req.getRequestDispatcher("/WEB-INF/k/post/modify.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("------------------------");
		PostService service = new PostServiceImpl();
		Criteria criteria = new Criteria(req);
		
		Post post = ServiceCommon.getJson(req, Post.class);
		System.out.println(post);
		
		System.out.println("22222222222222222222222222");
		
		if(post.getUserId() == null) {
			Commons.printMsg("SYSTEM :: ERR / INVALID APPROACH", "list?" +criteria.getQs2(), resp);
			return;
		}
		
		
		System.out.println("33333333333");
		
		
//		if(!m.getId().equals(service.findBy(pno).getUserId())) {
//			Commons.printMsg("SYSTEM :: ERR / POST CAN BE ONLY MODED BY WRITER OF ITS OWN", "list?" +criteria.getQs2(), resp);
//			return;
//		}
		
		
		service.update(post);
		
		System.out.println("44444444");
		ServiceCommon.sendJson(resp, "success");
//		resp.sendRedirect("view?pno="+pno+ "&" +criteria.getQs2());
	}
}
