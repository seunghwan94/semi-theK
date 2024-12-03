package service;

import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;

import dto.Criteria;
import dto.MngUserDto;
import dto.PostDto;
import mapper.PostMapper;
import mapper.manage.MngUserMapper;
import utils.MybatisInit;
import vo.Post;
import vo.Postlike;
import vo.User;

public class PostServiceImpl implements PostService {

	@Override
	public List<Post> listPost(Criteria cri) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
//			System.out.println("크리테리아" + cri);
			return mapper.selectList(cri);
		}
	}

//	paging
	@Override
	public int count(Criteria cri) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
//			System.out.println("카운트 크리" + cri);
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
	    try (SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)) {
	        PostMapper mapper = session.getMapper(PostMapper.class);
//	        if (post.getCno() == 3 && post.getImgData() != null) {
//	            post.setImgData(String.join(",", post.getAttachs().stream().map(Post::getImgData).collect(Collectors.toList())));
//	        	
//	        }
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

	@Override
	public boolean likes(Post post) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			return mapper.updateLike(post)==1 ? true : false;
		}
	}
	
	@Override
	public boolean removelikes(Post post) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			return mapper.deleteLike(post)==1 ? true : false;
		}
	}
	
	@Override
	public Postlike findByLikes(Post post, String userId) {
		try(SqlSession session = MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			Postlike Postlike = mapper.selectLikeOne(post.getPno(),userId);
			return Postlike;
		}
	}
	
	@Override
	public List<PostDto> postAndLike(Criteria cri,String userId) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			List<Post> posts = mapper.selectList(cri);
			return posts.stream().map(post-> new PostDto(post, findByLikes(post,userId))).collect(Collectors.toList());
		}
	}
	
	
	@Override
	public String thumbNail(int pno) {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			String imgString = mapper.getImg(pno);
			return imgString;
		}
	}

	public static void main(String[] args) {
		Post post = Post.builder().title("test").userId("1@1").content("<strong>333</strong>").cno(2).pno(106).build();
		System.out.println(post);
		
		Criteria cri = new Criteria();
		
		List<PostDto> i = new PostServiceImpl().postAndLike(cri,"231@na1");
		System.out.println(i);
		
	}
	
}
