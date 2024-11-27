package servlet.post;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.ManageServiceImpl;
import service.PostServiceImpl;
import vo.Post;

@WebServlet("/post/write")
public class Write extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cno = req.getParameter("cno");
//		String userId = req.getSession();
		req.getRequestDispatcher("/WEB-INF/k/post/write.jsp").forward(req, resp);
//		req.setAttribute("criteria", criteria);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String title = req.getParameter("title"); 
//		System.out.println(title);
//		String content = req.getParameter("content");
//		System.out.println(content);
//		String writer  = req.getParameter("writer");
//		System.out.println(writer);
		System.out.println(":::::::::::::");
		Gson gson = new Gson();
		Post post = gson.fromJson(req.getReader(), Post.class);
//        resp.setContentType("application/json; charset=utf-8");
        System.out.println(post);

        try {
        	int i = new PostServiceImpl().addPost(post);
        	if(i == 1) {
        		resp.getWriter().print(gson.toJson("success"));        	
        	}else {
        		resp.getWriter().print(gson.toJson("fail"));
        	}
        }catch(Exception e) {
        	resp.getWriter().print(gson.toJson("error"));  
        }
	}
}
