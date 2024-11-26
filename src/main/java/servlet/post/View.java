package servlet.post;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import service.PostService;
import service.PostServiceImpl;
import utils.Commons;

@WebServlet("/list/view")
public class View extends HttpServlet{

	private PostService postService = new PostServiceImpl();
	
	
}
