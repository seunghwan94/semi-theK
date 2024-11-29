package service;

import java.util.List;

import dto.Criteria;
import dto.MngUserDto;
import vo.Category;
import vo.Post;
import vo.Taboo;

public interface ManageService {
	// user
	List<MngUserDto> userList(Criteria cri);
	MngUserDto findByUser(String id);
	boolean modifyUser(MngUserDto mdto);
	
	// menu
	List<Category> menuList();
	int addMenu(String cname);
	boolean modifyMenu(Category categroy);
	boolean removeMenu(int cno);
	
	// Taboo
	List<Taboo> tabooList();
	boolean addTaboo(String keyWord);
	boolean removeTaboo(Taboo t);
	boolean modifyTaboo(Taboo taboo);

	List<Post> listAnn(Criteria cri);
	int addPostAnn(Post post);
	Post findByPostAnn(String pno);
	int removePostAnn(int pno);
	int modifyPostAnn(Post post);
	
	
	int count(Criteria cri);
	Object listQnA(Criteria cri);

	
}
