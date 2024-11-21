package service;

import org.apache.ibatis.session.SqlSession;

import mapper.UserMapper;
import utils.MybatisInit;
import vo.User;

public class TestServiceImpl implements TestService{

	@Override
	public User findBy(String id) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession()){
			UserMapper mapper=session.getMapper(UserMapper.class);
			return mapper.selectOne(id);
		}
	}
	
	public static void main(String[] args) {
		User t =  new UserServiceImpl().findBy("eee");
		System.out.println(t);

	}
}
