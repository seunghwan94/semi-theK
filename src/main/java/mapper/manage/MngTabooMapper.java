package mapper.manage;

import java.util.List;

import dto.Criteria;
import dto.MngUserDto;
import vo.Category;
import vo.Post;
import vo.Taboo;
import vo.User;
import vo.UserDetail;

public interface MngTabooMapper {

	List<Taboo> select();
	int insert(String keyWord);
	boolean delete(String string);
	boolean update(Taboo taboo);

	int getCount(Criteria cri);
	
	
	
}
