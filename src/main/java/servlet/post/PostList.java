package servlet.post;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.PostServiceImpl;
import vo.Post;

@WebServlet("/list")
public class PostList extends HttpServlet{

	List<Post> postList = new PostServiceImpl().listPost();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("posts", postList);
		req.getRequestDispatcher("WEB-INF/k/post/list.jsp").forward(req, resp);
	}
}
