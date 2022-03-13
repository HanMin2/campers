package com.campers.campsite.model.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.campers.campsite.model.vo.Campsite;
import com.campers.campsite.model.vo.CampsiteBean;
import com.campers.campsite.model.vo.Review;

@Mapper
public interface CampsiteMapper {
	// paging 처리를 위한 RowBounds 셋팅!
		List<Campsite> getCampsiteList(RowBounds rowBounds, Map<String, String> map);
		
		int getCampsiteCount(Map<String, String> searchMap);

//		Campsite getCampsiteByNo(int campsite_index);
//		
		int insertCampsite(Campsite site);
		
		int insertCampsiteUser(Campsite campsite);
//
//		int updateCampsite(Campsite site);
//		
//		int updateReadCount(Campsite site);
//		
//		int deleteReply(int no);
//		
//		int deleteBoard(int no);

		Campsite selectCampsiteById(String id);

		List<Campsite> getCampsiteList2(RowBounds rowBounds, CampsiteBean cb);

		int getCampsiteCount2(CampsiteBean cb);
		
		Campsite selectCampsiteByIndex(String campsite_index);

		List<Campsite> selectCampsiteListById(String id);

		int updateCampsiteStep1(HashMap<String, String> param);

		int updateCampsiteStep2(HashMap<String, Object> param);

		int updateCampsiteStep3(HashMap<String, String> param);
		
		int updateCampsiteStep4(HashMap<String, String> param2);


		List<Review> selectReviewByIndex(String index);
		
		List<Review> selectReviewById(String id);
		
		int insertReview(Review review);
		
		int selectReviewCountById(String id);
		
		int selectReviewCountByIndex(String index);

		List<Campsite> getCampsiteList3(String do_name);

}

