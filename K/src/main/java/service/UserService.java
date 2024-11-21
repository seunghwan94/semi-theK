package service;

import java.util.List;

import vo.User;

public interface UserService {

	//회원가입
	String register(User user);
	
	//조회
	User findBy(String id);
	
	//로그인
	boolean login(String id, String pw);
	
	//회원 목록
	List<User> list();
	
	//회원 탈퇴
	boolean remove(String id);
	
	//회원 정보 수정
	boolean modify(User user);
	
}
