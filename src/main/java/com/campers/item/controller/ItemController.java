package com.campers.item.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.campers.item.model.dto.Item;
import com.campers.item.model.service.ItemService;
import com.kh.mvc.common.util.PageInfo;

import api.campers.ApiExplorer;
import api.navershop.NaverApiExplorer;
import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class ItemController {
	
	@Qualifier("ItemService")
	@Autowired
	private ItemService service;
	
	private NaverApiExplorer naver; 
	
	@GetMapping("/item/commerce")
	public String commercePage() {
		log.info("커머스 페이지 요청");
		return "item/commerce";
	}

	@GetMapping("/item/searchList")
    public ModelAndView getItems(ModelAndView model, 
    		@RequestParam("search") String search) {
        
		System.out.println("search : " + search);
		
		List<Item> itemsList = service.getItems(search);
		
		model.addObject("search", search);
		model.addObject("itemsList", itemsList);
		model.setViewName("/item/searchList");

		return model;
    }
}
