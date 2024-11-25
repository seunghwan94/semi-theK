package vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
//@NoArgsConstructor
@AllArgsConstructor
public class Taboo {
	private String keyWord;
	private String userId;
	private String isUse;
	private Date createDate;
	private Date updateDate;
}
