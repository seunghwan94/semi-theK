package service;

import java.util.List;
import vo.Post;

public interface PostService {
	List<Post> listPost(int cno);
	List<Post> lastPost();
	Post view(int pno);
}
