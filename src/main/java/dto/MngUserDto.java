package dto;

import java.sql.Date;

import lombok.Data;
import vo.User;
import vo.UserDetail;

@Data
public class MngUserDto {
	private String id;
	private String name;
	private String gender;
	private String addr;
	private String detailAddr;
	private String selfIntro;
	private String grade;
	private String img;
	private int mtno;
	private Date lastLogin;
	
	
	private String pw;
	private String nickName;
	
	public MngUserDto(User user, UserDetail detail) {
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
		img = detail.getImg();
		lastLogin = detail.getLastLogin();
	}
}
