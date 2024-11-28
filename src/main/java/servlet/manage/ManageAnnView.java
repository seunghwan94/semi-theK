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
import service.ManageService;
import service.ManageServiceImpl;
import utils.Commons;
import vo.Category;
import vo.Post;
import vo.User;
import vo.UserDetail;

@SuppressWarnings("serial")
@WebServlet("/manage/ann/view")
public class ManageAnnView extends HttpServlet {
	private ManageService service = new ManageServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pno = req.getParameter("pno");
		Post post = service.findByPostAnn(pno);
		req.setAttribute("menu", "manage");
		req.setAttribute("tab", "a");
		req.setAttribute("post", post);
		
		req.getRequestDispatcher("/WEB-INF/k/manage/manageAnnView.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pno = req.getParameter("pno");
		System.out.println(pno);
		int i = service.removePostAnn(Integer.parseInt(pno));
		
		if(i==1) {
			Commons.printMsg("삭제 되었습니다.", "/K/manage/ann", resp);
		}else {
			Commons.printMsg("서비스 오류.", "ann/view?pno="+pno, resp);
		}
	}
	
	
}
