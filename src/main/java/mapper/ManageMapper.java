package mapper;

import java.util.List;

import vo.Category;
import vo.Taboo;
import vo.User;

public interface ManageMapper {
	List<User> selectAllUser();
	List<Taboo> selectAllTaboo();
	List<Category> selectAllMenu();
	int insert(String cname);
	int update(String cname, int parentCno, int sort, String isuse);
}
