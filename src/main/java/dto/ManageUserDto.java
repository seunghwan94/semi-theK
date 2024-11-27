package dto;

import java.sql.Date;

import lombok.Data;
import vo.User;
import vo.UserDetail;

@Data
public class ManageUserDto {
	private String id;
	private String name;
	private String gender;
	private String addr;
	private String detailAddr;
	private String selfIntro;
	private String grade;
	private int mtno;
	private Date lastLogin;
	
	private String pw;
	private String nickName;
	
	public ManageUserDto(User user, UserDetail detail) {
		id = user.getId();
		pw = user.getPw();
		nickName = user.getNickName();
		
		if(detail == null) {
			return;
		}
		
		name = detail.getName();
		gender = detail.getGender();
		addr = detail.getAddr();
		detailAddr = detail.getDetailAddr();
		selfIntro = detail.getSelfIntro();
		grade = detail.getGrade();
		mtno = detail.getMtno();
		lastLogin = detail.getLastLogin();
	}
}
