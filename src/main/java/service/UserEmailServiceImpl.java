package service;

import java.util.List;
import java.util.Map;

import org.apache.catalina.mapper.Mapper;
import org.apache.ibatis.session.SqlSession;

import mapper.EmailMapper;
import utils.MybatisInit;
import vo.UserEmail;

public class UserEmailServiceImpl implements UserEmailService   {

	@Override
	public Map<String, List<UserEmail>> list(String email, int att) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String email(String email) {
		return null;
	}

	@Override
	public int save(int att) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

}
