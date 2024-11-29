package service.manage;

import java.util.List;

import dto.Criteria;
import vo.Post;

public interface MngNtcService {

	// Nct
	List<Post> ntcList(Criteria cri);
	boolean addNtc(Post post);
	Post findByNtc(String pno);
	boolean removeNtc(int pno);
	boolean modifyNtc(Post post);
	
	int count(Criteria cri);

	
}
