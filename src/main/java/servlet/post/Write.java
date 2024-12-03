package servlet.post;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.CategorySerivceImpl;
import service.CategoryService;
import service.PostServiceImpl;
import service.common.ServiceCommon;
import vo.Category;
import vo.Post;

@WebServlet("/post/write")
public class Write extends HttpServlet{
	private CategoryService categoryService = new CategorySerivceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cno = req.getParameter("cno");
//		String userId = req.getSession();
		List<Category> subCategories = categoryService.listSub();
	    req.setAttribute("categories", subCategories);
	    req.setAttribute("urlCno", cno);
		req.getRequestDispatcher("/WEB-INF/k/post/write.jsp").forward(req, resp);
//		req.setAttribute("criteria", criteria);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Gson gson = new Gson();
		Post post = ServiceCommon.getJson(req, Post.class);
		System.out.println(post);

        try {
        	int i = new PostServiceImpl().addPost(post);
        	System.out.println(i);
        	if(i == 1) {
        		System.out.println("suc");
        		resp.getWriter().write("success");        	
        	}
        	else {
        		System.out.println("fail");
        		resp.getWriter().write("fail");
        	}
        }catch(Exception e) {
        	resp.getWriter().print(gson.toJson("error"));  
        }
	}
}
