package com.pcwk.ehr.service;

import java.sql.SQLException;

import com.pcwk.ehr.VO.MemberVO;

public interface MemberService {

	
    // 아이디 체크
	public int idCheck(MemberVO member) throws Exception;
	// 닉네임 체크
	public int nickNameCheck(MemberVO member) throws Exception;
	// 이메일 체크
	public int emailCheck(MemberVO member) throws SQLException;

	
	
	// 로그인시 아이디 체크
	public int loginIdCheck(MemberVO member) throws SQLException;
	// 로그인시 비번 체크
	public int passCheck(MemberVO member) throws SQLException;
	
	
	/**
	 * 로그인
	 * @param member
	 * @return 10 (id 없음), 20(비번오류), 30(성공)
	 * @throws SQLException
	 */
	public int login(MemberVO member) throws SQLException;
	
	
	
	/**
	 * 건수 조회
	 * @param member
	 * @return
	 * @throws SQLException
	 */
	public int getCount(MemberVO member) throws SQLException;
	
	/**
	 * 회원 상세 조회
	 * @param member
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public MemberVO get(MemberVO member) throws ClassNotFoundException, SQLException;
	
	/**
	 * 회원 정보 수정
	 * @param member
	 * @return
	 * @throws SQLException
	 */
	public int update(MemberVO member) throws SQLException;
	
	/**
	 * 회원 정보 삭제
	 * @param member
	 * @return
	 * @throws SQLException
	 */
	public int deleteOne(MemberVO member) throws SQLException;
	
	/**
	 * 신규 회원 등록
	 * @param inVO
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	public int add(MemberVO member) throws ClassNotFoundException, SQLException;

	
}
