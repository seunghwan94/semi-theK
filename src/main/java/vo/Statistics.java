package vo;

import lombok.*;
@Data
@AllArgsConstructor
//@NoArgsConstructor
@Builder
public class Statistics {
	private String target;
	private int cnt;
}
