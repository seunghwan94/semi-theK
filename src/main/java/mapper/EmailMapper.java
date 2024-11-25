package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.UserEmail;

public interface EmailMapper {
	String email(UserEmail userEmail);
	int att(UserEmail userEmail);

}
