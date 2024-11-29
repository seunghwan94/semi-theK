package service.manage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.Criteria;
import mapper.manage.MngTabooMapper;
import utils.MybatisInit;
import vo.Taboo;

public class MngTabooServiceImpl implements MngTabooService{


	// Taboo
	@Override
	public List<Taboo> tabooList(Criteria cri) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngTabooMapper mapper = session.getMapper(MngTabooMapper.class);
			return mapper.select(cri);
		}
	}

	@Override
	public boolean addTaboo(String keyWord) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngTabooMapper mapper = session.getMapper(MngTabooMapper.class);
			return mapper.insert(keyWord) == 1 ? true : false;
		}
	}
	
	@Override	
	public boolean modifyTaboo(Taboo taboo) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngTabooMapper mapper = session.getMapper(MngTabooMapper.class);
			return mapper.update(taboo) == 1 ? true : false;
		}
	}

	@Override
	public boolean removeTaboo(Taboo t) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngTabooMapper mapper = session.getMapper(MngTabooMapper.class);
			return mapper.delete(t.getKeyWord()) == 1 ? true : false;
		}
	}
	
	
//	paging
	@Override
	public int count(Criteria cri) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngTabooMapper mapper = session.getMapper(MngTabooMapper.class);
			return mapper.getCount(cri);
		}
	}
	
	

}

