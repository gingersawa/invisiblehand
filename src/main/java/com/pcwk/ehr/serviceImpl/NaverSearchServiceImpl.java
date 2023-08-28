package com.pcwk.ehr.serviceImpl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.service.NaverSearchService;

@Service
public class NaverSearchServiceImpl implements NaverSearchService {

//	final Logger LOG = LogManager.getLogger(getClass());
	final String BASE_URL = "https://openapi.naver.com/v1/search/news.json?query=";

	//Api 호출 ID와 Key 입력
	@Override
	public String doNaverSearch(String query) throws IOException {
		String clientId = "LBp2hbevqFw4lg6qAjQM";
		String clientSecret = "ogHH0uj_8h";

		String text = "";
		String apiURL = "";
		try {
			text = URLEncoder.encode(query, "UTF-8");
			apiURL = BASE_URL + text + "&display=5&start=1&sort=date"; // 여기서 query는 중소기업을 받을 매개변수 5개만

		} catch (Exception e) {
			e.printStackTrace();
			return "{\"error\":\"뉴스 데이터를 가져오지 못했습니다.\"}";
		}

		Map<String, String> requestHeaders = new HashedMap();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);

		String responseBody = get(apiURL, requestHeaders);
		
		return responseBody;
	}
	
	private static HttpURLConnection connect(String apiURL) {
		try {
			URL url = new URL(apiURL);
			HttpURLConnection urlCon = (HttpURLConnection) url.openConnection();

			return urlCon;
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//API URL에 접속하고 요청 헤더를 설정하여 API 호출을 수행
	private static String get(String apiURL, Map<String, String> requestHeaders) {

		HttpURLConnection httpURLConnection = connect(apiURL);
		StringBuilder responseBody = new StringBuilder();
		try {
			httpURLConnection.setRequestMethod("GET");

			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				System.out.println(header.getKey() + "," + header.getValue());
				httpURLConnection.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = httpURLConnection.getResponseCode();
			if (responseCode == httpURLConnection.HTTP_OK) {// 200번 상태 코드
				System.out.println("-접속 성공---" + httpURLConnection.HTTP_OK);
				InputStreamReader streamReader = new InputStreamReader(httpURLConnection.getInputStream());
				try (BufferedReader lineReader = new BufferedReader(streamReader)) {

					String line = "";// 한 줄 데이터 저장용
					while ((line = lineReader.readLine()) != null) {
						responseBody.append(line);
					}

					
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				System.out.println("-접속 실패---");
				responseBody.append("접속 실패:"+responseCode);
			}

		} catch (ProtocolException e) {
			 e.getMessage();
		} // get방식 접근
		catch (IOException e) {
			e.getMessage();
			e.printStackTrace();
		} finally {
			httpURLConnection.disconnect();
		}

		return responseBody.toString();
	}
	

}
