package servlet.manage.mng;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.common.ServiceCommon;
import service.manage.MngNtcService;
import service.manage.MngNtcServiceImpl;
import vo.Post;
import vo.User;

@SuppressWarnings("serial")
@WebServlet("/manage/ntc/write")
public class MngNtcWrite extends HttpServlet {
	private MngNtcService service = new MngNtcServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pno = req.getParameter("pno");
		Post post = new Post();
		if(pno != null) {
			post = service.findByNtc(pno);
			req.setAttribute("post", post);
			
		}else {
			User user = (vo.User)req.getSession().getAttribute("user");
			post.setUserId(user.getId());
			
			req.setAttribute("post", post);
		}
		
		req.setAttribute("menu", "manage");
		req.setAttribute("tab", "a");
		req.getRequestDispatcher("/WEB-INF/k/manage/manageAnnWrite.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Post post = ServiceCommon.getJson(req, Post.class);
		
		boolean ck;
        try {
        	if(post.getPno()==0) {
        		ck = service.addNtc(post);
        	}else {
        		ck = service.modifyNtc(post);
        	}
        
        	if(ck) {
        		ServiceCommon.sendJson(resp, "success");
        		return;
        	}
    		ServiceCommon.sendJson(resp, "fail");

        }catch(Exception e) {
        	ServiceCommon.sendJson(resp, "error");
        }
        
	}
	
	
}
