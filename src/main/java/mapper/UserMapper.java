package mapper;


import vo.User;
import vo.UserDetail;
import vo.UserLog;

public interface UserMapper {
	int insert(User user);
	
	User selectOne(String user);
	
	int insertDetail(UserDetail userDetail);
	
	int update(User pw);

	User findByNickName(User nickName);

	int insertUserLog(UserLog userLog);

	int updateUser(User user);

	int updateDetail(UserDetail userDetail);


}
