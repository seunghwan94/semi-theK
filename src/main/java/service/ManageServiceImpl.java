package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.Criteria;
import dto.ManageUserDto;
import mapper.ManageMapper;
import utils.MybatisInit;
import vo.Category;
import vo.Post;
import vo.Taboo;
import vo.User;
import vo.UserDetail;

public class ManageServiceImpl implements ManageService{

	@Override
	public List<ManageUserDto> listUser(Criteria cri) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			List<User> users = mapper.selectAllUser(cri);
			users.stream().map(user-> new ManageUserDto(user, mapper.selectAllUserDetail(user.getId())));
		}
		return null;
	}
	
	@Override
	public UserDetail findByUserDetail(String id) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			return mapper.selectAllUserDetail(id);
		}
	}
	
	
	
	
	
//	paging
	@Override
	public int count(Criteria cri) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			return mapper.getCount(cri);
		}
	}
	
	
	@Override
	public List<Taboo> listTaboo() {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			return mapper.selectAllTaboo();
		}
	}

	@Override
	public List<Category> listMenu() {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			return mapper.selectAllMenu();
		}
	}

	@Override
	public int addMenu(String cname) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			Category c = Category.builder().cname(cname).build();
			mapper.insert(c);
			return c.getCno();
		}
	}


	
	@Override
	public int addTaboo(String keyWord) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			return mapper.insertTaboo(keyWord);
		}
	}


	@Override
	public int modifyMenu(Category categroy) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			return mapper.update(categroy);
		}
	}
	
	@Override
	public int deleteMenu(int cno) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			return mapper.delete(cno);
		}
	}

	
	@Override	
	public int modifyTaboo(Taboo taboo) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			return mapper.updateTaboo(taboo);
		}
	}

	@Override
	public int removeTaboo(Taboo t) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			return mapper.deleteTaboo(t.getKeyWord());
		}
	}

	public List<Post> listAnn() {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			return mapper.selectAllAnnPost();
		}
	}

	public static void main(String[] args) {
		Taboo t = Taboo.builder().keyWord("뭐").build(); 
		int i = new ManageServiceImpl().removeTaboo(t);
		System.out.println(i);
	}






}

