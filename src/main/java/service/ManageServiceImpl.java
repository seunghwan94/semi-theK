package service;

import java.util.List;
import java.util.stream.Collectors;

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
			return users.stream().map(user-> new ManageUserDto(user, mapper.selectAllUserDetail(user.getId()))).collect(Collectors.toList());
		}
	}
	
	@Override
	public ManageUserDto findByUser(String id) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			User user = mapper.selectByUser(id);
			return new ManageUserDto(user,mapper.selectAllUserDetail(user.getId()));
		}
	}
	
	
	@Override
	public int userModify(ManageUserDto mdto) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			int i = mapper.updateByUserDetail(mdto);
			int j = mapper.updateByUser(mdto);
			return (i != 1 || j !=1) ? 0 : 1;
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
//		Taboo t = Taboo.builder().keyWord("뭐").build(); 
		ManageUserDto i = new ManageServiceImpl().findByUser("1@aaaaa");
		System.out.println(i);
//		Criteria criteria = Criteria.builder().page(1).amount(10).category(1).build();
//		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
//			ManageMapper mapper = session.getMapper(ManageMapper.class);
//			List<User> users = mapper.selectAllUser(criteria);
//			users.forEach(System.out::println);
//			List<?> list = users.stream().map(user-> new ManageUserDto(user, mapper.selectAllUserDetail(user.getId()))).collect(Collectors.toList());
//			list.forEach(System.out::println);
//		}
//		System.out.println(criteria); 
//		System.out.println(criteria.getOffset()); 
		
		
//		System.out.println(Criteria.builder().page(1).amount(10).category(1).build());
//		new ManageServiceImpl().listUser(Criteria.builder().build()).forEach(System.out::println);
	}






}

