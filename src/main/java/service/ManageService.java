package service;

import java.util.List;

import vo.Category;
import vo.Taboo;
import vo.User;
import vo.UserDetail;

public interface ManageService {
	List<User> listUser();
	
	List<Category> listMenu();
	int addMenu(String cname);
	int modifyMenu(Category categroy);
	int deleteMenu(int cno);
	
	List<Taboo> listTaboo();
	int addTaboo(String keyWord);
	int removeTaboo(Taboo t);

	int modifyTaboo(Taboo taboo);

	List<UserDetail> listUserDetail();

	
}
