package servlet.promotion;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import dto.PageDto;
import service.PostService;
import service.PostServiceImpl;
import vo.User;

@WebServlet("/promotion/promotionlist")
public class PromotionList extends HttpServlet{
	PostService postService = new PostServiceImpl();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int idx = req.getQueryString().indexOf('=');
		String cno = req.getQueryString().substring(idx+1);
		Object userObj = req.getSession().getAttribute("user");
		Criteria cri = new Criteria(req);
		if((User)userObj == null) {
			req.getRequestDispatcher("/WEB-INF/k/user/intro.jsp").forward(req, resp);
	        return;
		}
		req.setAttribute("pageDto", new PageDto(cri, postService.count(cri)));
		req.setAttribute("posts", postService.listPost(cri));
		req.setAttribute("currentPage", "list");
		req.setAttribute("cno", cno);
		req.getRequestDispatcher("/WEB-INF/k/promotion/promotion.jsp").forward(req, resp);
	}
}
