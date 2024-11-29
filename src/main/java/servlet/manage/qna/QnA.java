//package servlet.manage.qna;
//
//import java.io.IOException;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import dto.Criteria;
//import dto.PageDto;
//import service.ManageService;
//import service.ManageServiceImpl;
//
//@SuppressWarnings("serial")
//@WebServlet("/manage/qna")
//public class QnA extends HttpServlet{
//	private ManageService service = new ManageServiceImpl();
//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		
//		Criteria cri = new Criteria(req);
//		cri.setCno(84);
//		req.setAttribute("menu", "qna");
//		
//		req.setAttribute("annPost", service.listQnA(cri));
//		
//		req.setAttribute("currentPage", "qna");
//		req.setAttribute("pageDto", new PageDto(cri, service.count(cri)));
//		
//		
//		req.getRequestDispatcher("/WEB-INF/k/manage/QnA.jsp").forward(req, resp);
//	}
//	
//}
