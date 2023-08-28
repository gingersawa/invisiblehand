package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.VO.CmnCodeVO;

public interface CmnCodeDAO {
	
	/**
	 * 등록
	 * @param inVO 
	 * @return 
	 * @throws SQLException
	 */
	public abstract int doSave(CmnCodeVO inVO)throws SQLException;
	
	/**
	 * 삭제
	 * @param inVO
	 * @return 
	 * @throws SQLException
	 */
	int doDelete(CmnCodeVO inVO)throws SQLException;
	
	/**
	 * 수정
	 * @param inVO
	 * @return 
	 * @throws SQLException
	 */
	int doUpdate(CmnCodeVO inVO)throws SQLException;
	
	/**
	 * 단건 조회
	 * @param inVO
	 * @return 
	 * @throws SQLException
	 */
	CmnCodeVO doSelectOne(CmnCodeVO inVO)throws SQLException;
	
	
	
	/**
	 * 목록조회
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	List<CmnCodeVO> doSearch(CmnCodeVO inVO)throws SQLException;
	
}
