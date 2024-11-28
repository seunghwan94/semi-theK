package servlet.user;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.angus.mail.imap.protocol.ID;

import service.UserService;
import service.UserServiceImpl;
import vo.User;

@WebServlet("/modifyid")
public class ModifyId extends HttpServlet{
	private UserService service = new UserServiceImpl();



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("modifyemail");
		String pw = req.getParameter("pwd");
		System.out.println("비밀번호 변경 들어왔나?");
		System.out.println(pw);
		System.out.println(id);
		
		User user = User.builder()
			.id(id).pw(pw).build();
		System.out.println(user);
		String redirectURL = req.getContextPath() + "/intro";
		String url = req.getParameter("url");
		if (url != null && !url.equals("")) {
			redirectURL = URLDecoder.decode(url, "utf-8");
		}
		service.modify(user);
		resp.sendRedirect(redirectURL);
		
	}
	
}
