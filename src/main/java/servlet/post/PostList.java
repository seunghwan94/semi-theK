package servlet.post;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import dto.PageDto;
import service.CategorySerivceImpl;
import service.CategoryService;
import service.PostService;
import service.PostServiceImpl;
import vo.Category;
import vo.User;

@WebServlet("/list")
public class PostList extends HttpServlet{
	private PostService service = new PostServiceImpl();
	private CategoryService categoryService = new CategorySerivceImpl();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int idx = req.getQueryString().indexOf('=');
		String cno = req.getQueryString().substring(idx+1);
		System.out.println(cno);
		Object userObj = req.getSession().getAttribute("user");
		Criteria cri = new Criteria(req);
		List<Category> subCategories = categoryService.listSub();
		List<Category> mainCategories = categoryService.listMain();
		Category promoCate = mainCategories.get(2);
		Category noticeCate = mainCategories.get(0);
		
		String tmpStr = promoCate.getCname();
		
		for(Category sc : subCategories) {
			if(Integer.parseInt(cno) == sc.getCno()) {
				tmpStr = sc.getCname();
				break;
			}
		}if(cno.equals(noticeCate.getCname())) {
			tmpStr = noticeCate.getCname();
		}
		req.setAttribute("categoryName", tmpStr);
		
		if((User)userObj == null) {
			req.getRequestDispatcher("/WEB-INF/k/user/intro.jsp").forward(req, resp);
	        return;
		}
		req.setAttribute("pageDto", new PageDto(cri, service.count(cri)));
		req.setAttribute("posts", service.listPost(cri));
		req.setAttribute("currentPage", "list");
		req.setAttribute("cno", cno);
		req.getRequestDispatcher("WEB-INF/k/post/list.jsp").forward(req, resp);
	}
}
