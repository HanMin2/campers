package com.campers.item.model.service;


import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import com.campers.item.model.dto.Item;
import com.kh.mvc.common.util.PageInfo;

public interface ItemService {
	
	List<Item> getItems(String search);

}
