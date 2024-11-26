package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mapper.ManageMapper;
import utils.MybatisInit;
import vo.Category;
import vo.Taboo;
import vo.User;

public class ManageServiceImpl implements ManageService{

	@Override
	public List<User> listUser() {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			return mapper.selectAllUser();
		}
	}
	
	
	@Override
	public List<Taboo> listTaboo() {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			return mapper.selectAllTaboo();
		}
	}

	@Override
	public List<Category> listMenu() {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			return mapper.selectAllMenu();
		}
	}

	@Override
	public int addMenu(String cname) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			Category c = Category.builder().cname(cname).build();
			mapper.insert(c);
			return c.getCno();
		}
	}

	@Override
	public int modifyMenu(Category categroy) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			return mapper.update(categroy);
		}
	}
	
	@Override
	public int deleteMenu(int cno) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			return mapper.delete(cno);
		}
	}

//	public static void main(String[] args) {
//
//		int t = new ManageServiceImpl().addMenu("123456"); 
//		System.out.println(t);
//	}


}

