package com.campers.reservation.model.service;

import java.util.List;
import java.util.Map;

import com.campers.reservation.model.vo.Reservation;
import com.kh.mvc.common.util.PageInfo;

public interface ReservationService {
	
	int insert(Reservation reservation);
	
	Reservation findByNo(String reservation_no);

	List<Reservation> findByUserId(PageInfo pageInfo,String userid);
	
	int findCountByUserId(String userid);
	
	List<Reservation> findByCampsiteIndex(PageInfo pageInfo,String campsite_index);
	
	int findCountByCampsiteIndex(String campsite_index);
}
