package mapper;

import java.util.List;

import dto.Criteria;
import dto.ManageUserDto;
import vo.Category;
import vo.Post;
import vo.Taboo;
import vo.User;
import vo.UserDetail;

public interface ManageMapper {
	List<User> selectAllUser(Criteria cri);
	UserDetail selectAllUserDetail(String id);
	User selectByUser(String id);
	int updateByUserDetail(ManageUserDto mdto);
	int updateByUser(ManageUserDto mdto);
	
	List<Category> selectAllMenu();
	int insert(Category category);
	int update(Category categroy);
	int delete(int cno);
	
	List<Taboo> selectAllTaboo();
	int insertTaboo(String keyWord);
	int deleteTaboo(String string);
	int updateTaboo(Taboo taboo);


	List<Post> selectAllAnnPost(Criteria cri);
	int insertAnnPost(Post post);
	
	
	int getCount(Criteria cri);
	
	
	
}
