package servlet.manage.mng;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.manage.MngNtcService;
import service.manage.MngNtcServiceImpl;
import utils.Commons;
import vo.Post;

@SuppressWarnings("serial")
@WebServlet("/manage/ntc/view")
public class MngNtcView extends HttpServlet {
	private MngNtcService service = new MngNtcServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pno = req.getParameter("pno");
		Post post = service.findByNtc(pno);
		System.out.println(post);
		req.setAttribute("menu", "manage");
		req.setAttribute("tab", "n");
		req.setAttribute("post", post);
		
		req.getRequestDispatcher("/WEB-INF/k/manage/manageAnnView.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pno = req.getParameter("pno");
		
		if(service.removeNtc(Integer.parseInt(pno))) {
			Commons.printMsg("삭제 되었습니다.", "k/manage/ntc", resp);
		}else {
			Commons.printMsg("서비스 오류.", "ann/view?pno="+pno, resp);
		}
	}
	
	
}
