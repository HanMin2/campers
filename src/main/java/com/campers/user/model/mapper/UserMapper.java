package com.campers.user.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.campers.user.model.vo.User;


@Mapper
public interface UserMapper {
	
	int selectCount();
	
	List<User> selectAll();
	
	User selectUser(@Param("userId") String userId);
	
	int insertUser(User user);

	int updateUser(Map<String, String> map);
	
	int deleteUser(@Param("userId") String userId);
	
	int updatePwd(Map<String, String> map);

}
