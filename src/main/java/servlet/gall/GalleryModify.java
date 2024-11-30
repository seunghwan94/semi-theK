package servlet.gall;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.PostService;
import service.PostServiceImpl;
import service.common.ServiceCommon;
import vo.Post;

@SuppressWarnings("serial")
@WebServlet("/kallery/modify")
public class GalleryModify extends HttpServlet{
	private PostService service = new PostServiceImpl();

	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/k/gall/galleryView.jsp").forward(req, resp);
	}



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Post post = ServiceCommon.getJson(req, Post.class);
		int i = service.update(post);
		if(i==1) {
			ServiceCommon.sendJson(resp, "success");
		}else {
			ServiceCommon.sendJson(resp, "fail");
		}
		
		
		
	}
	
	
}
	