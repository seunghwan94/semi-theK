package servlet.manage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import dto.PageDto;
import service.ManageService;
import service.ManageServiceImpl;
import vo.Post;

@SuppressWarnings("serial")
@WebServlet("/manage/ann")
public class ManageAnn extends HttpServlet{
	private ManageService service = new ManageServiceImpl();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Criteria cri = new Criteria(req);
		
		req.setAttribute("menu", "manage");
		req.setAttribute("tab", "a");
		
		req.setAttribute("annPost", service.listAnn(cri));
		req.setAttribute("currentPage", "ann");
		req.setAttribute("pageDto", new PageDto(cri, service.count(cri)));
		
		req.getRequestDispatcher("/WEB-INF/k/manage/manageAnn.jsp").forward(req, resp);
	}
	
}
