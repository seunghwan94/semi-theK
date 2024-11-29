package service.manage;

import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;

import dto.Criteria;
import dto.MngUserDto;
import mapper.manage.MngUserMapper;
import utils.MybatisInit;

import vo.User;

public class MngUserServiceImpl implements MngUserService{

	// User	
	@Override
	public List<MngUserDto> userList(Criteria cri) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngUserMapper mapper = session.getMapper(MngUserMapper.class);
			List<User> users = mapper.selectAll(cri);
			return users.stream().map(user-> new MngUserDto(user, mapper.selectByUserDetail(user.getId()))).collect(Collectors.toList());
		}
	}
	
	@Override
	public MngUserDto findByUser(String id) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngUserMapper mapper = session.getMapper(MngUserMapper.class);
			User user = mapper.selectByUser(id);
			return new MngUserDto(user,mapper.selectByUserDetail(user.getId()));
		}
	}
	
	@Override
	public boolean modifyUser(MngUserDto mdto) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngUserMapper mapper = session.getMapper(MngUserMapper.class);
			return (mapper.updateByUser(mdto) == 1 && mapper.updateByUserDetail(mdto) ==1) ? true : false;
		}
	}
	
	//	paging
	@Override
	public int count(Criteria cri) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngUserMapper mapper = session.getMapper(MngUserMapper.class);
			return mapper.getCount(cri);
		}
	}

}

