package service.manage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.Criteria;
import mapper.manage.MngNtcMapper;
import utils.MybatisInit;
import vo.Post;

public class MngNtcServiceImpl implements MngNtcService{


	// 공지사항
	@Override
	public List<Post> ntcList(Criteria cri) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngNtcMapper mapper = session.getMapper(MngNtcMapper.class);
			return mapper.select(cri);
		}
	}
	
	@Override
	public Post findByNtc(String pno) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngNtcMapper mapper = session.getMapper(MngNtcMapper.class);
			return mapper.selectByOne(pno);
		}
	}
	
	@Override
	public boolean addNtc(Post post) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngNtcMapper mapper = session.getMapper(MngNtcMapper.class);
			return mapper.insert(post) == 1 ? true : false;
		}
	}
	
	@Override
	public boolean removeNtc(int pno) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngNtcMapper mapper = session.getMapper(MngNtcMapper.class);
			return mapper.delete(pno) == 1 ? true : false;
		}
	}	
	
	@Override
	public boolean modifyNtc(Post post) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngNtcMapper mapper = session.getMapper(MngNtcMapper.class);
			return mapper.update(post) == 1 ? true : false;
		}
	}

	
//	paging
	@Override
	public int count(Criteria cri) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngNtcMapper mapper = session.getMapper(MngNtcMapper.class);
			return mapper.getCount(cri);
		}
	}
	
	
	
	

}

