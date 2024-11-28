package servlet.manage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.ManageUserDto;
import dto.PageDto;
import service.ManageServiceImpl;
import vo.Category;
import vo.Post;
import vo.User;
import vo.UserDetail;

@SuppressWarnings("serial")
@WebServlet("/manage/ann/write")
public class ManageAnnWrite extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("menu", "manage");
		req.setAttribute("tab", "a");
		req.getRequestDispatcher("/WEB-INF/k/manage/manageAnnWrite.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Gson gson = new Gson();
		Post post = gson.fromJson(req.getReader(), Post.class);

        try {
        	System.out.println("eeeee");
        	int i = new ManageServiceImpl().addPostAnn(post);
        	if(i == 1) {
        		System.out.println(i);
        		resp.getWriter().write("success");
        	}else {
        		resp.getWriter().write("fail");
        	}
        }catch(Exception e) {
        	resp.getWriter().write("error");
        }
        
	}
	
	
}
