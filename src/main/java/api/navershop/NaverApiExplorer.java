package api.navershop;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.campers.item.model.dto.Item;

@Component
public class NaverApiExplorer {
	
	private List<Item> list = null;
	private String search = null;
	
	
	public List<Item> getList() {
		return list;
	}


	public void setList(List<Item> list) {
		this.list = list;
	}


	public void naverShopping(String search) {
		if(this.search == null || this.search.equalsIgnoreCase(search)) {
			list = new ArrayList<Item>();
			this.search = search;
			
			for(int i = 0; i < 10; i++) {
				RestTemplate rest = new RestTemplate();
				HttpHeaders headers = new HttpHeaders();
				headers.add("X-Naver-Client-Secret", "fnpIsS3wRW");
				headers.add("X-Naver-Client-Id", "XsJDlbEDj6IY7JSk_AGf");
				String body = "";
				
				HttpEntity<String> requestEntity = new HttpEntity<String>(body, headers);
				ResponseEntity<String> responseEntity = rest.exchange("https://openapi.naver.com/v1/search/shop.json?query="+ search + "&displ0ay=100" + "&start=500" , HttpMethod.GET, requestEntity, String.class);
				HttpStatus httpStatus = responseEntity.getStatusCode();
				
				int status = httpStatus.value();
				String response = responseEntity.getBody();
				
				System.out.println("Response status: " + status);
				System.out.println(response);
				fromJSONtoItems(response);
			}
			System.out.println(list);
		}

	}
	
	
	// 검색된 상품 목록 데이터를 DTO로 변환 
	public List<Item> fromJSONtoItems(String result) { 
		//System.out.println("@@@@@");
		
		JSONParser jsonParse = new JSONParser();
		
		//JSONParse에 json데이터를 넣어 파싱한 다음 JSONObject로 변환한다.
		JSONObject jsonObj;
		try {
			//System.out.println("@@@@@try");
			jsonObj = (JSONObject) jsonParse.parse(result);
			
			//JSONObject에서 PersonsArray를 get하여 JSONArray에 저장한다.
//			JSONObject result = (JSONObject) jsonObj.get("boxOfficeResult");
			JSONArray itemsArray = (JSONArray) jsonObj.get("items");
			
			List<Item> itemsList = new ArrayList<>(); 
			
			for (int i = 0; i < itemsArray.size(); i++) { 
				//System.out.println("@@@@@for");
				JSONObject itemJson = (JSONObject) itemsArray.get(i);
				System.out.println("title : " + itemJson.get("title"));
				System.out.println("link : " + itemJson.get("link"));
				System.out.println("image : " + itemJson.get("image"));
				System.out.println("lprice : " + itemJson.get("lprice"));
				System.out.println("mallName : " + itemJson.get("mallName"));
				System.out.println("maker : " + itemJson.get("maker"));
				System.out.println("brand : " + itemJson.get("brand"));
				System.out.println("category1 : " + itemJson.get("category1"));
				System.out.println("category2 : " + itemJson.get("category2"));
				System.out.println("category3 : " + itemJson.get("category3"));
				
				//System.out.println(itemJson); 
				Item item = new Item(itemJson); 
				list.add(item);
			} 
			
			return itemsList; 
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}



	/*
	public static void main(String[] args) {
		
		NaverApiExplorer naver = new NaverApiExplorer();
		String result = naver.naverShopping("텐트");
		
		List<Item> list = new ArrayList<>();
		list = naver.fromJSONtoItems(result);
	}
	*/
}
