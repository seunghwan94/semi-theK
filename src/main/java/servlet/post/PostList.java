package servlet.post;

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

@WebServlet("/list")
public class PostList extends HttpServlet{
	private PostService service = new PostServiceImpl();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int idx = req.getQueryString().indexOf('=');
		String cno = req.getQueryString().substring(idx+1);
		System.out.println(cno);
		Object userObj = req.getSession().getAttribute("user");
		Criteria cri = new Criteria(req);
		
		if((User)userObj == null) {
			req.getRequestDispatcher("/WEB-INF/k/user/intro.jsp").forward(req, resp);
	        return;
		}
		
		req.setAttribute("pageDto", new PageDto(cri, service.count(cri)));
		req.setAttribute("posts", service.listPost(cri));
		req.setAttribute("currentPage", "list");
		req.setAttribute("cno", cno);
		req.getRequestDispatcher("WEB-INF/k/post/list.jsp").forward(req, resp);
	}
}
