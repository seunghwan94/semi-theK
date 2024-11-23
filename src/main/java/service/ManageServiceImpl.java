package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mapper.ManageMapper;
import utils.MybatisInit;
import vo.User;

public class ManageServiceImpl implements ManageService{

	@Override
	public List<User> list() {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			return mapper.selectAll();
		}
	}
	public static void main(String[] args) {
		List<User> t =  new ManageServiceImpl().list();
		System.out.println(t);
	}
}
