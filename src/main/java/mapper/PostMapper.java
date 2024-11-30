package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import dto.Criteria;
import vo.Post;
import vo.Postlike;

public interface PostMapper {
	List<Post> selectList(Criteria cri);
	
	Post selectOne(int pno);
	
	@Select("select now()")
	String now();
	
	List<Post> lastList();

	List<Post> lastList2();
	
	int write(Post post);
	
	int insert(Post post);
	
	int getCount(Criteria cri);
	
	int update(Post post);
	
	int increaseViewCount(int pno);
	
	int delete(int pno);

	int updateLike(Post post);

	Postlike selectLikeOne(@Param("pno") int pno, @Param("userId") String userId);

	boolean findByLikes(Post post);

	int deleteLike(Post post);
}
