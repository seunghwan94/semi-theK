package service;

import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;

import dto.Criteria;
import dto.MngUserDto;
import mapper.ManageMapper;
import mapper.manage.MngMenuMapper;
import mapper.manage.MngTabooMapper;
import mapper.manage.MngUserMapper;
import servlet.manage.mng.MngMenu;
import utils.MybatisInit;
import vo.Category;
import vo.Post;
import vo.Taboo;
import vo.User;
import vo.UserDetail;

public class ManageServiceImpl implements ManageService{

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
	
	
	// Taboo
	@Override
	public List<Taboo> tabooList() {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngTabooMapper mapper = session.getMapper(MngTabooMapper.class);
			return mapper.select();
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
			return mapper.update(taboo);
		}
	}

	@Override
	public boolean removeTaboo(Taboo t) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			MngTabooMapper mapper = session.getMapper(MngTabooMapper.class);
			return mapper.delete(t.getKeyWord());
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
	public Post findByPostAnn(String pno) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			return mapper.selectAnnPost(pno);
		}
	}
	
	
	@Override
	public List<Post> listAnn(Criteria cri) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			return mapper.selectAllAnnPost(cri);
		}
	}
	
	@Override
	public int addPostAnn(Post post) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			return mapper.insertAnnPost(post);
		}
	}
	
	@Override
	public int removePostAnn(int pno) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			return mapper.deleteAnnPost(pno);
		}
	}	
	
	@Override
	public int modifyPostAnn(Post post) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			return mapper.updateAnnPost(post);
		}
	}

	@Override
	public List<Post> listQnA(Criteria cri) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			ManageMapper mapper = session.getMapper(ManageMapper.class);
			return mapper.selectAllQnAPost(cri);
		}
	}

	public static void main(String[] args) {
		
//		Taboo t = Taboo.builder().keyWord("뭐").build(); 
		Criteria cri = new Criteria();
		cri.setCno(84);
		System.out.println(cri);
		List<Post> i = new ManageServiceImpl().listQnA(cri);
		
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

