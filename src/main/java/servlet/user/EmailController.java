package servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import jakarta.mail.Session;
import utils.Mailsender;
import vo.UserEmail;

@WebServlet("/usermail")
public class EmailController extends HttpServlet {

	private Mailsender mailsender = new Mailsender();
	UserEmail email = new UserEmail();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		  Session session = new Mailsender().init();
	        String rndText = String.format("%08d", (int)(Math.random() * 100000000));
	        System.out.println(rndText);
	       Mailsender.send(session, "The-k 인증번호", "<h1>인증번호</h1>" + rndText, "tkddnjs8097@gmail.com");
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
	}

	
	

}
