package service.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

public class ServiceCommon {
	private static final Gson GSON = new Gson();
	
	public static void sendJson(HttpServletResponse resp, String status,Object... items) throws IOException {
		Map<String, Object> responseMap = new HashMap<>();
        responseMap.put("status", status);
        
        for (Object item : items) {
            responseMap.put(item+"", item);
        }
        
        resp.setContentType("application/json; charset=utf-8");
        resp.getWriter().print(GSON.toJson(responseMap));
	}
	
	public static <T> T getJson(HttpServletRequest req, Class<T> clazz) throws IOException {
		return GSON.fromJson(req.getReader(), clazz);
	}
	
}
