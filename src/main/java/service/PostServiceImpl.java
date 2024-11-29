package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.Criteria;
import mapper.PostMapper;
import utils.MybatisInit;
import vo.Post;

public class PostServiceImpl implements PostService {

	@Override
	public List<Post> listPost(Criteria cri) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			System.out.println("크리테리아" + cri);
			return mapper.selectList(cri);
		}
	}

//	paging
	@Override
	public int count(Criteria cri) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			System.out.println("카운트 크리" + cri);
			return mapper.getCount(cri);
		}
	}
	
	@Override
	public List<Post> lastPost() {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			return mapper.lastList2(); 
		}
	}

	@Override
	public Post view(int pno) {
		try (SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			mapper.increaseViewCount(pno);
			return mapper.selectOne(pno); 
		}
	}
	
	@Override
	public int addPost(Post post) {
		try (SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			return mapper.insert(post); 
		}
	}
	
	@Override
	public int remove(int pno) {
		try (SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			return mapper.delete(pno); 
		}
	}

	@Override
	public int update(Post post) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			return mapper.update(post);
		}
	}

	@Override
	public Post findBy(int pno) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			Post post = mapper.selectOne(pno);
			return post;
		}
	}

//	public static void main(String[] args) {
//		Post post = Post.builder().title("test").userId("231@na1").content("<strong>333</strong>").cno(5).build();
//		int i = new PostServiceImpl().addPost(post);
//		System.out.println(i);
//	}
	
}
