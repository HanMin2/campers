package com.campers.user.model.service;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campers.user.model.mapper.UserMapper;
import com.campers.user.model.vo.User;


@Service 
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder; // SHA-256 Hash code 알고리즘 (일반향 암호)

	@Override
	public User login(String id, String pwd) {
		
		User user = this.findById(id);
		
		// passwordEncoder 활용법
		
		System.out.println(user.getUserPwd()); // Hash code로 암호화된 패스워드가 출력
		System.out.println(passwordEncoder.encode(pwd)); // encode를 통해 평문에서 암호문으로 바꾸는 코드
		System.out.println(passwordEncoder.matches(pwd, user.getUserPwd())); 
							// 파라메터로 받아온 pwd를 암호 화하고 기존 암호화 비교하는 코드
		
//		return member != null && 
//				passwordEncoder.matches(pwd, member.getPassword()) ? member : null;
//		
		if(user != null && passwordEncoder.matches(pwd, user.getUserPwd()) == true) {
		//if(user != null && user.getUserPwd().equals(pwd)) {
			return user;
		} else {
			return null;
		}
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int save(User user) {
		
		int result = 0;
		System.out.println(user.toString());
		
		String encodePwd = passwordEncoder.encode(user.getUserPwd()); // 평문을 hash code 변환
		user.setUserPwd(encodePwd);
		result = mapper.insertUser(user);
		
		return result;
	}

	@Override
	public boolean validate(String userId) {
		return this.findById(userId) != null;
	}

	@Override
	public User findById(String id) {
		return mapper.selectUser(id);
	}

	@Override
	@Transactional (rollbackFor = Exception.class)
	public int delete(String userId) {
		return mapper.deleteUser(userId);
	}

	@Override
	@Transactional (rollbackFor = Exception.class)
	public int updatePwd(User loginUser, String newPw, String curPw) {
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("userId", ""+loginUser.getUserId());
		map.put("newPwd", passwordEncoder.encode(newPw));
		
		System.out.println(map);
		
		return mapper.updatePwd(map);
	}
	
	@Override
	@Transactional (rollbackFor = Exception.class)
	public int updateInfo(Map<String, String> map) {
		
		String userId = map.get("userid");
		String name = map.get("updateName");
		String phone = map.get("updatePhone");
		String email = map.get("updateEmail");
		String address = map.get("updateAddress");
		
		Map<String, String> map2 = new HashMap<>();
		
		map2.put("userId", userId);
		map2.put("name", name);
		map2.put("phone", phone);
		map2.put("email", email);
		map2.put("address", address);
		
		return mapper.updateUser(map2);
	}

	
}
