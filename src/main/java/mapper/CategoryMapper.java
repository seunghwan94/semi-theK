package mapper;

import java.util.List;
import vo.Category;

public interface CategoryMapper {
	List<Category> selectMain();
	List<Category> selectSub();
}
