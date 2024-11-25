package servlet.manage;

import java.io.IOException;
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
        	if (i == 1) {
            	resp.getWriter().print(gson.toJson("success"));        	
            }else {
            	resp.getWriter().print(gson.toJson("fail"));        	
            }
        }catch(Exception e) {
        	resp.getWriter().print(gson.toJson("error"));  
        }
        
	}


	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Gson gson = new Gson();
		List<Category> list = gson.fromJson(req.getReader(), List.class);
        
		System.out.println(list);
		
//        int i = new ManageServiceImpl().addMenu(category.getCname());
		/* resp.setContentType("application/json; charset=utf-8"); */
        

	}
	
	
}
