package servlet.gall;

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
import service.common.ServiceCommon;
import service.manage.MngNtcService;
import service.manage.MngNtcServiceImpl;
import utils.Commons;
import vo.Post;

@WebServlet("/kallery/write")
public class GalleryWrite extends HttpServlet{
	private CategoryService categoryService = new CategorySerivceImpl();
	private PostService service = new PostServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("subC", categoryService.listSub());
		req.getRequestDispatcher("/WEB-INF/k/gall/galleryWrite.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Post post = ServiceCommon.getJson(req, Post.class);
		
		int i = service.addPost(post);
		System.out.println(i);
		if(i==1) {
			ServiceCommon.sendJson(resp, "success");
		}else {
			ServiceCommon.sendJson(resp, "fail");
		}
		
		
		
	}
	
	
}
	