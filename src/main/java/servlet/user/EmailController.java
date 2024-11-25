package servlet.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import jakarta.mail.Session;
import utils.Mailsender;
import vo.UserEmail;

@WebServlet("/usermail")
public class EmailController extends HttpServlet {

	UserEmail email = new UserEmail();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 누구에게 보낼것인가
		String receiver = "1@aaaaa";
		
		// 메일 발송
		Session session = new Mailsender().init();
	    String rndText = String.format("%08d", (int)(Math.random() * 100000000));
	    System.out.println(rndText);
	    Mailsender.send(session, "The-k 인증번호", "<h1>인증번호</h1>" + rndText, receiver);

	    // 되돌려줘야해.
	    Map<String, String> ret = new HashMap<>();
	    ret.put("text", rndText);
	    Gson gson = new Gson();
	    
	    resp.setContentType("application/json; charset=utf-8");
	    resp.getWriter().print(gson.toJson(ret));
	       
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

	
	
	

}
