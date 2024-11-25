package service;

import java.util.List;
import vo.Category;

public interface CategoryService {
	List<Category> listMain();
	List<Category> listSub();
}
