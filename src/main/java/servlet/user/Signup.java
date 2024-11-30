package servlet.user;

import java.io.IOException;
import java.net.URLDecoder;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import at.favre.lib.crypto.bcrypt.BCrypt;
import service.UserService;
import service.UserServiceImpl;
import vo.User;
import vo.UserDetail;

@WebServlet("/signup")
public class Signup extends HttpServlet{
	private UserService service = new UserServiceImpl();

//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.getRequestDispatcher("/WEB-INF/k/user/intro.jsp").forward(req, resp);
//		System.out.println("회원가입 버튼 눌렀을때");
//	}
//	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.setCharacterEncoding("utf-8");//한글 깨짐 방지
		String id = req.getParameter("useremail");
		String pw = req.getParameter("pwd");
//		String att = req.getParameter("att");
		String passWord = BCrypt.withDefaults().hashToString(8, pw.toCharArray());
		String nickname = req.getParameter("nickname");
		System.out.println("222222");
		System.out.println(id);
	
		User user = User.builder()
			
				.id(id)
				.pw(passWord)
				.nickName(nickname)
				.build();
		
		UserDetail userDetail = UserDetail.builder()
		.id(id).build();
				
		System.out.println(user);
		String redirectURL = req.getContextPath() + "/intro";
		String url = req.getParameter("url");
		if (url != null && !url.equals("")) {
			redirectURL = URLDecoder.decode(url, "utf-8");
		}
		if(!id.equals("") && !passWord.equals("") && !nickname.equals("")) {
			service.register(user);
			service.register(userDetail);
			
	
		}else{			
		
			
		}
		resp.sendRedirect(redirectURL);
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Gson gson = new Gson();
		String nickname = req.getParameter("nickName");
		System.out.println(nickname);
		
		User usernick = new User().builder().nickName(nickname).build();
		User nick= service.findByNick(usernick);
		resp.setContentType("application/json; charset=utf-8");
		
		if(nick == null) {
			resp.getWriter().print(gson.toJson("success"));
			System.out.println("없는 닉네임");
		}else {
			resp.getWriter().print(gson.toJson("fail"));
			System.out.println("있는 닉네임");
		}
		
	}	
	
}
