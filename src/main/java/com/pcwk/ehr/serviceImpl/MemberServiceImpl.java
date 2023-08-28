package com.pcwk.ehr.serviceImpl;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.VO.MemberVO;
import com.pcwk.ehr.dao.MemberDao;
import com.pcwk.ehr.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	final Logger LOG = LogManager.getLogger(getClass());
	
	@Resource(name = "dummyMailSender")
	//@Resource(name = "mailSenderImpl")
	private MailSender mailSender; // mail
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	public MemberServiceImpl() {
		
	}


	//아이디 중복체크
	@Override
	public int idCheck(MemberVO member) throws Exception {
		int result = memberDao.idCheck(member);
		return result;
	}

	//닉네임 중복체크
	@Override
	public int nickNameCheck(MemberVO member) throws Exception {
		int result = memberDao.nickNameCheck(member);
		return result;
	}
	
	//이메일 중복체크
	@Override
	public int emailCheck(MemberVO member) throws SQLException {

		return memberDao.emailCheck(member);
	}
	

	
	//로그인시 아이디 체크
	@Override
	public int loginIdCheck(MemberVO member) throws SQLException {

		return memberDao.loginIdCheck(member);
	}
	
	//로그인시 비밀번호
	@Override
	public int passCheck(MemberVO member) throws SQLException {

		return memberDao.passCheck(member);
	}
    
    
	// 이메일 전송
	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	
	
	// 회원 가입
	@Override
	public int add(MemberVO member) throws ClassNotFoundException, SQLException {
		return memberDao.add(member);
	}
	
	// 조회수
	@Override
	public int getCount(MemberVO member) throws SQLException {
		return memberDao.getCount(member);
	}

	// 조회
	@Override
	public MemberVO get(MemberVO member) throws ClassNotFoundException, SQLException {
		return memberDao.get(member);
	}
	
	// 유저 정보 변경
	@Override
	public int update(MemberVO member) throws SQLException {
		return memberDao.update(member);
	}
	
	// 유저 탈퇴
	@Override
	public int deleteOne(MemberVO member) throws SQLException {
		return memberDao.deleteOne(member);
	}

	// 로그인
	@Override
	public int login(MemberVO member) throws SQLException {
		// 1. 아이디 Check
		// 2. 비번 Check
		
		int checkStatus = 0; // 10(id 없음), 20(비번오류), 30(성공)
		
		int status = this.memberDao.loginIdCheck(member);
		
		if(1==status) {
			status = memberDao.passCheck(member);

			if(1==status) {
				checkStatus = 30; // 로그인 성공
				LOG.debug(checkStatus);
			}else {
				checkStatus = 20; // 비번 오류, id 있음
				LOG.debug(checkStatus);
			}
			
		}else {
			checkStatus = 10; // id 없음
			LOG.debug(checkStatus);
		}

		LOG.debug("==================");
		LOG.debug("=doLogin()=" + checkStatus);
		LOG.debug("==================");
		return checkStatus;
	}
	


	
} // class end
