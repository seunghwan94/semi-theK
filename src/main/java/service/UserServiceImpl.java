package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mapper.UserMapper;
import utils.MybatisInit;
import vo.User;
import vo.UserDetail;

public class UserServiceImpl implements UserService {

	

	@Override
	public int register(User user) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			UserMapper mapper = session.getMapper(UserMapper.class);
				return mapper.insert(user);
		}
	}
	public int register(UserDetail userDetail) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			UserMapper mapper = session.getMapper(UserMapper.class);
				return mapper.insertDetail(userDetail);
		}
	}

	@Override
	public User findBy(String id) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			UserMapper mapper=session.getMapper(UserMapper.class);
				return mapper.selectOne(id);
	
		}
	}
	public User findByNick(User nickName) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			UserMapper mapper=session.getMapper(UserMapper.class);
				return mapper.findByNickName(nickName);
	
		}
	}
	
	@Override
	public boolean login(String id, String pw) {
		User u =findBy(id);
		return u != null && u.getPw().equals(pw);
	}

	@Override
	public List<User> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean remove(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int modify(User user) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			UserMapper mapper=session.getMapper(UserMapper.class);
				return mapper.update(user);
					
		}
	}


}
