package servlet.gall;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import dto.PageDto;
import dto.PostDto;
import service.PostService;
import service.PostServiceImpl;
import service.common.ServiceCommon;
import vo.Post;

@SuppressWarnings("serial")
@WebServlet("/kallery")
public class Gallery extends HttpServlet{
	private PostService service = new PostServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria cri = new Criteria(req);
		String userId = "231@na1";
		cri.setCno(2);
		cri.setAmount(8);
		
		List<PostDto> postDtos = service.postAndLike(cri,userId);
		System.out.println(postDtos);
		
		req.setAttribute("posts", postDtos);
		req.setAttribute("currentPage", "kallery");
		
		req.getRequestDispatcher("/WEB-INF/k/gall/gallery.jsp").forward(req, resp);
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Post post = ServiceCommon.getJson(req, Post.class);
		
		req.setAttribute("post", service.view(post.getPno()));
	}
	
	
}
