package vo;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Postlike {
	private  Integer  cnt; 			// 라이크 총 갯수
	private  Integer  myPush; 		// 내가 눌렀는지
}
