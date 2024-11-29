package service.manage;

import java.util.List;

import dto.Criteria;
import vo.Taboo;

public interface MngTabooService {

	// Taboo
	List<Taboo> tabooList(Criteria cri);
	boolean addTaboo(String keyWord);
	boolean removeTaboo(Taboo t);
	boolean modifyTaboo(Taboo taboo);
	
	int count(Criteria cri);
	
}
