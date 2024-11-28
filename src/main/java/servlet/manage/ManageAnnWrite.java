package servlet.manage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ManageUserDto;
import dto.PageDto;
import service.ManageServiceImpl;
import vo.User;
import vo.UserDetail;

@SuppressWarnings("serial")
@WebServlet("/manage/ann/write")
public class ManageAnnWrite extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("menu", "manage");
		req.setAttribute("tab", "a");
		req.getRequestDispatcher("/WEB-INF/k/manage/manageAnnWrite.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");		
		String btn = req.getParameter("pwReset");
		System.out.println(btn);
		String ck = "";
		if (btn.equals("Y")) {
			pw = "12345";
			ck = "BY";
		}
		
		String name = req.getParameter("name");
		String nickName = req.getParameter("nickName");
		
		String gender = req.getParameter("gender");
		String grade = req.getParameter("grade");
		String addr = req.getParameter("addr");
		String detailAddr = req.getParameter("detailAddr");
		
		
		User user = User.builder().id(id).pw(pw).nickName(nickName).build();
		UserDetail userDetail = UserDetail.builder().id(id).name(name).gender(gender).addr(addr).detailAddr(detailAddr).grade(grade).build();
		
		ManageUserDto dto = new ManageUserDto(user,userDetail);
		int i = new ManageServiceImpl().userModify(dto);
		
		if(ck!="BY" && i == 1) ck = "Y";
		if(ck!="BY" && i == 0) ck = "N";
		
		req.getSession().setAttribute("ck", ck);    // 세션에 상태 저장
	    req.getSession().setMaxInactiveInterval(3); // 3초
	    
    	resp.sendRedirect(req.getContextPath() + "/manage/userDetail?id=" + id);
		
		System.out.println(dto);
		
	}
	
	
}
