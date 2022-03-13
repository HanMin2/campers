package com.campers.reservation.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.campers.campsite.model.vo.Campsite;
import com.campers.reservation.model.vo.Reservation;


@Mapper
public interface ReservationMapper {
	List<Reservation> selectAll();
	
	Reservation selectReservationByNo(@Param("reservation_no") String reservation_no);
	
	int insertReservation(Reservation reservation);
	
	List<Reservation> selectReservationListByUserId(RowBounds rowBounds,@Param("userid") String userid);

	int selectReservationCount(@Param("userid") String userid);
	
	List<Reservation> selectReservationCampsiteList(RowBounds rowBounds,@Param("campsite_index") String campsite_index);
	
	int selectReservationCampsiteCount(@Param("campsite_index") String campsite_index);
}
