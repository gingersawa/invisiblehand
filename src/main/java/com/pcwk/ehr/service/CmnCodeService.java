package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.VO.CmnCodeVO;

public interface CmnCodeService {

	public abstract int doSave(CmnCodeVO inVO)throws SQLException;
	

	int doDelete(CmnCodeVO inVO)throws SQLException;


	int doUpdate(CmnCodeVO inVO)throws SQLException;
	

	CmnCodeVO doSelectOne(CmnCodeVO inVO)throws SQLException;
	

	List<CmnCodeVO> doSearch(CmnCodeVO inVO)throws SQLException;
	
	
}
