package com.campers.inquiry.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.campers.inquiry.model.vo.Inquiry;


@Mapper
public interface InquiryMapper {
	List<Inquiry> selectAll();
	
	List<Inquiry> selectInquiryByUser(String sender);
	
	List<Inquiry> selectInquiryDetail(Map<String, String> users);
	
	int insertInquiryDetail(Inquiry inquiry);
	
}
