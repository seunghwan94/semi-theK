package servlet.manage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ManageServiceImpl;
import vo.Taboo;

@SuppressWarnings("serial")
@WebServlet("/manage/taboo")
public class ManageTaboo extends HttpServlet {
	List<Taboo> tabooArr =  new ManageServiceImpl().listTaboo();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("menu", "manage");
		req.setAttribute("tab", "t");
		req.setAttribute("tabooArr", tabooArr);
		req.getRequestDispatcher("/WEB-INF/k/manage/manageTaboo.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		값 가져와서 taboo 비교 후 값 저장하는 코드 만들것
		
		
		String[] keyWords = req.getParameterValues("keyWord");
		String[] userId = req.getParameterValues("userId");
		String[] isUse = req.getParameterValues("isUse");
		
		List<String> target = null;
		
		if (tabooArr == null || isUse == null) return;
		
		for (Taboo t : tabooArr) {
			System.out.println(t.getKeyWord());
			target.add(t.getKeyWord());
		}
		
		System.out.println(tabooArr);
		System.out.println(keyWords);
		System.out.println(userId);
		System.out.println(isUse);
		
		for (int i = 0; i<keyWords.length; i++) {
			if(!target.contains(keyWords[i])) {
				System.out.println("start");
				System.out.print("keyword : " + keyWords[i]);
				System.out.print("  userId : " + userId[i]);
				System.out.print("  isUse : " + isUse[i]);
				System.out.println("end");
			}
		}
		
		/*
		 * for(Taboo T : tabooArr) {
		 * 
		 * }
		 */
		
		
		
		//System.out.println(Arrays.toString(keyWords));

		
	}
	
	
	
}
