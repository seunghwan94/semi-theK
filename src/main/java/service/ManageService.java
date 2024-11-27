package service;

import java.util.List;

import dto.Criteria;
import dto.ManageUserDto;
import vo.Category;
import vo.Taboo;
import vo.User;
import vo.UserDetail;

public interface ManageService {
	List<ManageUserDto> listUser(Criteria cri);
	ManageUserDto findByUser(String id);
	
	List<Category> listMenu();
	int addMenu(String cname);
	int modifyMenu(Category categroy);
	int deleteMenu(int cno);
	
	List<Taboo> listTaboo();
	int addTaboo(String keyWord);
	int removeTaboo(Taboo t);
	int modifyTaboo(Taboo taboo);


	int count(Criteria cri);

	

	

	
}
