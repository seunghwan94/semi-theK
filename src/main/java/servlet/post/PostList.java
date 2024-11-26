package servlet.post;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.PostService;
import service.PostServiceImpl;

@WebServlet("/list")
public class PostList extends HttpServlet{
//	List<Post> postList = new PostServiceImpl().listPost();
	private PostService service = new PostServiceImpl();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println(req.getRequestURL());
		int idx = req.getQueryString().indexOf('=');
		String cno = req.getQueryString().substring(idx+1);
//		System.out.println(cno);
		
		req.setAttribute("posts", service.listPost(Integer.parseInt(cno)));
//		System.out.println(Integer.parseInt(cno));
		req.getRequestDispatcher("WEB-INF/k/post/list.jsp").forward(req, resp);
	}
}
