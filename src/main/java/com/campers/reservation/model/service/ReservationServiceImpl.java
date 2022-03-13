package com.campers.reservation.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campers.reservation.model.mapper.ReservationMapper;
import com.campers.reservation.model.vo.Reservation;
import com.kh.mvc.common.util.PageInfo;

@Service 
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationMapper mapper;
	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insert(Reservation reservation) {
		int result = 0;
		result = mapper.insertReservation(reservation);
		return result;
	}

	@Override
	public Reservation findByNo(String reservation_no) {
		return mapper.selectReservationByNo(reservation_no);
	}

	@Override
	public List<Reservation> findByUserId(PageInfo pageInfo,String userid) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		return mapper.selectReservationListByUserId(rowBounds,userid);
	}

	@Override
	public int findCountByUserId(String userid) {
		
		return mapper.selectReservationCount(userid);
	}

	@Override
	public List<Reservation> findByCampsiteIndex(PageInfo pageInfo, String campsite_index) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		return mapper.selectReservationCampsiteList(rowBounds, campsite_index);
	}

	@Override
	public int findCountByCampsiteIndex(String campsite_index) {
		return mapper.selectReservationCampsiteCount(campsite_index);
	}
	
	
	
	
	
	

	
	
	
	
}
