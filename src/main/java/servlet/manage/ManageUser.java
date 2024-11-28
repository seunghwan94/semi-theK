package servlet.manage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import dto.ManageUserDto;
import dto.PageDto;
import service.ManageService;
import service.ManageServiceImpl;
import vo.User;
import vo.UserDetail;

@SuppressWarnings("serial")
@WebServlet("/manage/user")
public class ManageUser extends HttpServlet {
	private ManageService service = new ManageServiceImpl();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Criteria cri = new Criteria(req);
		
		req.setAttribute("menu", "manage");
		req.setAttribute("tab", "u");;
		
		req.setAttribute("users", service.listUser(cri));
		
		req.setAttribute("currentPage", "user");
		req.setAttribute("pageDto", new PageDto(cri, service.count(cri)));
		
		
		req.getRequestDispatcher("/WEB-INF/k/manage/manageUser.jsp").forward(req, resp);
	}
}
