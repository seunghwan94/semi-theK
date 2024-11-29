package service.manage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.Criteria;
import mapper.manage.MngQnAMapper;
import utils.MybatisInit;
import vo.Post;


public class MngQnAServiceImpl implements MngQnAService{
	
	@Override
	public List<Post> QnAList(Criteria cri) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngQnAMapper mapper = session.getMapper(MngQnAMapper.class);
			return mapper.select(cri);
		}
	}
	
	@Override
	public Post findByQnA(String pno) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngQnAMapper mapper = session.getMapper(MngQnAMapper.class);
			return mapper.selectByOne(pno);
		}
	}
	
	@Override
	public boolean addQnA(Post post) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngQnAMapper mapper = session.getMapper(MngQnAMapper.class);
			return mapper.insert(post) == 1 ? true : false;
		}
	}
	
	@Override
	public boolean removeQnA(int pno) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngQnAMapper mapper = session.getMapper(MngQnAMapper.class);
			return mapper.delete(pno) == 1 ? true : false;
		}
	}	
	
	@Override
	public boolean modifyQnA(Post post) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngQnAMapper mapper = session.getMapper(MngQnAMapper.class);
			return mapper.update(post) == 1 ? true : false;
		}
	}

	
//	paging
	@Override
	public int count(Criteria cri) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngQnAMapper mapper = session.getMapper(MngQnAMapper.class);
			return mapper.getCount(cri);
		}
	}
	

}

