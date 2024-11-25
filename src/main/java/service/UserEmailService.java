package service;

import java.util.List;
import java.util.Map;

import vo.UserEmail;

public interface UserEmailService {
	
	String email(String email);
	
	int save(int att);
	
	Map<String, List<UserEmail>> list(String email,int att);
}
