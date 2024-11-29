package service.manage;

import java.util.List;

import vo.Category;

public interface MngMenuService {
	// menu
	List<Category> menuList();
	int addMenu(String cname);
	boolean modifyMenu(Category categroy);
	boolean removeMenu(int cno);

	
}
