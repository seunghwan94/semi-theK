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
import vo.User;

@WebServlet("/list/remove")
public class Remove extends HttpServlet{
	
	private PostService postService = new PostServiceImpl();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pnoStr = req.getParameter("pno");
		Object memberObj = req.getSession().getAttribute("user");
		Criteria criteria = new Criteria(req);
		String redirectURL = "list?" + criteria.getQs2();
		if(pnoStr == null || memberObj == null) {
			Commons.printMsg("SYSTEM :: ERR / INVALID APPROACH", redirectURL, resp);
			return;
		}
		
		Integer pno = Integer.valueOf(pnoStr);
		User m = (User)memberObj;
		
		if(!m.getId().equals(postService.findBy(pno).getUserId())) {
			Commons.printMsg("SYSTEM :: ERR / POST CAN BE ONLY REMOVED BY WRITER OF IT\'S OWN", redirectURL, resp);
			return;
		}
		
		// 수정 = 조회 + 등록
		postService.remove(pno);
		resp.sendRedirect(redirectURL);
	}
	
	
	
}
