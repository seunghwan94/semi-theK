package servlet.mypage;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MngUserDto;
import service.UserService;
import service.UserServiceImpl;
import service.manage.MngUserService;
import service.manage.MngUserServiceImpl;
import vo.User;
import vo.UserDetail;

@WebServlet("/mypage")
public class MyPage extends HttpServlet {
		private MngUserService service = new MngUserServiceImpl();
		private UserService userService = new UserServiceImpl();
		
	
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String id = req.getParameter("id");
			MngUserDto userDto = service.findByUser(id);
			req.setAttribute("userInfo", userDto);
			
			
			req.getRequestDispatcher("/WEB-INF/k/mypage/pagemain.jsp").forward(req, resp);
			
		}
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			req.setCharacterEncoding("utf-8");
			String myNickName = req.getParameter("myNickName");
			String myEmail = req.getParameter("myEmail");
			String myGender = req.getParameter("myGender");
			String myIntro = req.getParameter("myIntro");
			String myName = req.getParameter("myName");
			String myAddr = req.getParameter("myAddr");
			String myDetailAddr = req.getParameter("myDetailAddr");
			String myGrade = req.getParameter("myGrade");
			
			
			UserDetail userDetail = UserDetail.builder()
				.id(myEmail)
				.name(myName)
				.gender(myGender)
				.addr(myAddr)
				.detailAddr(myDetailAddr)
				.selfIntro(myIntro)
				.grade(myGrade)
				.build();
			
			User user = User.builder()
					.id(myEmail)
					.nickName(myNickName)
					.build();
			MngUserDto dtoUserDto= new MngUserDto(user, userDetail);

		
			userService.modifyMyPage(userDetail);
			userService.modify(user);
			req.getRequestDispatcher("/WEB-INF/k/mypage/pagemain.jsp").forward(req, resp);
			
		}

}
