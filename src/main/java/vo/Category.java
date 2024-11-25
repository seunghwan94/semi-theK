package vo;


import java.util.Date;
import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Category {
	
	private int cno;
	private String cname;
	private String mainCategory;
	private String subCategory;
	private int parentCno;
	private int sort;
	private String isUse; 
	private Date createDate; // 등록일
	private Date updateDate; // 수정일
	private String icon; // 아이콘
	private String pathName; // 경로명
}
