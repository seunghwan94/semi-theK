package listener;

import java.util.List;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import service.CategorySerivceImpl;
import vo.Category;

@WebListener()
public class ContextPathListener implements ServletContextListener {
	
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
	
		List<Category> mainCategories =  new CategorySerivceImpl().listMain();
		List<Category> subCategories =  new CategorySerivceImpl().listSub();
		sce.getServletContext().setAttribute("mainC", mainCategories);	
		sce.getServletContext().setAttribute("subC", subCategories);	
		sce.getServletContext().setAttribute("cp", sce.getServletContext().getContextPath()+"/");
	}
	
}