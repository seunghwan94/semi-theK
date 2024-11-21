package vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserLog {
	public int loguserno;
	public String userid;
	public int category;
	public String detail;
	public Date createdate;
}
