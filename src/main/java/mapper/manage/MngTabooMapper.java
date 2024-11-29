package mapper.manage;

import java.util.List;

import dto.Criteria;
import vo.Taboo;


public interface MngTabooMapper {

	List<Taboo> select(Criteria cri);
	int insert(String keyWord);
	int delete(String string);
	int update(Taboo taboo);

	int getCount(Criteria cri);
	
	
	
}
