package mapper;

import java.util.List;

import vo.Category;
import vo.Taboo;
import vo.User;

public interface ManageMapper {
	List<User> selectAllUser();
	
	List<Category> selectAllMenu();
	int insert(Category category);
	int update(Category categroy);
	int delete(int cno);
	
	List<Taboo> selectAllTaboo();
	int insertTaboo(String keyWord);
	int deleteTaboo(String string);
	int updateTaboo(Taboo taboo);
}
