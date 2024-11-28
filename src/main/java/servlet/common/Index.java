package servlet.common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CategorySerivceImpl;
import service.CategoryService;
import service.PostService;
import service.PostServiceImpl;

@WebServlet("/index")
public class Index extends HttpServlet {
	private PostService postService = new PostServiceImpl();
	private CategoryService categoryService = new CategorySerivceImpl();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("subC", categoryService.listSub());
		req.setAttribute("posts", postService.lastPost());
		req.getRequestDispatcher("/WEB-INF/k/main/index.jsp").forward(req, resp);
	}
}
