package servlet.manage.mng;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.internal.LinkedTreeMap;

import service.common.ServiceCommon;
import service.manage.MngMenuService;
import service.manage.MngMenuServiceImpl;
import vo.Category;

@SuppressWarnings("serial")
@WebServlet("/manage/menu")
public class MngMenu extends HttpServlet {
	private MngMenuService service = new MngMenuServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Category> categories =  service.menuList();
		
		req.setAttribute("menu", "manage");
		req.setAttribute("tab", "m");
		req.setAttribute("menuCategory", categories);
		
		req.getRequestDispatcher("/WEB-INF/k/manage/manageMenu.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Category c = ServiceCommon.getJson(req, Category.class);
        
        try {
        	int cno = service.addMenu(c.getCname());
        	ServiceCommon.sendJson(resp,"success",cno);
        }catch(Exception e) {
        	ServiceCommon.sendJson(resp,"error"); 
        }
	}
	
	@SuppressWarnings("unchecked")
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<LinkedTreeMap<String, Object>> list = ServiceCommon.getJson(req, List.class);
		
		boolean modiCk = true;
		for(LinkedTreeMap<String, Object> obj: list) {
			
			Category c = Category.builder()
						.sort((int)((double)(obj.get("sort"))))
						.cno((int)((double)(obj.get("cno"))))
						.cname(obj.get("cname").toString())
						.parentCno((int)((double)(obj.get("parentCno"))))
						.isUse(obj.get("isUse").toString())
						.build();
			
			modiCk = service.modifyMenu(c);
			if (!modiCk) break;
		}
		
		if (modiCk) ServiceCommon.sendJson(resp,"success");
		else ServiceCommon.sendJson(resp,"fail");        	

	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Category category = ServiceCommon.getJson(req, Category.class);
		
		try {
			boolean delCk = service.removeMenu(category.getCno());
        	if (delCk) {
        		ServiceCommon.sendJson(resp,"success");
        		return;
            }
        	ServiceCommon.sendJson(resp,"fail");        	
            
        }catch(Exception e) {
        	ServiceCommon.sendJson(resp,"error");  
        }
	
	}
	
	
	
	
	
}
