package mapper;

import java.util.List;

import vo.Category;
import vo.Taboo;
import vo.User;

public interface ManageMapper {
	List<User> selectAllUser();
	List<Taboo> selectAllTaboo();
	List<Category> selectAllMenu();
}
