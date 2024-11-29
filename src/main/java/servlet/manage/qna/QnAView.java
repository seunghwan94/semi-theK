package servlet.manage.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.manage.MngQnAService;
import service.manage.MngQnAServiceImpl;
import utils.Commons;

@SuppressWarnings("serial")
@WebServlet("/manage/qna/view")
public class QnAView extends HttpServlet {
	private MngQnAService service = new MngQnAServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pno = req.getParameter("pno");
		req.setAttribute("menu", "qna");
		req.setAttribute("post", service.findByQnA(pno));
		
		req.getRequestDispatcher("/WEB-INF/k/manage/QnAView.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pno = req.getParameter("pno");
		
		if(service.removeQnA(Integer.parseInt(pno))) {
			Commons.printMsg("삭제 되었습니다.","/k/manage/qna", resp);
		}else {
			Commons.printMsg("서비스 오류.", "qna/view?pno="+pno, resp);
		}
	}
	
	
}
