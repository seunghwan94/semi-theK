package dto;

import java.lang.reflect.Field;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Criteria {
	private int page= 1;	 // 페이지 번째s
	private int amount = 10; // 한페이지에 보여질 갯수
	private int category = 2;// post 카테고리
	private String type;	 // 검색 타입
	private String keyword;	 // 검색어
	
	public int getOffset() {
		return (page -1) * 10;
	}
	
	// request 분석 후 필드 초기화
	public Criteria (HttpServletRequest req) {
		if(req == null) return;
		
		Field[] fields = getClass().getDeclaredFields();
		
		for(Field field : fields) {
			String tmp = req.getParameter(field.getName());
			
			if(tmp != null && !tmp.equals("")) {
				try {
					Object object = tmp;
					if (field.getType() == int.class) {
						object = Integer.parseInt(tmp);
					}
					field.set(this, object);
				} catch (IllegalArgumentException | IllegalAccessException e) {
					e.printStackTrace();
				}
			}
			
		}
	}
	
	// page 포함
	public String getQs2() {
		return "page="+page+"&"+getQs();
	}
	
	// page 비포함
	public String getQs() {
		Field[] fields = getClass().getDeclaredFields();
		String[] strs = new String[4];			
		Stream.of(fields).filter(f->!f.getName().equals("page")).map(f -> {
			String r = null;
			try {				
				r = f.getName() + "=" + (f.get(this) == null ? "" : f.get(this));
			} catch (IllegalArgumentException | IllegalAccessException e) {
				e.printStackTrace();
			}
			return r;
		}).collect(Collectors.toList()).toArray(strs);
		
		return String.join("&", strs);
	}
	
	public String[] getTypeArr() {
		return type.split("");
	}
	
//	public static void main(String[] args) {
//		System.out.println(new Criteria().getQs());
//	}
}
