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

}
