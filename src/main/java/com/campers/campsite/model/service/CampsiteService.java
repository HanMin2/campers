package com.campers.campsite.model.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.campers.campsite.model.vo.Campsite;
import com.campers.campsite.model.vo.CampsiteBean;
import com.campers.campsite.model.vo.Review;
import com.campers.user.model.vo.User;
import com.kh.mvc.common.util.PageInfo;

public interface CampsiteService {
	int insertCampsite(List<Campsite> array);

	int getCampsiteCount(Map<String, String> param);
	int getCampsiteCount2(CampsiteBean cb);
	
	List<Campsite> getCampsiteList(PageInfo pageInfo, Map<String, String> param);
	List<Campsite> getCampsiteList2(PageInfo pageInfo, CampsiteBean cb);
	
	public int save(Campsite campsite);

	boolean validate(String id);

	Campsite findById(String id);
	
	Campsite login(String id, String password);
	
	Campsite findByIndex(String campsite_index);

	List<Campsite> selectCampsiteListById(String id);
	
	List<Campsite> getCampsiteList(String do_name);
	
	// 신규캠핑장 업로드 절차

	int updateCampsiteStep1(HashMap<String, String> param);

	int updateCampsiteStep2(HashMap<String, Object> param);

	int updateCampsiteStep3(HashMap<String, String> param);

	int updateCampsiteStep4(HashMap<String, String> param2);
	
	// 파일 업로드

	String saveFile(MultipartFile upfile, String savePath, String index);
	
	// 캠핑장 리뷰
	
	List<Review> selectReviewByIndex(String index);
	
	List<Review> selectReviewById(String id);
	
	int insertReview(Review review);
	
	int selectReviewCountById(String id);
	
	int selectReviewCountByIndex(String index);
	
}
