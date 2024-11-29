package servlet.manage.mng;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import dto.PageDto;
import service.manage.MngNtcService;
import service.manage.MngNtcServiceImpl;

@SuppressWarnings("serial")
@WebServlet("/manage/ntc")
public class MngNtc extends HttpServlet{
	private MngNtcService service = new MngNtcServiceImpl();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria cri = new Criteria(req);
		
		req.setAttribute("menu", "manage");
		req.setAttribute("tab", "n");
		
		req.setAttribute("annPost", service.ntcList(cri));
		req.setAttribute("currentPage", "ntc");
		req.setAttribute("pageDto", new PageDto(cri, service.count(cri)));
		
		req.getRequestDispatcher("/WEB-INF/k/manage/manageAnn.jsp").forward(req, resp);
	}
	
}
