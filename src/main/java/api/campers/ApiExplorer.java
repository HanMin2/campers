package api.campers;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.campers.campsite.model.vo.Campsite;

public class ApiExplorer {
	
	public List<Campsite> campsiteData() throws IOException {
		int pageNum = 1;
		List<Campsite> array = new ArrayList<Campsite>();

		while(true) {
			StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=BekpijTCJs4E%2FEOSRUeGv3FHnCU3ufa5WYGNE2k06Pd45CAb1fSaxIERXNc0QisW3Rega%2BpRJWtWaIvyd34p0w%3D%3D"); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(Integer.toString(pageNum), "UTF-8")); /*현재 페이지번호*/
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과 수*/
			urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰),AND(안드로이드),WIN(윈도우폰),ETC*/
			urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = null;
			try {
				db = dbf.newDocumentBuilder();
			} catch (ParserConfigurationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(db  == null) {
				break;
			}
			
			Document document = null;
			try {
				document = db.parse(url.toString());
			} catch (SAXException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			document.getDocumentElement().normalize();
			System.out.println("Root Element :" + document.getDocumentElement().getNodeName());
			NodeList nList = document.getElementsByTagName("item");
			if(nList.getLength() == 0) {
				break;
			}
			System.out.println("파싱할 campsite 수 : " + nList.getLength());

			System.out.println("----------------------------");
			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);

				System.out.println("\nCurrent Element :" + nNode.getNodeName());
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {

					Element eElement = (Element) nNode;
					System.out.println(eElement.toString());
					

					String campsite_index = (String) nullCheck(eElement, "contentId");            // 야영장인덱스
					String campsite_name = (String) nullCheck(eElement, "facltNm");            // 야영장명
					String line_intro = (String) nullCheck(eElement, "lineIntro");    // 한줄소개
					String allar = (String) nullCheck(eElement, "allar");            // 전체면적
					String insurance = (String) nullCheck(eElement, "insrncAt");            // 영업배상책임보험 가입여부
					String business_no = (String) nullCheck(eElement, "bizrno");            // 사업자번호
					String induty = (String) nullCheck(eElement, "induty");            // 업종
					String lct_cl = (String) nullCheck(eElement, "lctCl");            // 입지구분
					String do_name = (String) nullCheck(eElement, "doNm");            // 도명
					String sigungu_name = (String) nullCheck(eElement, "sigunguNm");            // 시군구명
					String zipcode = (String) nullCheck(eElement, "zipcode");            // 우편번호
					String addr1  = (String) nullCheck(eElement, "addr1");        // 주소
					String addr2  = (String) nullCheck(eElement, "addr2");        // 주소상세
					String map_x  = (String) nullCheck(eElement, "mapX");        // 경도
					String map_y  = (String) nullCheck(eElement, "mapY");        // 위도
					String direction = (String) nullCheck(eElement, "direction");        // 오시는 길
					String tel = (String) nullCheck(eElement, "tel");        // 전화
					String homepage = (String) nullCheck(eElement, "homepage");        // 홈페이지
					String manager = (String) nullCheck(eElement, "manageNmpr");        // 상주관리인원
					String gnrlsite = (String) nullCheck(eElement, "gnrlSiteCo");        // 주요시설 일반아영쟝
					String autosite = (String) nullCheck(eElement, "autoSiteCo");        // 주요시설 자동차아영쟝
					String glampsite = (String) nullCheck(eElement, "glampSiteCo");        // 주요시설 글램핑
					String caravsite = (String) nullCheck(eElement, "caravSiteCo");        // 주요시설 카라반
					String indivi_caravsite = (String) nullCheck(eElement, "indvdlCaravSiteCo");        // 주요시설 개인카라반
					String oper_pd = (String) nullCheck(eElement, "operPdCl");        // 운영기간
					String oper_de = (String) nullCheck(eElement, "operDeCl");        // 운영일
					String toilet = (String) nullCheck(eElement, "toiletCo");        // 화장실 개수
					String shower = (String) nullCheck(eElement, "swrmCo");        // 샤워실 개수
					String sink = (String) nullCheck(eElement, "wtrplCo");        // 개수대 개수
					String brazier = (String) nullCheck(eElement, "brazierCl");        // 화로대
					String sbrs = (String) nullCheck(eElement, "sbrsCl");        // 부대시설
					String exprn_progrm_at = (String) nullCheck(eElement, "exprnProgrmAt");        // 체험프로그램 여부
					String exprn_progrm = (String) nullCheck(eElement, "exprnProgrm");        // 체험프로그램명
					String extshr = (String) nullCheck(eElement, "extshrCo");        // 소화기 개수
					String firewater = (String) nullCheck(eElement, "frprvtWrppCo");        // 방화수 개수
					String firesand = (String) nullCheck(eElement, "frprvtSandCo");        // 방화사 개수
					String firesensor = (String) nullCheck(eElement, "fireSensorCo");        // 화재감지기 개수
					String thema = (String) nullCheck(eElement, "themaEnvrnCl");        // 테마환경
					String eqpmn_lend = (String) nullCheck(eElement, "eqpmnLendCl");        // 캠핑장비대여
					String animal = (String) nullCheck(eElement, "animalCmgCl");        // 애완동물출입
					String tour_era = (String) nullCheck(eElement, "tourEraCl");        // 여행시기
					String first_image = (String) nullCheck(eElement, "firstImageUrl");        // 대표이미지
					String create_time = (String) nullCheck(eElement, "createdtime");        // 등록일
					
					String rename_image = null;
					String id = null;
					String password = null;
					
					Random ran = new Random();
					int num = (ran.nextInt(361) + 40)*1000;
					String cost = Integer.toString(num);
					
					System.out.println("캠핑장 이름 : " + campsite_name);

					
					array.add(new Campsite(campsite_index, campsite_name, line_intro, allar, insurance, business_no, induty, lct_cl, do_name, sigungu_name, zipcode, addr1, addr2, map_x, map_y, direction, tel, homepage, manager, gnrlsite, autosite, glampsite, caravsite, indivi_caravsite, oper_pd, oper_de, toilet, shower, sink, brazier, sbrs, exprn_progrm_at, exprn_progrm, extshr, firewater, firesand, firesensor, thema, eqpmn_lend, animal, tour_era, first_image, rename_image, create_time, cost, id, password));

					try {
						Thread.sleep(10);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					System.out.println(array.size());
				}
				
			}
			pageNum++;
		}
		
		return array;

	}
	public static String nullCheck(Element eElement, String tagName) {
		try {
			if (eElement.getTagName().contains(tagName) == false) {
				return eElement.getElementsByTagName(tagName).item(0).getTextContent();
			}
		} catch (Exception e) {
			//			e.printStackTrace();
		}
		return "-";
	}
	
}
