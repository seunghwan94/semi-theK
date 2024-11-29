package mapper.manage;

import java.util.List;

import dto.Criteria;
import vo.Post;

public interface MngNtcMapper {

	List<Post> select(Criteria cri);
	Post selectByOne(String pno);
	int insert(Post post);
	int delete(int pno);
	int update(Post post);
	
	
	int getCount(Criteria cri);
	
	
	
	
}
