package servlet.manage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.internal.LinkedTreeMap;

import service.ManageServiceImpl;
import vo.Category;

@SuppressWarnings("serial")
@WebServlet("/manage/menu")
public class ManageMenu extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Category> categories =  new ManageServiceImpl().listMenu();
		
		req.setAttribute("menu", "manage");
		req.setAttribute("tab", "m");
		req.setAttribute("menuCategory", categories);
		
		req.getRequestDispatcher("/WEB-INF/k/manage/manageMenu.jsp").forward(req, resp);
	}



	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Gson gson = new Gson();
		Category category = gson.fromJson(req.getReader(), Category.class);
        resp.setContentType("application/json; charset=utf-8");
        

        try {

        	int i = new ManageServiceImpl().addMenu(category.getCname());
        	
        	
        	resp.getWriter().print(gson.toJson(i));        	
            
        }catch(Exception e) {
        	resp.getWriter().print(gson.toJson("error"));  
        }
        
	}


	@SuppressWarnings("unchecked")
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Gson gson = new Gson();

		List<LinkedTreeMap<String, Object>> list = gson.fromJson(req.getReader(), List.class);
		
		boolean chk = true;
		for(LinkedTreeMap<String, Object> obj: list) {
			
			Category category = Category.builder()
					.sort((int)((double)(obj.get("sort"))))
					.cno((int)((double)(obj.get("cno"))))
					.cname(obj.get("cname").toString())
					.parentCno((int)((double)(obj.get("parentCno"))))
					.isUse(obj.get("isUse").toString())
					.build();
			
			int i = new ManageServiceImpl().modifyMenu(category);
			
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
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Gson gson = new Gson();
		Category category = gson.fromJson(req.getReader(), Category.class);
		
		try {
			int i = new ManageServiceImpl().deleteMenu(category.getCno());
			System.out.println(i);
        	if (i == 1) {
            	resp.getWriter().print(gson.toJson("success"));        	
            }else {
            	resp.getWriter().print(gson.toJson("fail"));        	
            }
        }catch(Exception e) {
        	resp.getWriter().print(gson.toJson("error"));  
        }
	
	}
	
	
}
