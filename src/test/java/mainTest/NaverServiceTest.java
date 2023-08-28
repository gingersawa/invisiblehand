package mainTest;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.HttpURLConnection;

import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.pcwk.ehr.serviceImpl.NaverSearchServiceImpl;

@WebAppConfiguration 
@RunWith(SpringJUnit4ClassRunner.class) // 스프링 테스트 컨텍스 프레임워크의 JUnit확장 기능 지정
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" }) // 테스트 컨텍스트가 자동으로 만들어줄
																				// applicationContext 위치
@FixMethodOrder(MethodSorters.NAME_ASCENDING) // @Test 메소드를 오름차순으로 정렬한 순서대로 실행ㄴ
public class NaverServiceTest {


    private NaverSearchServiceImpl naverSearchService;
    private HttpURLConnection httpURLConnection;

    @Before
    public void setUp() {
        naverSearchService = new NaverSearchServiceImpl();
        httpURLConnection = mock(HttpURLConnection.class);
    }

    @Test
    public void testDoNaverSearch_Success() throws IOException {
        String query = "중소기업";
        String response = naverSearchService.doNaverSearch("중소기업");
        System.out.println(response);
        // HttpURLConnection Mock 객체에 대한 설정
        when(httpURLConnection.getResponseCode()).thenReturn(HttpURLConnection.HTTP_OK);
        when(httpURLConnection.getInputStream()).thenReturn(new ByteArrayInputStream(response.getBytes()));
             
        // 테스트 대상 메서드 호출
        String result = naverSearchService.doNaverSearch(query);
        System.out.println("result"+result);
        
        // 예상한 응답과 결과가 일치하는지 검증
        assertEquals(response, result);
    }

}
