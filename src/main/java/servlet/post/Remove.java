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
        System.out.println("11111111");
        User user = (vo.User)req.getSession().getAttribute("user");
//        Object userObj = req.getSession().getAttribute("user");
        System.out.println(pnoStr);
        Criteria criteria = new Criteria(req);
        System.out.println("222222222");
        String redirectURL = "list/view?pno="+pnoStr; 

//        if (userObj == null || pnoStr == null) {
//        	Commons.printMsg("SYSTEM :: ERR / INVALID APPROACH", redirectURL, resp);
//            return;
//        }
        System.out.println("33333333");
        Integer pno = Integer.valueOf(pnoStr);
//        User user = (User) userObj;
        
        if (!user.getId().equals(postService.findBy(pno).getUserId())) {
        	System.out.println("4444444");
            Commons.printMsg("SYSTEM :: ERR / POST CAN BE ONLY REMOVED BY WRITER OF ITS OWN", redirectURL, resp);
            return;
        }

        Integer cnoString = postService.findBy(pno).getCno(); //게시글의 카테고리 번호 가져오기. 왜냐하면 리스트로 보내서 게시판 종류 리스트를 출력해야함

//        try {
            postService.remove(pno);
            System.out.println("SYSTEM :: Post Removed Successfully, PNO: " + pno);
//        } catch (Exception e) {
//            Commons.printMsg("SYSTEM :: ERR / FAILED TO REMOVE POST", redirectURL, resp);
//            e.printStackTrace();
//            return;
//        }
            
//        String cnoString = req.getParameter("cno");	
        System.out.println("testtest");
        if(cnoString != null) { // 가져온 카테고리 넘버가 널이 아닐때 시행하도록,,했는데 굳이굳이같긴해요
        	System.out.println("xxxxx");
        	resp.sendRedirect("/K/list/view?cno=" + cnoString); // 이때 이제 시행되는 거로 보면 되거등요
        }else {
        	System.out.println("zzzzzzz");
        	resp.sendRedirect("/list/view?page=1&amount=10&cno="+cnoString); // 이때 시행 안되었을때
        }
    }
}
