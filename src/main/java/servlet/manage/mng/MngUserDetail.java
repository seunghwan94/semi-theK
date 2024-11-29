package servlet.manage.mng;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MngUserDto;
import service.ManageService;
import service.ManageServiceImpl;
import vo.User;
import vo.UserDetail;

@SuppressWarnings("serial")
@WebServlet("/manage/userDetail")
public class MngUserDetail extends HttpServlet {
	private ManageService service = new ManageServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		
		MngUserDto userInfo = service.findByUser(id);
		req.setAttribute("menu", "manage");
		req.setAttribute("tab", "u");
		req.setAttribute("userInfo", userInfo);
		
		req.getRequestDispatcher("/WEB-INF/k/manage/manageUserDetail.jsp").forward(req, resp);
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// User
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");		
		String nickName = req.getParameter("nickName");
		// UserDetail
		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		String grade = req.getParameter("grade");
		String addr = req.getParameter("addr");
		String detailAddr = req.getParameter("detailAddr");
		
		boolean pwReset = Boolean.parseBoolean(req.getParameter("pwReset"));
		if (pwReset) pw = "12345";
		
		User user = User.builder().id(id).pw(pw).nickName(nickName).build();
		UserDetail userDetail = UserDetail.builder().id(id).name(name).gender(gender).addr(addr).detailAddr(detailAddr).grade(grade).build();
		MngUserDto userDto = new MngUserDto(user,userDetail);
		
		boolean modifyCk = service.modifyUser(userDto);

		String ck = modifyCk + "";
		if(pwReset && modifyCk) ck = "BY"; // 비밀번호 초기화
		
		req.getSession().setAttribute("ck", ck);    // 세션에 상태 저장
	    req.getSession().setMaxInactiveInterval(3); // 2초
	    
    	resp.sendRedirect(req.getContextPath() + "/manage/userDetail?id=" + id);
	}
	
	
}
