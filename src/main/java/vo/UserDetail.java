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
	private String detailaddr;
	private String selfintro;
	private String grade;
	private int mtno;
	private Date lastlogin;
	private Date createdate;
	private Date updatedate;
	

}
