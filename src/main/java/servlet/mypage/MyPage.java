package servlet.mypage;

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
			
			User user =getJson(req, User.class);
			UserDetail userDetail = getJson(req, UserDetail.class);

			
			System.out.println(userDetail);

			System.out.println(user);	
			
			MngUserDto dtoUserDto= new MngUserDto(user, userDetail);
			System.out.println(dtoUserDto);
			boolean userList=service.modifyUser(dtoUserDto);
			
			if(userList) {
				System.out.println("11111");
			}
			else {
				System.out.println("00000");
			}
//			req.getSession().setAttribute(myEmail, userList);	
			resp.sendRedirect(req.getContextPath() + "/k/mypage?id=" + dtoUserDto.getId());
			
		}

		

		
		public static void sendJson(HttpServletResponse resp, String status,Object... items) throws IOException {
			Map<String, Object> responseMap = new HashMap<>();
	        responseMap.put("status", status);
	        
	        for (Object item : items) {
	            responseMap.put(item+"", item);
	        }
	        
	        resp.setContentType("application/json; charset=utf-8");
	        resp.getWriter().print(GSON.toJson(responseMap));
		}
		
		public static <T> T getJson(HttpServletRequest req, Class<T> clazz) throws IOException {
			return GSON.fromJson(req.getReader(), clazz);
		}
}
