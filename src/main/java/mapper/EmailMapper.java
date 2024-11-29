package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.User;
import vo.UserEmail;

public interface EmailMapper {
	int insert(UserEmail userEmail);

	UserEmail selectFindByEmail(UserEmail userEmail);

	User selectFindBy(String receiver);
}
