package mapper;

import java.util.List;

import dto.Criteria;
import vo.Category;
import vo.Post;
import vo.Taboo;
import vo.User;
import vo.UserDetail;

public interface ManageMapper {
	List<User> selectAllUser(Criteria cri);
	
	List<Category> selectAllMenu();
	int insert(Category category);
	int update(Category categroy);
	int delete(int cno);
	
	List<Taboo> selectAllTaboo();
	int insertTaboo(String keyWord);
	int deleteTaboo(String string);
	int updateTaboo(Taboo taboo);

	UserDetail selectAllUserDetail(String id);

	List<Post> selectAllAnnPost();

	int getCount(Criteria cri);
}
