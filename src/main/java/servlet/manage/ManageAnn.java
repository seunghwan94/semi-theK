package servlet.manage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ManageServiceImpl;
import vo.Category;
import vo.Post;

@WebServlet("/manage/ann")
public class ManageAnn extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Post> annPost =  new ManageServiceImpl().listAnn();
		System.out.println(annPost.toString());
		req.setAttribute("menu", "manage");
		req.setAttribute("tab", "a");
		req.setAttribute("annPost", annPost);
		
		req.getRequestDispatcher("/WEB-INF/k/manage/manageAnn.jsp").forward(req, resp);
	}
	
}
