package service.manage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;


import mapper.manage.MngMenuMapper;
import utils.MybatisInit;
import vo.Category;


public class MngMenuServiceImpl implements MngMenuService{
	
	// Menu
	@Override
	public List<Category> menuList() {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngMenuMapper mapper = session.getMapper(MngMenuMapper.class);
			return mapper.select();
		}
	}
	
	@Override
	public int addMenu(String cname) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngMenuMapper mapper = session.getMapper(MngMenuMapper.class);
			Category c = Category.builder().cname(cname).build();
			mapper.insert(c);
			return c.getCno();
		}
	}
	
	@Override
	public boolean modifyMenu(Category categroy) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngMenuMapper mapper = session.getMapper(MngMenuMapper.class);
			return mapper.update(categroy) == 1 ? true : false;
		}
	}
	
	@Override
	public boolean removeMenu(int cno) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngMenuMapper mapper = session.getMapper(MngMenuMapper.class);
			return mapper.delete(cno) == 1 ? true : false;
		}
	}

}

