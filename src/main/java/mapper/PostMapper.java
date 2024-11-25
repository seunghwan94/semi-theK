package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import vo.Post;

public interface PostMapper {
	List<Post> selectList(int cno);
	
	Post selectOne(int pno);
	
	@Select("select now()")
	String now();
	
	int write(Post post);
	
	int insert(Post post);
	
//	int getCount(C);
	
	int update(Post post);
	
	int increaseViewCount(Long pno);
	
	int delete(Long pno);
}
