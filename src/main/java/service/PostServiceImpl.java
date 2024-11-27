package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mapper.PostMapper;
import utils.MybatisInit;
import vo.Post;

public class PostServiceImpl implements PostService {

	@Override
	public List<Post> listPost(int cno) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			return mapper.selectList(cno);
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
	
	public static void main(String[] args) {
		Post post = Post.builder().title("test").userId("231@na1").content("<strong>333</strong>").cno(5).build();
		int i = new PostServiceImpl().addPost(post);
		System.out.println(i);
	}
}
