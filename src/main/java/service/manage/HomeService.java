package service.manage;

import java.util.List;

import vo.Statistics;

public interface HomeService {
	
	List<Statistics> userTotal();
	List<Statistics> genderTotal();
	List<Statistics> userCreateTotal();
	List<Statistics> gradeTotal();
	List<Statistics> nameTotal();
	List<Statistics> postTotal();
	List<Statistics> likeTotal();
	
}
