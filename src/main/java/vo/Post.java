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
public class Post {
	private final int pno; // 게시글 번호
	private final String title; // 게시글 제목
	private final String userId; // 게시물 작성자
	private final String content; // 게시글 내용
	private final int viewCnt; // 게시글 조회수
	private final Date createDate; // 게시글 등록일
	private final Date updateDate; // 게시글 업데이트 날짜
	private final int cno; // 게시글 카테고리 번호(외래키)
	
	public Post(int pno, String title, String userId, String content, int viewCnt, Date createDate, Date updateDate,
			int cno) {
		super();
		this.pno = pno;
		this.title = title;
		this.userId = userId;
		this.content = content;
		this.viewCnt = viewCnt;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.cno = cno;
	}
	
//	
	
//	private final boolean attachFlag;
	
//	@Builder.Default
//	private List<Attach> attachs = new ArrayList<>();
	
}
