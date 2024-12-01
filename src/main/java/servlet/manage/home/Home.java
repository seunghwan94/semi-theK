package servlet.manage.home;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.manage.HomeService;
import service.manage.HomeServiceImpl;
import vo.Statistics;

@SuppressWarnings("serial")
@WebServlet({"/manage","/manage/home"})
public class Home extends HttpServlet {
	private HomeService service = new HomeServiceImpl();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("menu", "home");
		
		List<Statistics> userTotal = service.userTotal();
		List<Statistics> genderTotal = service.genderTotal();
		List<Statistics> nameTotal = service.nameTotal();
		List<Statistics> gradeTotal = service.gradeTotal();
		List<Statistics> userCreateTotal = service.userCreateTotal();	// 가입 회원
		List<Statistics> postTotal = service.postTotal();				// 게시글
		List<Statistics> likeTotal = service.likeTotal(); 				// 좋아요
		
		req.setAttribute("userTotal", userTotal);
		req.setAttribute("genderTotal", genderTotal);
		req.setAttribute("nameTotal", nameTotal);
		req.setAttribute("gradeTotal", gradeTotal);
		req.setAttribute("userCreateTotal", userCreateTotal);
		req.setAttribute("postTotal", postTotal);
		req.setAttribute("likeTotal", likeTotal);
		
		req.getRequestDispatcher("/WEB-INF/k/manage/home.jsp").forward(req, resp);
	}
	
}
