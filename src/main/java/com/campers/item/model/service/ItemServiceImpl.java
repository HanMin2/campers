package com.campers.item.model.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.campers.item.model.dto.Item;

import api.navershop.NaverApiExplorer;

@Service(value ="ItemService")
public class ItemServiceImpl implements ItemService{
	
	NaverApiExplorer naver = new NaverApiExplorer();
	
	@Override
	public List<Item> getItems(String search) {
		
		System.out.println("service : " + search);
		naver.naverShopping(search);
        
        return naver.getList();
	}
	
	
	
}
