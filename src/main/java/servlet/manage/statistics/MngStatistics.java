package servlet.manage.statistics;

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
@WebServlet("/manage/statistics")
public class MngStatistics extends HttpServlet{
	private HomeService service = new HomeServiceImpl();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Statistics> userTotal = service.userTotal();				// 가입 회원
		List<Statistics> postTotal = service.postTotal();				// 게시글
		List<Statistics> likeTotal = service.likeTotal(); 				// 좋아요
		List<Statistics> userCreateTotal = service.userCreateTotal();	// 가입 날짜별 회원
		List<Statistics> genderTotal = service.genderTotal();			// 성별

		
		req.setAttribute("userTotal", userTotal);
		req.setAttribute("genderTotal", genderTotal);
		req.setAttribute("userCreateTotal", userCreateTotal);
		req.setAttribute("postTotal", postTotal);
		req.setAttribute("likeTotal", likeTotal);
		
		List<Statistics> nameTotal = service.nameTotal();				// 이름 등록한 사람
		List<Statistics> gradeTotal = service.gradeTotal();				// 등급별 유져
		List<Statistics> postCnoTotal = service.postCnoTotal();				// 등급별 유져
		
		req.setAttribute("nameTotal", nameTotal);
		req.setAttribute("gradeTotal", gradeTotal);
		req.setAttribute("postCnoTotal", postCnoTotal);
		
		req.setAttribute("menu", "statistics");
		req.getRequestDispatcher("/WEB-INF/k/manage/statistics.jsp").forward(req, resp);
	}
	
}
