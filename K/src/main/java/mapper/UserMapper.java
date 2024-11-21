package mapper;

import vo.User;

public interface UserMapper {
	String insert(User user);
	User selectOne(User user);
	
}
