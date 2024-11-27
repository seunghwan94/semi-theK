package service;

import java.util.List;
import java.util.Map;

import org.apache.catalina.mapper.Mapper;
import org.apache.ibatis.session.SqlSession;

import mapper.EmailMapper;
import mapper.ManageMapper;
import utils.MybatisInit;
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
	
	public static void main(String[] args) {
		 UserEmail userEmail = new UserEmail().builder().email("tkddnjs8097@gmail.com").att(Integer.parseInt("9978")).build();
		 UserEmail i = new UserEmailServiceImpl().ct(userEmail);//
		    System.out.println(i);
	}
	

}
