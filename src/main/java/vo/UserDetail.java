package vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@Builder
@AllArgsConstructor
public class UserDetail {
	private String id;
	private String name;
	private char gender;
	private String addr;
	private String detailAddr;
	private String selfIntro;
	private String grade;
	private int mtno;
	private Date lastLogin;
	private Date createDate;
	private Date updateDate;
	

}
