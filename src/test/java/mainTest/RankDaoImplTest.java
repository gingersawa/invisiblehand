/*
 * package mainTest;
 * 
 * import static org.junit.Assert.assertEquals; import static
 * org.junit.Assert.assertNotNull;
 * 
 * import java.sql.SQLException; import java.util.List;
 * 
 * import org.apache.logging.log4j.LogManager; import
 * org.apache.logging.log4j.Logger; import org.junit.Before; import
 * org.junit.FixMethodOrder; import org.junit.Test; import
 * org.junit.runner.RunWith; import org.junit.runners.MethodSorters; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.test.context.ContextConfiguration; import
 * org.springframework.test.context.junit4.SpringJUnit4ClassRunner; import
 * org.springframework.test.context.web.WebAppConfiguration;
 * 
 * import com.pcwk.ehr.VO.RankVO; import com.pcwk.ehr.daoImpl.RankDaoImpl;
 * 
 * @WebAppConfiguration
 * 
 * @RunWith(SpringJUnit4ClassRunner.class) // 스프링 테스트 컨텍스 프레임워크의 JUnit확장 기능 지정
 * 
 * @ContextConfiguration(locations = {
 * "file:src/main/webapp/WEB-INF/spring/root-context.xml",
 * "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" }) //
 * 테스트 컨텍스트가 자동으로 만들어줄 // applicationContext 위치
 * 
 * @FixMethodOrder(MethodSorters.NAME_ASCENDING) // @Test 메소드를 오름차순으로 정렬한 순서대로
 * 실행 public class RankDaoImplTest { final Logger LOG =
 * LogManager.getLogger(getClass());
 * 
 * @Autowired RankDaoImpl rankDaoImpl;
 * 
 * @Autowired RankVO inVO;
 * 
 * @Before public void setUp() throws Exception { // RankVO를 초기화하거나 설정 inVO =
 * new RankVO(); // 테스트할 업종 이름 설정 inVO.setName("건설업"); }
 * 
 * @Test public void getRankList() throws SQLException { List<RankVO>
 * rankingList = rankDaoImpl.doGetRanking(inVO); assertNotNull(rankingList);
 * 
 * LOG.debug("rankingList : " +rankingList); }
 * 
 * @Test public void updateScore() throws SQLException{ RankVO inVO = new
 * RankVO(); inVO.setName("건설업");
 * 
 * // 업종의 기존 스코어 가져오기 RankVO originalScore = (RankVO)
 * rankDaoImpl.doGetRanking(inVO);
 * LOG.debug("originalScore : "+originalScore.getScore());
 * 
 * // 업종의 스코어 +1 rankDaoImpl.doUpdateScore(inVO);
 * 
 * // 업데이트된 업종의 스코어 가져오기 RankVO updatedScore =
 * rankDaoImpl.doGetRanking(inVO).get(2);
 * LOG.debug("updatedScore : "+updatedScore); // 업종 스코어가 기존 스코어보다 1 증가했는지 확인
 * assertEquals(originalScore.getScore() + 1, updatedScore.getScore()); }
 * 
 * }
 */