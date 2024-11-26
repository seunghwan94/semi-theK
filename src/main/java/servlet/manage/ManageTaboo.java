package servlet.manage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.ManageServiceImpl;
import vo.Category;
import vo.Taboo;

@SuppressWarnings("serial")
@WebServlet("/manage/taboo")
public class ManageTaboo extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Taboo> tabooArr =  new ManageServiceImpl().listTaboo();
		req.setAttribute("menu", "manage");
		req.setAttribute("tab", "t");
		req.setAttribute("tabooArr", tabooArr);
		req.getRequestDispatcher("/WEB-INF/k/manage/manageTaboo.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Gson gson = new Gson();
		Taboo taboo = gson.fromJson(req.getReader(), Taboo.class);
        
        try {
        	int i = new ManageServiceImpl().addTaboo(taboo.getKeyWord());
        	
        	resp.setContentType("application/json; charset=utf-8");
        	System.out.println(i);
        	if (i==1) {
    			resp.getWriter().print(gson.toJson("success"));        	
    		}else {
    			resp.getWriter().print(gson.toJson("fail"));        	
    		}     	
            
        }catch(Exception e) {
        	resp.getWriter().print(gson.toJson("error"));  
        }
		
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Gson gson = new Gson();
		List<Object> list = gson.fromJson(req.getReader(), List.class);
	    boolean chk = true;
	    
	    for(Object s : list) {
	    	Map<String, String> map = (Map<String, String>) s;
	    	Taboo t = Taboo.builder().keyWord(map.get("keyWord")).build();
	    	int i = new ManageServiceImpl().removeTaboo(t);
			if (i != 1) {
				chk = false;
				break;
			}
		}
	    
		resp.setContentType("application/json; charset=utf-8");
		if (chk) {
			resp.getWriter().print(gson.toJson("success"));        	
		}else {
			resp.getWriter().print(gson.toJson("fail"));        	
		}
		
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Gson gson = new Gson();
		List<Object> list = gson.fromJson(req.getReader(), List.class);
	    boolean chk = true;
	    
	    for(Object s : list) {
	    	Map<String, String> map = (Map<String, String>) s;
	    	Taboo t = Taboo.builder().keyWord(map.get("keyWord")).build();
	    	int i = new ManageServiceImpl().modifyTaboo(t);
			if (i != 1) {
				chk = false;
				break;
			}
		}
	    
		resp.setContentType("application/json; charset=utf-8");
		if (chk) {
			resp.getWriter().print(gson.toJson("success"));        	
		}else {
			resp.getWriter().print(gson.toJson("fail"));        	
		}
	}
	
	
	
	
	
}
