package servlet.post;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.PostService;
import service.PostServiceImpl;
import utils.Commons;

@WebServlet("/list/view")
public class View extends HttpServlet{

	private PostService postService = new PostServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pnoString = req.getParameter("pno");
		if(pnoString == null) {
			Commons.printMsg("SYSTEM :: ERR / INVALID APPROACH", "list", resp);
			return;
		}
		Long pno = Long.valueOf(pnoString);
		req.setAttribute("post", postService.view(pno));
		super.doGet(req, resp);
	}
	
	
	
}
