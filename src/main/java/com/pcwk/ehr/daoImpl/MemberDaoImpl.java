package com.pcwk.ehr.daoImpl;

import java.sql.SQLException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.VO.MemberVO;
import com.pcwk.ehr.dao.MemberDao;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	final String NAMESPACE = "mapper.member.memberMapper";
	final String DOT = ".";

	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate; // DB 연결객체
	
	final static Logger LOG = LogManager.getLogger(MemberDaoImpl.class);
	
	//private DataSource dataSource;

	// *****Default 생성자 필수*****
    private final SqlSessionTemplate sql;
	public MemberDaoImpl(SqlSessionTemplate sql) {
		this.sql = sql;
	}

	// 회원가입관련
	// id 체크
	@Override
	public int idCheck(MemberVO member) {
		String statement = NAMESPACE + DOT + "idCheck";
		LOG.debug("----------------------------------------");
		LOG.debug("1. statement = " + statement);
		LOG.debug("----------------------------------------");
		LOG.debug("2. param =\n" + member.toString());
		
		int result = sqlSessionTemplate.selectOne(statement, member);
		LOG.debug("3. result =" + result);
		return result;
	}
	
	// 회원가입관련
	// 닉네임체크
	@Override
	public int nickNameCheck(MemberVO member) {
		String statement = NAMESPACE + DOT + "nickNameCheck";
		LOG.debug("----------------------------------------");
		LOG.debug("1. statement = " + statement);
		LOG.debug("----------------------------------------");
		LOG.debug("2. param =\n" + member.toString());
		
		int result = sqlSessionTemplate.selectOne(statement, member);
		LOG.debug("3. result =" + result);
		return result;
	}
	
	
	// 회원가입관련
    // 이메일 체크
	@Override
	public int emailCheck(MemberVO member) throws SQLException{
		String statement = NAMESPACE + DOT + "emailCheck";
		LOG.debug("----------------------------------------");
		LOG.debug("1. statement = " + statement);
		LOG.debug("----------------------------------------");
		LOG.debug("2. param =\n" + member.toString());
		int result = sqlSessionTemplate.selectOne(statement, member);
		LOG.debug("3. result =" + result);
		return result;
	}
//--------------------------------------------------------------
	
	
	
	// 로그인관련
	// 아이디 체크
	@Override
	public int loginIdCheck(MemberVO member) throws SQLException {
		int flag = 0;

		String statement = NAMESPACE + DOT + "loginIdCheck";
		LOG.debug("----------------------------------------");
		LOG.debug("1. statement = " + statement);
		LOG.debug("----------------------------------------");
		LOG.debug("2. param =\n" + member.toString());

		flag = sqlSessionTemplate.selectOne(statement, member);
		
		LOG.debug("3. flag = " + flag);

		return flag;
	}
	
	
	// 로그인관련
	// 비번 체크
	@Override
	public int passCheck(MemberVO member) throws SQLException {
		int cnt = 0;
		
		String statement = NAMESPACE + DOT + "passCheck";
		LOG.debug("----------------------------------------");
		LOG.debug("1. statement = " + statement);
		LOG.debug("----------------------------------------");
		LOG.debug("2. param =\n" + member.toString());

		cnt = sqlSessionTemplate.selectOne(statement, member);
		LOG.debug("3. cnt = " + cnt);

		return cnt;
	}
	
	


	// 회원 가입
	@Override
	public int add(final MemberVO member) throws SQLException {
		int flag = 0;  // 등록 건수
		
		String statement = this.NAMESPACE + DOT + "add";
		
		LOG.debug("------------------------------");
		LOG.debug("1. statement = " + statement);
		LOG.debug("------------------------------");
		LOG.debug("2. param =\n" + member.toString());
		LOG.debug("------------------------------");
		
		flag = this.sqlSessionTemplate.insert(statement, member);
		LOG.debug("3. flag = " + flag);

		return flag;
	}


	
	

	@Override
	public int getCount(MemberVO member) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberVO get(MemberVO member) throws ClassNotFoundException, SQLException {
		MemberVO outVO = null;
		
        String statement = this.NAMESPACE+DOT+"get";
		LOG.debug("----------------------------");
		LOG.debug("1. statement-"+statement);
		LOG.debug("----------------------------");
		LOG.debug("2. param=\n"+member.toString());
		
		outVO = this.sqlSessionTemplate.selectOne(statement,member);
		LOG.debug("3.outVO:"+outVO);
		
	
		return outVO;
	}

	@Override
	public int update(MemberVO member) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteOne(MemberVO member) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}




} // class end
