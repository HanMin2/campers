package com.campers.user.model.service;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campers.user.model.mapper.UserMapper;
import com.campers.user.model.vo.User;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


@Service 
public class KakaoServiceImpl implements KakaoService {

	//토큰발급
	public String getAccessToken (String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			//  URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			//	POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=b8297ee47f4efcf3d66c179430dae7d5");
			sb.append("&redirect_uri=http://localhost/mvc/user/kakao"); 
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			//  결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			//  요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			//  Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return access_Token;
	}

	//유저정보조회
	public HashMap<String, Object> getUserInfo (String access_Token) {

		//    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			//    요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			System.out.println("element : " + element);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			System.out.println("#### kakao_account : " + kakao_account);

			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String profile_image = properties.getAsJsonObject().get("profile_image").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();

			System.out.println("#### email : " + email);
			
			userInfo.put("accessToken", access_Token);
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
			userInfo.put("profile_image", profile_image);


		} catch (IOException e) {
			e.printStackTrace();
		}

		return userInfo;
	}

}
