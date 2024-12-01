package service.manage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mapper.manage.HomeMapper;
import utils.MybatisInit;
import vo.Statistics;


public class HomeServiceImpl implements HomeService{
	
	@Override
	public List<Statistics> userTotal() {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			HomeMapper mapper = session.getMapper(HomeMapper.class);
			return mapper.selectByUserCnt();
		}
	}

	@Override
	public List<Statistics> userCreateTotal() {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			HomeMapper mapper = session.getMapper(HomeMapper.class);
			return mapper.selectByUserCreateCnt();
		}
	}
	
	@Override
	public List<Statistics> genderTotal() {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			HomeMapper mapper = session.getMapper(HomeMapper.class);
			return mapper.selectByGenderCnt();
		}
	}

	@Override
	public List<Statistics> nameTotal() {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			HomeMapper mapper = session.getMapper(HomeMapper.class);
			return mapper.selectByNameCnt();
		}
	}
	
	@Override
	public List<Statistics> gradeTotal() {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			HomeMapper mapper = session.getMapper(HomeMapper.class);
			return mapper.selectByGradeCnt();
		}
	}
	
	@Override
	public List<Statistics> postTotal() {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			HomeMapper mapper = session.getMapper(HomeMapper.class);
			return mapper.selectByPostCnt();
		}
	}
	
	@Override
	public List<Statistics> likeTotal() {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			HomeMapper mapper = session.getMapper(HomeMapper.class);
			return mapper.selectByPostLikeCnt();
		}
	}
	
	@Override
	public List<Statistics> postCnoTotal() {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			HomeMapper mapper = session.getMapper(HomeMapper.class);
			return mapper.selectByPostCnoCnt();
		}
	}
	
	public static void main(String[] args) {
		List<Statistics> list = new HomeServiceImpl().nameTotal();
		System.out.println(list);
		List<Statistics> list2 = new HomeServiceImpl().postTotal();
		System.out.println(list);
		System.out.println(list2);
	}
	

}

