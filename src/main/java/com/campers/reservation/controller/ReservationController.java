package com.campers.reservation.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.campers.campsite.model.service.CampsiteService;
import com.campers.campsite.model.vo.Campsite;
import com.campers.reservation.model.service.ReservationService;
import com.campers.reservation.model.vo.Reservation;
import com.campers.user.model.vo.User;
import com.kh.mvc.common.util.PageInfo;
import com.campers.user.model.service.UserService;

import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
//@Slf4j
@SessionAttributes("loginCampsite")
@Controller

public class ReservationController {
	//	@Qualifier("ReservationService")
	//	@Autowired
	//	private ReservationService service;

	//	@RequestMapping(value = "/", method = RequestMethod.GET)
	//	public String home(Locale locale, Model model) {
	//		return "home";
	//	}

	@Autowired
	private ReservationService reservationservice;
	@Autowired
	private CampsiteService campSiteService;
	@Autowired
	private UserService userservice;

	@GetMapping("/reservation/step1")
	public ModelAndView campsiteView(ModelAndView model, @RequestParam HashMap<String, String> param) {
		String headCount = param.get("headCount");
		String bookingDate = param.get("bookingDate");
		String campsite_index = param.get("campsite_index");
		Campsite campsite = campSiteService.findByIndex(campsite_index);
		model.addObject("bookingDate", bookingDate);
		model.addObject("headCount", headCount);
		model.addObject("campsite", campsite);
		model.setViewName("/reservation/step1");

		return model;
	}

	@GetMapping("/reservation/step2")
	public ModelAndView step2(ModelAndView model, @RequestParam HashMap<String, String> param) {
		String headCount = param.get("headCount");
		String bookingDate = param.get("bookingDate");
		String campsite_index = param.get("campsite_index");
		Campsite campsite = campSiteService.findByIndex(campsite_index);
		model.addObject("bookingDate", bookingDate);
		model.addObject("headCount", headCount);
		model.addObject("campsite", campsite);

		model.setViewName("/reservation/step2");

		return model;
	}

	@GetMapping("/reservation/step3")
	public ModelAndView step3(ModelAndView model, @RequestParam HashMap<String, String> param,
			@SessionAttribute(name = "loginUser", required = false) User loginUser,
			@ModelAttribute Reservation reservation) {
		if (loginUser == null) {
			model.addObject("msg", "로그인 후 이용해주세요!");
			model.addObject("location", "/");
			model.setViewName("common/msg");

			return model;
		}

		String userid = loginUser.getUserId();
		String headCount = param.get("headCount");
		String bookingDate = param.get("bookingDate");
		String campsite_index = param.get("campsite_index");
		Campsite campsite = campSiteService.findByIndex(campsite_index);

		String date[] = bookingDate.split("to");

		String startdate = date[0];
		String enddate = date[1];

		reservation.setStartdate(startdate);
		reservation.setEnddate(enddate);

		reservation.setUserid(userid);

		int result = reservationservice.insert(reservation);
		model.addObject("bookingDate", bookingDate);
		model.addObject("headCount", headCount);
		model.addObject("campsite", campsite);

		model.setViewName("/reservation/step3");

		return model;
	}

	@GetMapping("/reservation/detail")
	public ModelAndView detail(ModelAndView model, @RequestParam HashMap<String, String> param,
			@SessionAttribute(name = "loginUser", required = false) User loginUser) {
		User user = userservice.findById(loginUser.getUserId());
		String headCount = param.get("headCount");
		String bookingDate = param.get("bookingDate");
		String campsite_index = param.get("campsite_index");
		Campsite campsite = campSiteService.findByIndex(campsite_index);
		model.addObject("user", user);
		model.addObject("bookingDate", bookingDate);
		model.addObject("headCount", headCount);
		model.addObject("campsite", campsite);

		model.setViewName("/reservation/detail");

		return model;
	}
	@GetMapping("/reservation/historyForUser")
	public ModelAndView historyForUser(ModelAndView model, 
			@SessionAttribute(name ="loginUser", required = false) User loginUser, 
			Map<String, String> param) throws ParseException {
		int page = 1;
		if(param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {}
		}
		String userid2 = loginUser.getUserId();
		
		int cnt = reservationservice.findCountByUserId(userid2);
		
		PageInfo pageInfo = new PageInfo(page, 12, reservationservice.findCountByUserId(userid2), 12);
		List<Reservation> reservations = reservationservice.findByUserId(pageInfo, userid2);
		
		List<String> campsiteIndexes = new ArrayList<>(); 
		for(Reservation reservation : reservations) {
			String fday100 = reservation.getStartdate();
			String eday100 = reservation.getEnddate();
			String[] fday111 = fday100.split("\\s");
			String[] eday111 = eday100.split("\\s");
			
			String fday5 = fday111[0];
			String eday5 = eday111[0];
			reservation.setStartdate(fday5);
			reservation.setEnddate(eday5);
		}
		for(Reservation reservation : reservations) {
			campsiteIndexes.add(reservation.getCampsite_index());
		}
		List<Campsite> campsites = new ArrayList<>();
		for(String campsiteIndex: campsiteIndexes) {
			campsites.add(campSiteService.findByIndex(campsiteIndex));
		}
		List<String> diffDays = new ArrayList<>();
		for(Reservation reservation : reservations) {
			String fday2 = reservation.getStartdate();
			String eday2 = reservation.getEnddate();
			String[] fday1 = fday2.split("\\s");
			String[] eday1 = eday2.split("\\s");
			
			String fday = fday1[0];
			String eday = eday1[0];
			
			Date date = new SimpleDateFormat("yyyy-MM-dd").parse(fday);
			Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(eday);

			long diffSec = (date2.getTime() - date.getTime()) /1000;
			long diffDay = diffSec/(24*60*60);
			String diffDay2 = Long.toString(diffDay);
			
			diffDays.add(diffDay2);
		}
		System.out.println("숙박 일수 :"+diffDays);
		
		model.addObject("cnt", cnt);
		model.addObject("diffDays", diffDays);
		model.addObject("reservations", reservations);
		model.addObject("campsiteIndexes", campsiteIndexes);
		model.addObject("pageInfo", pageInfo);
		model.addObject("campsites", campsites);
		model.setViewName("/reservation/historyForUser");

		return model;
	}
	
	@GetMapping("/reservation/historyForCampsite")
	public ModelAndView historyForCampsite(ModelAndView model, 
			@SessionAttribute(name ="loginCampsite", required = false) Campsite loginCampsite, 
			Map<String, String> param) throws ParseException {
		int page = 1;
		if(param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {}
		}
		String cpid = loginCampsite.getId();
		Campsite campsite77 = campSiteService.findById(cpid);
		String cpIndex = campsite77.getCampsite_index();
		
		int cnt = reservationservice.findCountByCampsiteIndex(cpIndex);
		
		PageInfo pageInfo = new PageInfo(page, 12, reservationservice.findCountByCampsiteIndex(cpIndex), 12);
		List<Reservation> reserv = reservationservice.findByCampsiteIndex(pageInfo, cpIndex);
		List<String> userids = new ArrayList<>();
		for(Reservation reserv2 : reserv) {
			userids.add(reserv2.getUserid());
		}
		List<User> users = new ArrayList<>();
		for(String userid : userids) {
			users.add(userservice.findById(userid));
		}
		List<String> names = new ArrayList<>();
		for(User user : users) {
			names.add(user.getName());
		}
		List<String> diffDays = new ArrayList<>();
		for(Reservation reservation : reserv) {
			String fday2 = reservation.getStartdate();
			String eday2 = reservation.getEnddate();
			String[] fday1 = fday2.split("\\s");
			String[] eday1 = eday2.split("\\s");
			
			String fday = fday1[0];
			String eday = eday1[0];
			
			Date date = new SimpleDateFormat("yyyy-MM-dd").parse(fday);
			Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(eday);

			long diffSec = (date2.getTime() - date.getTime()) /1000;
			long diffDay = diffSec/(24*60*60);
			String diffDay2 = Long.toString(diffDay);
			
			diffDays.add(diffDay2);
		}
		for(Reservation reservation : reserv) {
			String fday100 = reservation.getStartdate();
			String eday100 = reservation.getEnddate();
			String[] fday111 = fday100.split("\\s");
			String[] eday111 = eday100.split("\\s");
			
			String fday5 = fday111[0];
			String eday5 = eday111[0];
			reservation.setStartdate(fday5);
			reservation.setEnddate(eday5);
		}
		
		model.addObject("diffDays", diffDays);
		model.addObject("cnt", cnt);
		model.addObject("pageInfo", pageInfo);
		model.addObject("reserv", reserv);
		model.addObject("names" , names);
		model.setViewName("/reservation/historyForCampsite");
		return model;
	}
}
