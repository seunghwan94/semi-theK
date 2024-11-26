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
import service.UserEmailServiceImpl;
import utils.Mailsender;
import vo.UserEmail;

@WebServlet("/useremail")
public class EmailController extends HttpServlet {

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("뭘까");
		Gson gson = new Gson();
		Map< String, String> map =gson.fromJson(req.getReader(), Map.class);//2번째는 타입 어떻게 받을거냐 
		System.out.println(map);
		// 누구에게 보낼것인가
		String receiver = map.get("emailcheck");//emailcheck 객체를 signup에서 가져온다
		// 메일 발송
		Session session = new Mailsender().init();
	    String rndText = String.format("%05d", (int)(Math.random() * 100000));
	    System.out.println(rndText);
	    Mailsender.send(session, "The-k 인증번호", "<h1>인증번호</h1>" + rndText, receiver);
	    UserEmail userEmail = new UserEmail().builder().email(receiver).att(Integer.parseInt(rndText)).build();
//	    int i = new UserEmailServiceImpl().addAtt(userEmail);

	    // 되돌려줘야해
	    Map<String, String> ret = new HashMap<>();
	    ret.put("text", rndText);
	    
	   
	    resp.setContentType("application/json; charset=utf-8");
	    resp.getWriter().print(gson.toJson(ret));
	           
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		uri= uri.replace(req.getContextPath() + "/useremail","");
		System.out.println("uri");
	}

	
	

}
