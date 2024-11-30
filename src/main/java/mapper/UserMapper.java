package mapper;


import vo.User;
import vo.UserDetail;

public interface UserMapper {
	int insert(User user);
	
	User selectOne(String user);
	
	int insertDetail(UserDetail userDetail);
	
	int update(User pw);

	User findByNickName(User nickName);


}
