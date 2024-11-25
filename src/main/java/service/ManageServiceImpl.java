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
			return mapper.insert(cname);
		}
	}

	

	@Override
	public int modifyMenu(String cname, int parentCno, int sort, String isuse) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			return mapper.update(cname, parentCno, sort, isuse);
		}
	}


	public static void main(String[] args) {
		int t =  new ManageServiceImpl().modifyMenu("sssss");
		System.out.println(t);
	}
}
