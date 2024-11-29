package service;

import org.apache.ibatis.session.SqlSession;

import mapper.EmailMapper;
import utils.MybatisInit;
import vo.User;
import vo.UserEmail;

public class UserEmailServiceImpl implements UserEmailService   {


	@Override
	public int addAtt(UserEmail userEmail) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			EmailMapper mapper = session.getMapper(EmailMapper.class);
			return mapper.insert(userEmail);
		}
	}
	@Override
	public UserEmail ct(UserEmail userEmail) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			EmailMapper mapper = session.getMapper(EmailMapper.class);
			return mapper.selectFindByEmail(userEmail);
		}
	}
	
	public User findby(String receiver) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			EmailMapper mapper = session.getMapper(EmailMapper.class);
			return mapper.selectFindBy(receiver);
		}
	}
	
}
