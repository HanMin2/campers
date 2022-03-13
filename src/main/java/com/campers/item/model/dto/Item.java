package com.campers.item.model.dto;

import org.json.simple.JSONObject;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class Item {
	private String title;
	private String link;
	private String image;
	private int lprice;
	private String mallName;
	private String maker;
	private String brand;
	private String category1;
	private String category2;
	private String category3;	
	
	
	public Item(JSONObject itemJson) {
		
		String tmp = (String) itemJson.get("title");
		String tmp2 = tmp.replaceAll("<b>", "");
		String tmp3 = tmp2.replaceAll("</b>", "");
		
		this.title = tmp3;
		this.link = (String) itemJson.get("link"); 
		this.image = (String) itemJson.get("image"); 
		this.lprice = Integer.parseInt((String) itemJson.get("lprice"));
		this.mallName = (String) itemJson.get("mallName"); 
		this.maker = (String) itemJson.get("maker"); 
		this.brand = (String) itemJson.get("brand"); 
		this.category1 = (String) itemJson.get("category1"); 
		this.category2 = (String) itemJson.get("category2"); 
		this.category3 = (String) itemJson.get("category3"); 
	}
	
	
}
