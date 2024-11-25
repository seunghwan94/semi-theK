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


	public static void main(String[] args) {
		List<Category> t =  new ManageServiceImpl().listMenu();
		System.out.println(t);
	}
}
