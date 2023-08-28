package mainTest;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.pcwk.ehr.VO.PostVO;
import com.pcwk.ehr.daoImpl.MainDaoImpl;

@WebAppConfiguration 
@RunWith(SpringJUnit4ClassRunner.class) // 스프링 테스트 컨텍스 프레임워크의 JUnit확장 기능 지정
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" }) // 테스트 컨텍스트가 자동으로 만들어줄
																				// applicationContext 위치
@FixMethodOrder(MethodSorters.NAME_ASCENDING) // @Test 메소드를 오름차순으로 정렬한 순서대로 실행
public class MainDaoImplTest {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
    MainDaoImpl mainDaoImpl; 
	
	@Autowired
	PostVO inVO;

    @Before
    public void setUp() {
    	

    }

    @Test
    public void doRetrievePosts() throws SQLException {
    	
        inVO.setCategoryNumber("10");  // 테스트에 사용할 카테고리 번호
        inVO.setPageSize(5);
        inVO.setPageNo(1);
        List<PostVO> getPosts = mainDaoImpl.doRetrieve(inVO);
        assertNotNull(getPosts);
  
        
        PostVO getTopLikePost = getPosts.get(0);
        assertEquals("테스트를 위한 글04", getTopLikePost.getTitle());
        assertEquals("2023/08/02", getTopLikePost.getWrittenDate());
        assertEquals("관리자", getTopLikePost.getNickname());
        LOG.debug("getTopLikePost : "+getTopLikePost.getLikes());
    }
}
