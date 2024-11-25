package service;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import mapper.CategoryMapper;
import utils.MybatisInit;
import vo.Category;

public class CategorySerivceImpl implements CategoryService{

	@Override
	public List<Category> listMain() {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			CategoryMapper mapper = session.getMapper(CategoryMapper.class);
			return mapper.selectMain();
		}
	}
	
	@Override
	public List<Category> listSub() {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			CategoryMapper mapper = session.getMapper(CategoryMapper.class);
			return mapper.selectSub();
		}
	}
		
	public static void main(String[] args) {
		List<Category> D = new CategorySerivceImpl().listMain();
		D.forEach(System.out::println);
		//		for(Category c : D ) {
//			System.out.println(c);
//		}
	}
}
