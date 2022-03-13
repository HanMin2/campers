package com.campers.campsite.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CampsiteBean {
	private String searchSite;
	private String location;
	private String bookingDate;
	private String guests;
	private Integer pricefrom;
	private Integer priceto;
	private String neighbourhood;
	private String[] type;
	private String[] amenities;
	private String[] facilities; 
	
 	
}
