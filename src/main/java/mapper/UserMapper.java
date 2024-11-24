package mapper;


import vo.User;

public interface UserMapper {
	int insert(User user);
	User selectOne(String user);
	
}
