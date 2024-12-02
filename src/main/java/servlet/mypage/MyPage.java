package servlet.mypage;

import java.io.BufferedReader;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.MngUserDto;
import jakarta.mail.Session;
import service.UserService;
import service.UserServiceImpl;
import service.common.ServiceCommon;
import service.manage.MngUserService;
import service.manage.MngUserServiceImpl;
import vo.User;
import vo.UserDetail;

@WebServlet("/mypage")
public class MyPage extends HttpServlet {
		private MngUserService service = new MngUserServiceImpl();
		private UserService userService = new UserServiceImpl();
		private static final Gson GSON = new Gson();
	
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String id = req.getParameter("id");
			MngUserDto userDto = service.findByUser(id);
			req.setAttribute("userInfo", userDto);
			
			
			req.getRequestDispatcher("/WEB-INF/k/mypage/pagemain.jsp").forward(req, resp);
			
		}
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			
			User user = ServiceCommon.getJson(req, User.class);
			System.out.println(user);	
			
			int userList=userService.modifyUser(user);
			
			if(userList == 1) {
				System.out.println("11111");
				ServiceCommon.sendJson(resp, "success");
			}
			else {
				System.out.println("00000");
				ServiceCommon.sendJson(resp, "fail");
			}
//			req.getSession().setAttribute(myEmail, userList);	
//			resp.sendRedirect(req.getContextPath() + "/k/mypage?id=" + dtoUserDto.getId());
			
		}

		@Override
		protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			

			UserDetail userDetail = ServiceCommon.getJson(req, UserDetail.class);
			System.out.println(userDetail);

			

			
			int userList=userService.modifyMyPage(userDetail);
			
			if(userList == 1) {
				System.out.println("11111");
				ServiceCommon.sendJson(resp, "success");
			}
			else {
				System.out.println("00000");
				ServiceCommon.sendJson(resp, "fail");
			}

			
		}
		
}
