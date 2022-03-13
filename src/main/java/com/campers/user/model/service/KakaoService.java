package com.campers.user.model.service;

import java.util.HashMap;

public interface KakaoService {
	
	String getAccessToken (String authorize_code);
	
	HashMap<String, Object> getUserInfo (String access_Token);

	
}
