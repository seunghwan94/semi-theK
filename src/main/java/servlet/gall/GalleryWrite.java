package servlet.gall;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CategorySerivceImpl;
import service.CategoryService;
import vo.Post;

@WebServlet("/kallery/write")
public class GalleryWrite extends HttpServlet{
	private CategoryService categoryService = new CategorySerivceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("subC", categoryService.listSub());
		req.getRequestDispatcher("/WEB-INF/k/gall/galleryWrite.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		String img = req.getParameter("sendImg");
		String tmp = req.getParameter("content");
		String userId = req.getParameter("writer");
		
		String content = img + "&%$^&" + tmp;
		
		
		Post post = Post.builder().title(title).content(content).userId(userId).build();
		
		System.out.println(post);
		
		
	}
	
	
}
	