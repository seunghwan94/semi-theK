package servlet.manage.mng;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.ManageService;
import service.ManageServiceImpl;
import service.common.ServiceCommon;
import vo.Taboo;

@SuppressWarnings("serial")
@WebServlet("/manage/taboo")
public class MngTaboo extends HttpServlet {
	private ManageService service = new ManageServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Taboo> tabooArr =  service.tabooList();
		
		req.setAttribute("menu", "manage");
		req.setAttribute("tab", "t");
		req.setAttribute("tabooArr", tabooArr);
		
		req.getRequestDispatcher("/WEB-INF/k/manage/manageTaboo.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Taboo taboo = ServiceCommon.getJson(req, Taboo.class);
        try {
        	if (service.addTaboo(taboo.getKeyWord())) {
        		ServiceCommon.sendJson(resp, "success");
        		return;
    		}
        	ServiceCommon.sendJson(resp, "fail");     	
            
        }catch(Exception e) {
        	ServiceCommon.sendJson(resp, "error");
        }
		
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		@SuppressWarnings("unchecked")
		List<Object> list = ServiceCommon.getJson(req, List.class);
	    
		boolean removeCk = true;
	    for(Object s : list) {
	    	@SuppressWarnings("unchecked")
			Map<String, String> map = (Map<String, String>) s;
	    	Taboo t = Taboo.builder().keyWord(map.get("keyWord")).build();
			if (!service.removeTaboo(t)) {
				removeCk = false;
				break;
			}
		}
	    
		if (removeCk) {
			ServiceCommon.sendJson(resp, "success");
		}else {
			ServiceCommon.sendJson(resp, "fail"); 	
		}
		
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		@SuppressWarnings("unchecked")
		List<Object> list = ServiceCommon.getJson(req, List.class);
		
		boolean modiCk = true;
		for (Object obj : list) {
		    @SuppressWarnings("unchecked")
			Map<String, Object> map = (Map<String, Object>) obj;
		    Taboo t = Taboo.builder().keyWord((String) map.get("keyWord")).isUse(((Number) map.get("isUse")).intValue()).build();

		    if (!service.modifyTaboo(t)) {
		        modiCk = false;
		        break;
		    }
		}
		
		if (modiCk) {
			ServiceCommon.sendJson(resp, "success");
		} else {
			ServiceCommon.sendJson(resp, "fail");
		}
	}
	
	
	
	
	
}
