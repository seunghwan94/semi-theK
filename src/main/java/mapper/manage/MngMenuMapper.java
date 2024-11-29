package mapper.manage;

import java.util.List;

import vo.Category;

public interface MngMenuMapper {
	List<Category> select();
	int insert(Category category);
	int update(Category categroy);
	int delete(int cno);
	
}
