package com.pcwk.ehr.login;

import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.google.gson.Gson;
import com.pcwk.ehr.VO.MemberVO;
import com.pcwk.ehr.cmn.MessageVO;
import com.pcwk.ehr.service.MemberService;

@Controller("loginController")
@RequestMapping("login")
public class LoginController {

	final Logger LOG = LogManager.getLogger(getClass());

	@Autowired
	MemberService memberService;

	public LoginController() {
		LOG.debug("==================");
		LOG.debug("=LoginController()=");
		LOG.debug("==================");
	}
	
	@RequestMapping(value = "/emailCheck.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String emailCheck(MemberVO member) throws Exception {
		String jsonString = "";
		
		int flag = this.memberService.emailCheck(member);
		
		String message = "";

		if (1 == flag) {
			message = "중복된 이메일입니다.";
		} else {
			message = "사용 가능한 이메일입니다.";
		}
		
		MessageVO messageVO = new MessageVO(String.valueOf(flag), message);
		jsonString = new Gson().toJson(messageVO);
		
		return jsonString;
	}
	
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String idCheck(MemberVO member) throws Exception {
		String jsonString = "";
		
		int flag = this.memberService.idCheck(member);
		
		String message = "";

		if (1 == flag) {
			message = "중복된 아이디입니다.";
		} else {
			message = "사용 가능한 아이디입니다.";
		}
		
		MessageVO messageVO = new MessageVO(String.valueOf(flag), message);
		jsonString = new Gson().toJson(messageVO);
		
		return jsonString;
	}

	@RequestMapping(value = "/signUpView.do")
	public String signUpView() throws Exception {
		return "login/signUp";
	}

	@RequestMapping(value = "/signUp.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String signUp(MemberVO inVO) throws Exception {
		String jsonString = "";
		
		int flag = memberService.add(inVO);
	    
		String message = "";
	    
	    if (1 == flag) {
	        message = inVO.getMemberId() + "님의 가입을 환영합니다.";
	    } else {
	        message = "회원가입을 실패했습니다.";
	    }

	    MessageVO messageVO = new MessageVO(String.valueOf(flag), message);
	    jsonString = new Gson().toJson(messageVO);
	    return jsonString;
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		LOG.debug("=====================");
		LOG.debug("=logout()=");
		LOG.debug("=====================");
		
		if(null !=session.getAttribute("member")) {
			session.removeAttribute("member");
			session.invalidate();
			LOG.debug("=session.invalidate()=");

		}
		
		return "main/main";
	}

	@RequestMapping(value = "/loginView.do")
	public String loginView() {
		LOG.debug("==================");
		LOG.debug("=loginView()=");
		LOG.debug("==================");
//		prefix WEB-INF/views
//		suffix .jsp

//		--> /WEB-INF/views/login/login.jsp
//		/sw_hr14/src/main/webapp/WEB-INF/views/login/login.jsp
		return "login/login";
	}

	@RequestMapping(value = "/doLogin.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	@ResponseStatus(HttpStatus.OK)
	public Object doLogin(MemberVO member, HttpSession httpSession, HttpServletResponse response) throws SQLException, ClassNotFoundException {
	    LOG.debug("┌────────────────────────────┐");
	    LOG.debug("│  member: " + member);
	    MessageVO message = new MessageVO();

	    // 1. id 미입력
	    if (null == member.getMemberId() || "".equals(member.getMemberId())) {
	        message.setMsgId("1");
	        message.setMsgContents("아이디를 입력하세요.");
	        return message;
	    }
	    // 2. pw 미입력
	    if (null == member.getPassword() || "".equals(member.getPassword())) {
	        message.setMsgId("2");
	        message.setMsgContents("비밀번호를 입력하세요.");
	        return message;
	    }

	    // 10 : id 오류
	    // 20 : 비번 오류
	    // 30 : 성공
	    int status = memberService.login(member);

	    if (10 == status) {
	        message.setMsgId("10");
	        message.setMsgContents("아이디를 확인하세요.");
	        return message;
	    } else if (20 == status) {
	        message.setMsgId("20");
	        message.setMsgContents("비밀번호를 확인하세요.");
	        return message;
	    } else if (30 == status) {
	        message.setMsgId("30");
	        message.setMsgContents(member.getMemberId() + "님 로그인되었습니다.");

	        // 사용자 정보 조회: session 처리
	        MemberVO memberInfo = memberService.get(member);
	        if (null != memberInfo) {
	            // session 설정
	            httpSession.setAttribute("member", memberInfo);
	        } else {
	            message.setMsgId("99");
	            message.setMsgContents("알 수 없는 오류");
	            return message;
	        }

	        // 리다이렉트 처리
	        response.setHeader("Location", "/ehr/main/main.do");
	        response.setStatus(HttpServletResponse.SC_FOUND);
	        return message;
	    }

	    LOG.debug("└────────────────────────────┘");

	    return message;
	}

} // class end