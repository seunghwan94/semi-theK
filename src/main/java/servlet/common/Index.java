package servlet.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import dto.PostDto;
import service.CategorySerivceImpl;
import service.CategoryService;
import service.PostService;
import service.PostServiceImpl;
import vo.User;

@SuppressWarnings("serial")
@WebServlet("/index")
public class Index extends HttpServlet {
	private PostService postService = new PostServiceImpl();
	private CategoryService categoryService = new CategorySerivceImpl();
//	private UserService userService = new UserServiceImpl();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria cri = new Criteria(req);
		cri.setCno(2); // 갤러리 카테고리
		cri.setAmount(8); // 보여지는 갯수 8개
		User user = (vo.User)req.getSession().getAttribute("user");
		if(user == null) {
			req.getRequestDispatcher("/WEB-INF/k/user/intro.jsp").forward(req, resp);
			return;
		}

		List<PostDto> postDtos = postService.postAndLike(cri,user.getId());
		
		req.setAttribute("subC", categoryService.listSub());
		req.setAttribute("posts", postService.lastPost());
		System.out.println(postDtos);
		req.setAttribute("postDtos",postDtos);
		
	    System.out.println("SYS :: User Info : " + user);
		System.out.println(user);
		req.getRequestDispatcher("/WEB-INF/k/main/index.jsp").forward(req, resp);
	}
}