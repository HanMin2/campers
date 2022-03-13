package com.campers.user.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.campers.user.model.service.KakaoService;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 * @param <SessionConfigVO>
 * 
 */
@Slf4j
@Controller
public class KakaoController {
	
	@Autowired
	private KakaoService service;

	// 카카오 
	@RequestMapping(value = "/user/kakaoPage", method = RequestMethod.GET)
	public String kakaoPage() {

		String reqUrl = 
				"https://kauth.kakao.com/oauth/authorize"
						+ "?client_id=b8297ee47f4efcf3d66c179430dae7d5"
						+ "&redirect_uri=http://localhost/mvc/user/kakao"
						+ "&response_type=code";

		return "redirect:" + reqUrl;
	}
	

	@RequestMapping(value = "/user/kakao", method = RequestMethod.GET)
	public String kakao(
			@RequestParam(value = "code", required = false) String code, 
			Model model) throws Exception {

			System.out.println("#########" + code);
	        String access_Token = service.getAccessToken(code);
	        HashMap<String, Object> userInfo = service.getUserInfo(access_Token);
	        
	        System.out.println("###access_Token#### : " + access_Token);
	        System.out.println("###userInfo#### : " + userInfo.get("email"));
	        System.out.println("###nickname#### : " + userInfo.get("nickname"));
	        System.out.println("###profile_image#### : " + userInfo.get("profile_image"));
        
		return "/home"; 
	}
}

