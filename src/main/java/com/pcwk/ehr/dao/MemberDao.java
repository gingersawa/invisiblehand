package com.pcwk.ehr.dao;

import java.sql.SQLException;

import com.pcwk.ehr.VO.MemberVO;

public interface MemberDao {
	// 아이디 체크
	public int idCheck(MemberVO member) throws SQLException;	
	// 닉네임 체크
	public int nickNameCheck(MemberVO member) throws SQLException;
	// 이메일 체크
	public int emailCheck(MemberVO member) throws SQLException;


	
	//로그인에 필요
	
	/**
	 * 로그인 아이디 체크
	 * @param member
	 * @return 1 (있음) / 0(없음)
	 * @throws SQLException
	 */
	// 로그인 아이디 체크
	public int loginIdCheck(MemberVO member) throws SQLException;
	
	
	/**
	 * 로그인 비밀번호 체크
	 * @param member
	 * @return 1(비밀번호 있음) / 0(비밀번호 없음)
	 * @throws SQLException
	 */
	// 비번 체크
	public int passCheck(MemberVO member) throws SQLException;
	
    

	// 건수 조회
	int getCount(MemberVO member) throws SQLException;

	// 회원정보 조회
	MemberVO get(MemberVO member) throws ClassNotFoundException, SQLException;

	// 회원정보 수정
	int update(MemberVO member) throws SQLException;

	// 회원탈퇴
	int deleteOne(MemberVO member) throws SQLException;

	// 회원가입
	int add(MemberVO member) throws ClassNotFoundException, SQLException;




}
