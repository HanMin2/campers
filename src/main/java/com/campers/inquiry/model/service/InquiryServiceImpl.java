package com.campers.inquiry.model.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campers.inquiry.model.mapper.InquiryMapper;
import com.campers.inquiry.model.vo.Inquiry;


@Service 
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	private InquiryMapper mapper;

	@Override
	public List<Inquiry> selectInquiryByUser(String sender) {

		return mapper.selectInquiryByUser(sender);
	}

	@Override
	public List<Inquiry> getInquiryDetail(Map<String, String> param) {

		Map<String, String> users = new HashMap<String, String>();
		
		String sender = param.get("sender");
		String receiver = param.get("receiver");
		
		System.out.println("sender : " + sender);
		System.out.println("receiver : " + receiver);
		
		users.put("sender", sender);
		users.put("receiver", receiver);
		
		return mapper.selectInquiryDetail(users);
	}

	@Override
	public int insertInquiryDetail(Inquiry inquiry) {
		int result = 0;
		
		result = mapper.insertInquiryDetail(inquiry);
		
		return result;
	}
	
}
