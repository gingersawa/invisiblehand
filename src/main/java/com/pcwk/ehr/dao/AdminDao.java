package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.VO.MemberVO;
import com.pcwk.ehr.VO.PostVO;

public interface AdminDao {
	// 회원정보 조회
	List<MemberVO> getAllMemberDao();
	

}
