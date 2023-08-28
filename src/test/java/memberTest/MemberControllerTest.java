package memberTest;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.Arrays;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.google.gson.Gson;
import com.pcwk.ehr.VO.MemberVO;
import com.pcwk.ehr.cmn.MessageVO;
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class) // 스프링 테스트 컨텍스 프레임워크의 JUnit확장 기능 지정
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" }) // 테스트 컨텍스트가 자동으로 만들어줄
																				// applicationContext 위치
@FixMethodOrder(MethodSorters.NAME_ASCENDING) // @Test 메소드를 오름차순으로 정렬한 순서대로 실행
public class MemberControllerTest {

	final Logger LOG = LogManager.getLogger(getClass());

	// Controller에서 추가
	@Autowired
	WebApplicationContext webApplicationContext;

	// 브라우저 대역(Mock)
	MockMvc mockMvc;

	// 텍스트 픽처스
	List<MemberVO> users;

	// 검색에 사용
	MemberVO search;

	@Before
	public void setUp() throws Exception {
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│setup                         │");
		LOG.debug("└──────────────────────────────┘");
		mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();

//		users = Arrays.asList(new MemberVO("k01", "1234", 1, "one", "test01@gmail.com", "k01", "날짜X", "날짜X")
//				, new MemberVO("k02", "1234", 1, "two", "test01@gmail.com", "k02", "날짜X", "날짜X")
//				, new MemberVO("k03", "1234", 1, "three", "test01@gmail.com", "k03", "날짜X", "날짜X")
//				, new MemberVO("k04", "1234", 1, "four", "test01@gmail.com", "k04", "날짜X", "날짜X")
//				, new MemberVO("k05", "1234", 1, "five", "test01@gmail.com", "k05", "날짜X", "날짜X"));

		search = new MemberVO();

	}

	@Test
	public void doLogin() throws Exception {
		// 1. 5건 삭제
		// 2. 1건 등록
		// 3. 로그인 시도

		// 1.
		deleteOne(users.get(0));
		deleteOne(users.get(1));
		deleteOne(users.get(2));
		deleteOne(users.get(3));
		deleteOne(users.get(4));

		// 2.
		add(users.get(0));

		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doLogin                       │");
		LOG.debug("└──────────────────────────────┘");

		MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.post("/member/doLogin.do")
				.param("memberId", users.get(0).getMemberId()).param("passwd", users.get(0).getPassword());

		ResultActions resultActions = this.mockMvc.perform(requestBuilder).andExpect(status().isOk());

		// Session
		MvcResult mvcResult = mockMvc.perform(requestBuilder).andReturn();
		MockHttpSession session = (MockHttpSession) mvcResult.getRequest().getSession();
		// session정보 추출
		MemberVO sessionValue = (MemberVO) session.getAttribute("user");

		assertNotNull(sessionValue);
		isSameData(users.get(0), sessionValue);

		String result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│result:" + result);
		LOG.debug("│sessionValue:" + sessionValue);
		LOG.debug("└──────────────────────────────┘");

	}

	/**
	 * 동일 데이터 비교
	 * 
	 * @param expectedUser
	 * @param actualUser
	 */
	public void isSameData(MemberVO expectedUser, MemberVO actualUser) {
		assertEquals(expectedUser.getMemberId(), actualUser.getMemberId());
		assertEquals(expectedUser.getMemberName(), actualUser.getMemberName());
		assertEquals(expectedUser.getPassword(), actualUser.getPassword());

		assertEquals(expectedUser.getMemberGrade(), actualUser.getMemberGrade());
		assertEquals(expectedUser.getEmail(), actualUser.getEmail());
		assertEquals(expectedUser.getNickName(), actualUser.getNickName());
	}

	public void add(MemberVO inVO) throws Exception {
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│add                           │");
		LOG.debug("└──────────────────────────────┘");

		MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.post("/user/add.do")
				.param("id", inVO.getMemberId()).param("name", inVO.getMemberName()).param("password", inVO.getPassword())
				.param("grade", inVO.getMemberGrade() + "").param("nickname", inVO.getNickName() + "")
				.param("email", inVO.getEmail());
		ResultActions resultActions = this.mockMvc.perform(requestBuilder).andExpect(status().isOk());

		String result = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();

		// 문자열 ->MessageVO
		MessageVO messageVO = new Gson().fromJson(result, MessageVO.class);
		assertEquals("1", messageVO.getMsgId());
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│messageVO:" + messageVO);
		LOG.debug("│responseResult:" + result);
		LOG.debug("└──────────────────────────────┘");

	}

	public void deleteOne(MemberVO inVO) throws Exception {
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│deleteOne                     │");
		LOG.debug("└──────────────────────────────┘");

		// url, param, 호출방식
		MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/member/memberDelete.do").param("memberId",
				inVO.getMemberId());

		// 대역 객체를 통해서 호출
		ResultActions resultActions = this.mockMvc.perform(requestBuilder).andExpect(status().is2xxSuccessful());

		// 요청 과 응담 로그
		String responseResult = resultActions.andDo(print()).andReturn().getResponse().getContentAsString();

		// 문자열 ->MessageVO
		MessageVO messageVO = new Gson().fromJson(responseResult, MessageVO.class);

		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│messageVO:" + messageVO);
		LOG.debug("│responseResult:" + responseResult);
		LOG.debug("└──────────────────────────────┘");

	}

	@Test
//	@Ignore
	public void beans() {
		LOG.debug("*************************");
		LOG.debug("*webApplicationContext*" + webApplicationContext);
		LOG.debug("*mockMvc*" + mockMvc);
		LOG.debug("*************************");

		assertNotNull(webApplicationContext);
		assertNotNull(mockMvc);
	}

}
