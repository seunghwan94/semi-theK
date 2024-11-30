package service;

import java.util.List;
import dto.Criteria;
import dto.PostDto;
import vo.Post;
import vo.Postlike;

public interface PostService {
	List<Post> listPost(Criteria cri);
	List<Post> lastPost();
	Post view(int pno);
	int addPost(Post post);
	int update(Post post);
	Post findBy(int pno);
	int remove(int pno);
	int count(Criteria cri);
	
	
	boolean likes(Post post);
	List<PostDto> postAndLike(Criteria cri, String userId);
	Postlike findByLikes(Post post, String userId);
}
