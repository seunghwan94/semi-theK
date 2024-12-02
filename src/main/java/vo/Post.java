package vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
//@NoArgsConstructor
@AllArgsConstructor
public class Post {
	private  int pno; // 게시글 번호
	private  String title; // 게시글 제목
	private  String userId; // 게시물 작성자
	private  String content; // 게시글 내용
	private  int viewCnt; // 게시글 조회수
	private  Date createDate; // 게시글 등록일
	private  Date updateDate; // 게시글 업데이트 날짜
	private  int cno; // 게시글 카테고리 번호(외래키)
	private String imgData;
	
	@Builder.Default
	private List<Post> attachs = new ArrayList<>();

	public Post(int pno, String title, String userId, String content, int viewCnt, Date createDate, Date updateDate,
			int cno, String imgData) {
		super();
		this.pno = pno;
		this.title = title;
		this.userId = userId;
		this.content = content;
		this.viewCnt = viewCnt;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.cno = cno;
		this.imgData = imgData;
	}
	
}
