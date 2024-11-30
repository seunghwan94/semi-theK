package servlet.post;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import service.PostService;
import service.PostServiceImpl;
import utils.Commons;
import vo.User;

@WebServlet("/list/remove")
public class Remove extends HttpServlet {
    private PostService postService = new PostServiceImpl();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pnoStr = req.getParameter("pno");
        Object userObj = req.getSession().getAttribute("user");
        Criteria criteria = new Criteria(req); 
        String redirectURL = criteria.getQs2(); 

        if (userObj == null || pnoStr == null) {
        	Commons.printMsg("SYSTEM :: ERR / INVALID APPROACH", redirectURL, resp);
            return;
        }

        Integer pno = Integer.valueOf(pnoStr);
        User user = (User) userObj;
        
        if (!user.getId().equals(postService.findBy(pno).getUserId())) {
            Commons.printMsg("SYSTEM :: ERR / POST CAN BE ONLY REMOVED BY WRITER OF ITS OWN", redirectURL, resp);
            return;
        }

        try {
            postService.remove(pno);
            System.out.println("SYSTEM :: Post Removed Successfully, PNO: " + pno);
        } catch (Exception e) {
            Commons.printMsg("SYSTEM :: ERR / FAILED TO REMOVE POST", redirectURL, resp);
            e.printStackTrace();
            return;
        }
        
        resp.sendRedirect(redirectURL);
    }
}
