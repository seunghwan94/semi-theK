package mapper.manage;

import java.util.List;

import vo.Statistics;

public interface HomeMapper {

	List<Statistics> selectByUserCnt();

	List<Statistics> selectByGenderCnt();
	
	List<Statistics> selectByUserCreateCnt();
	
	List<Statistics> selectByGradeCnt();

	List<Statistics> selectByNameCnt();

	List<Statistics> selectByPostCnt();

	List<Statistics> selectByPostLikeCnt();

	List<Statistics> selectByPostCnoCnt();
}
