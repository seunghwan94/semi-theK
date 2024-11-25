package service;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

import mapper.CategoryMapper;
import utils.MybatisInit;
import vo.Category;

public class CategorySerivceImpl implements CategoryService{

	@Override
	public List<Category> selectlist() {
		try(SqlSession session =  MybatisInit.getInstance().sqlSessionFactory().openSession(true)){
			CategoryMapper mapper = session.getMapper(CategoryMapper.class);
			return mapper.selectMain();
		}
	}
	
	public static void main(String[] args) {
		List<Category> D = new CategorySerivceImpl().selectlist();
		System.out.println(D);
		D.forEach(System.out::println);
		//		for(Category c : D ) {
//			System.out.println(c);
//		}
	}
}
