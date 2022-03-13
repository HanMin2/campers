package com.campers.inquiry.model.service;

import java.util.List;
import java.util.Map;

import com.campers.inquiry.model.vo.Inquiry;

public interface InquiryService {
	
	List<Inquiry> selectInquiryByUser(String sender);
	
	List<Inquiry> getInquiryDetail(Map<String, String> param);
	
	int insertInquiryDetail(Inquiry inquiry);
	
}
