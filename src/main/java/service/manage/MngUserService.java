package service.manage;

import java.util.List;

import dto.Criteria;
import dto.MngUserDto;


public interface MngUserService {
	// user
	List<MngUserDto> userList(Criteria cri);
	MngUserDto findByUser(String id);
	boolean modifyUser(MngUserDto mdto);
	
	int count(Criteria cri);
	
	
}
