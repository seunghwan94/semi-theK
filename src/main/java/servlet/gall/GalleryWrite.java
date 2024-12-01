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
import vo.User;

@SuppressWarnings("serial")
@WebServlet("/kallery/write")
public class GalleryWrite extends HttpServlet{
	private PostService service = new PostServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pno = req.getParameter("pno");
		User user = (vo.User)req.getSession().getAttribute("user");
		
		Post post;
		if (pno != null) {
			post = service.findBy(Integer.parseInt(pno));
		}else {
			post = Post.builder().userId(user.getId()).build();
		}
		req.setAttribute("post", post);
		
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
	