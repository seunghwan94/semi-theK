package servlet.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CategorySerivceImpl;
import service.CategoryService;
import service.PostService;
import service.PostServiceImpl;
import vo.Category;
import vo.Post;

@WebServlet("/index")
public class Index extends HttpServlet {
	
	private PostService postService = new PostServiceImpl();
	List<Category> subCategories =  new CategorySerivceImpl().listSub();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setAttribute("subC", subCategories);
		req.setAttribute("posts", postService);
		
		req.getRequestDispatcher("/WEB-INF/k/main/index.jsp").forward(req, resp);
	}
	
}
