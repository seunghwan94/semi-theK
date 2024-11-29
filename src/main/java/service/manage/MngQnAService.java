package service.manage;

import java.util.List;

import dto.Criteria;
import vo.Post;

public interface MngQnAService {
	// menu
	List<Post> QnAList(Criteria cri);
	boolean addQnA(Post post);
	Post findByQnA(String pno);
	boolean removeQnA(int pno);
	boolean modifyQnA(Post post);
	
	int count(Criteria cri);

	
}
