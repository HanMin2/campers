package com.campers.inquiry.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.campers.campsite.model.service.CampsiteService;
import com.campers.campsite.model.vo.Campsite;
import com.campers.inquiry.model.service.InquiryService;
import com.campers.inquiry.model.vo.Inquiry;
import com.campers.user.model.service.UserService;
import com.campers.user.model.vo.User;

import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@RequestMapping("/inquiry")
@Controller
public class InquiryController {
	
	@Autowired
	private InquiryService service;
	
	@Autowired
	private CampsiteService campsiteService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/listByUser")
	public ModelAndView listByUser(ModelAndView model,
			@SessionAttribute(name = "loginUser", required = false) User loginUser 
			) {
		log.info("문의 내역 리스트 요청페이지");
		 
		System.out.println("유저아이디 : " + loginUser.getUserId());
		List<Inquiry> allList = service.selectInquiryByUser(loginUser.getUserId());
		
		List<Inquiry> list = new ArrayList<>();
		
		for(int i = 0; i < allList.size(); i++) {
			Boolean isContain = false;
			Inquiry tmp = allList.get(i);
			
			String tmpSender = tmp.getSender();
			String tmpReceiver = tmp.getReceiver();
			
			if(list != null) {
				for(int j = 0; j < list.size() && isContain==false ; j++) {
					
					String sender = list.get(j).getSender();
					String receiver = list.get(j).getReceiver();
					
					if(tmpSender.equals(sender) && tmpReceiver.equals(receiver)) {
						isContain = true; 
						
						System.out.println("같은 수신자 : " + sender);
						System.out.println("같은 송신자 : " + receiver);
						break;
					}
				}
			}
			if(isContain == false) {
				list.add(tmp);
				
				System.out.println(tmp.toString());
			}
		}
		
		model.addObject("list", list);
		model.setViewName("/inquiry/list");
		
		return model;
	}
	
	@GetMapping("/listByCampsite")
	public ModelAndView listByCampsite(ModelAndView model,
			@SessionAttribute(name = "loginCampsite", required = false) Campsite loginCampsite 
			) {
		log.info("문의 내역 리스트 요청페이지");
		
		String index = loginCampsite.getCampsite_index();
		System.out.println("캠핑장인덱스 : " + index);
		List<Inquiry> allList = service.selectInquiryByUser(index);
		
		List<Inquiry> list = new ArrayList<>();
		
		for(int i = 0; i < allList.size(); i++) {
			Boolean isContain = false;
			Inquiry tmp = allList.get(i);
			
			System.out.println("문의 상세 : " + tmp);
			
			String tmpSender = tmp.getSender();
			String tmpReceiver = tmp.getReceiver();
			
			if(list != null) {
				for(int j = 0; j < list.size() && isContain==false ; j++) {
					
					String sender = list.get(j).getSender();
					String receiver = list.get(j).getReceiver();
					
					if(tmpSender.equals(sender) && tmpReceiver.equals(receiver)) {
						isContain = true; 
						
						System.out.println("같은 수신자 : " + sender);
						System.out.println("같은 송신자 : " + receiver);
						break;
					}
				}
			}
			if(isContain == false) {
				list.add(tmp);
				
				System.out.println(tmp.toString());
			}
		}
		
		model.addObject("list", list);
		model.setViewName("/inquiry/list2");
		
		return model;
	}
	
	@GetMapping("/listDetail")
	public ModelAndView listDetail(ModelAndView model,
			@SessionAttribute(name = "loginUser", required = false) User loginUser,
			@RequestParam("sender") String sender,
			@RequestParam("receiver") String receiver
			) {
		log.info("문의 내역 리스트 요청페이지");

		System.out.println("sender와 receiver : " + sender + " / " + receiver);
		
		Map<String, String> map = new HashMap<>();
		map.put("sender", sender);
		map.put("receiver", receiver);
		List<Inquiry> list = service.getInquiryDetail(map);
		
		Campsite campsite = campsiteService.findByIndex(receiver);
		System.out.println("campsite!!! " + campsite.toString());
		
		String savePath2 = "/upload/campsite/" + campsite.getFirst_image();
		
		model.addObject("list", list);
		model.addObject("savePath2", savePath2);
		model.addObject("campsite", campsite);
		model.setViewName("/inquiry/viewAndWrite");
		
		return model;
	}
	
	@GetMapping("/listDetail2")
	public ModelAndView listDetail2(ModelAndView model, HttpServletRequest request,
			@SessionAttribute(name = "loginUser", required = false) User loginUser,
			@RequestParam("con") String content,
			@RequestParam("index") String index
		) {
		
		if(index == null) {
			model.addObject("msg", "null!!");
			model.addObject("location", "/inquiry/listByUser");
			model.setViewName("/common/msg");
			return model;
		}
		
		System.out.println(index + " dfdfa " + content);
		Campsite campsite = campsiteService.findByIndex(index);
		System.out.println("listDetail2 : " + campsite.toString());
		
		Inquiry in = new Inquiry();
		in.setSender(loginUser.getUserId());
		in.setSenderName(loginUser.getName());
		in.setReceiver(index);
		in.setReceiverName(campsite.getCampsite_name());
		in.setContent(content);
		
		Map<String, String> map = new HashMap<>();
		map.put("sender", loginUser.getUserId());
		map.put("receiver", campsite.getCampsite_index());
		
		int result = service.insertInquiryDetail(in);
		List<Inquiry> list = service.getInquiryDetail(map);
		
		if(result > 0) {
			model.addObject("msg", "메시지 전송 성공!");
			model.addObject("location", "/inquiry/listDetail?sender=" + loginUser.getUserId() + "&receiver=" + campsite.getCampsite_index());
		} else {
			model.addObject("msg", "메시지 전송에 실패했습니다.");
			model.addObject("location", "/inquiry/listDetail?sender=" + loginUser.getUserId() + "&receiver=" + campsite.getCampsite_index());
		}
		model.addObject("list", list);
		model.setViewName("/common/msg");
		return model;
	}
	
	
	@GetMapping("/listDetail11")
	public ModelAndView listDetail11(ModelAndView model,
			@SessionAttribute(name = "loginCampsite", required = false) Campsite loginCampsite,
			@RequestParam("sender") String sender,
			@RequestParam("receiver") String receiver
			) {
		log.info("문의 내역 리스트 요청페이지");
		
		System.out.println("sender와 receiver : " + sender + " / " + receiver);
		
		Map<String, String> map = new HashMap<>();
		map.put("sender", sender);
		map.put("receiver", receiver);
		List<Inquiry> list = service.getInquiryDetail(map);
		
		Campsite campsite = campsiteService.findByIndex(sender);
		System.out.println("campsite!!! " + campsite.toString());
		
		User user = userService.findById(receiver);
		
		String savePath2 = "/upload/campsite/" + campsite.getFirst_image();
		
		model.addObject("list", list);
		model.addObject("savePath2", savePath2);
		model.addObject("campsite", campsite);
		model.addObject("user", user);
		model.setViewName("/inquiry/viewAndWrite2");
		
		return model;
	}
	
	@GetMapping("/listDetail22")
	public ModelAndView listDetail22(ModelAndView model, HttpServletRequest request,
			@SessionAttribute(name = "loginCampsite", required = false) Campsite loginCampsite,
			@RequestParam("con") String content,
			@RequestParam("id") String userId
			) {
		
		if(userId == null) {
			model.addObject("msg", "null!!");
			model.addObject("location", "/inquiry/listByCampsite");
			model.setViewName("/common/msg");
			return model;
		}
		
		String index = loginCampsite.getCampsite_index();
		
		System.out.println(userId + " dfdfa " + content);
		User user = userService.findById(userId);
		Campsite campsite = campsiteService.findByIndex(index);
		System.out.println("listDetail2 : " + campsite.toString());
		
		
		Inquiry in = new Inquiry();
		in.setSender(index);
		in.setSenderName(campsite.getCampsite_name());
		in.setReceiver(userId);
		in.setReceiverName(user.getName());
		in.setContent(content);
		
		Map<String, String> map = new HashMap<>();
		map.put("sender", index);
		map.put("receiver", userId);
		
		int result = service.insertInquiryDetail(in);
		List<Inquiry> list = service.getInquiryDetail(map);
		
		if(result > 0) {
			model.addObject("msg", "메시지 전송 성공!");
			model.addObject("location", "/inquiry/listDetail11?sender=" + index + "&receiver=" + userId);
		} else {
			model.addObject("msg", "메시지 전송에 실패했습니다.");
			model.addObject("location", "/inquiry/listDetail11?sender=" + index + "&receiver=" + userId);
		}
		model.addObject("list", list);
		model.setViewName("/common/msg");
		return model;
	}
	
	
}
