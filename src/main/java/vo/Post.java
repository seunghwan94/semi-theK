package vo;

import java.util.Date;
import lombok.*;

@Data
@Builder
//@NoArgsConstructor
@AllArgsConstructor
public class Post {
	private final int pno; // 게시글 번호
	private final String title; // 게시글 제목
	private final String userId; // 게시물 작성자
	private final String content; // 게시글 내용
	private final int viewCnt; // 게시글 조회수
	private final Date createDate; // 게시글 등록일
	private final Date updateDate; // 게시글 업데이트 날짜
	private final int cno; // 게시글 카테고리 번호(외래키)
	
//	public int[] cnoArr() {
//		return cno
//	}
}
