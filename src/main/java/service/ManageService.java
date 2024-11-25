package service;

import java.util.List;

import vo.Category;
import vo.Taboo;
import vo.User;

public interface ManageService {
	List<User> listUser();
	
	List<Taboo> listTaboo();
	
	List<Category> listMenu();
	
}
