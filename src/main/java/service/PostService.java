package service;

import java.util.List;
import vo.Post;

public interface PostService {
	List<Post> listPost(int cno);
	List<Post> lastPost();
	Post view(int pno);
	int addPost(Post post);
	int update(Post post);
	Post findBy(int pno);
	int remove(int pno);
}
