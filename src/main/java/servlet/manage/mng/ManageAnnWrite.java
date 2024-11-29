package servlet.manage.mng;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.ManageService;
import service.ManageServiceImpl;
import vo.Post;

@SuppressWarnings("serial")
@WebServlet("/manage/ann/write")
public class ManageAnnWrite extends HttpServlet {
	private ManageService service = new ManageServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pno = req.getParameter("pno");
		if(pno != null) {
			Post post = service.findByPostAnn(pno);
			req.setAttribute("post", post);
		}
		
		req.setAttribute("menu", "manage");
		req.setAttribute("tab", "a");
		req.getRequestDispatcher("/WEB-INF/k/manage/manageAnnWrite.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Gson gson = new Gson();
		Post post = gson.fromJson(req.getReader(), Post.class);
		int i=0;
		
        try {
        	if(post.getPno()==0) {
        		i = service.addPostAnn(post);
        	}else {
        		i = service.modifyPostAnn(post);
        	}
        	if(i == 1) {
        		resp.getWriter().write("success");
        	}else {
        		resp.getWriter().write("fail");
        	}
        }catch(Exception e) {
        	resp.getWriter().write("error");
        }
        
	}
	
	
}
