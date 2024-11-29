package mapper.manage;

import java.util.List;

import dto.Criteria;
import dto.MngUserDto;
import vo.User;
import vo.UserDetail;

public interface MngUserMapper {
	List<User> selectAll(Criteria cri);
	UserDetail selectByUserDetail(String id);
	
	User selectByUser(String id);
	int updateByUser(MngUserDto mdto);
	int updateByUserDetail(MngUserDto mdto);
	
	int getCount(Criteria cri);
	
}
