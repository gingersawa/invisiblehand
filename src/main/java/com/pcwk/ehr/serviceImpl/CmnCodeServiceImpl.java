package com.pcwk.ehr.serviceImpl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.VO.CmnCodeVO;
import com.pcwk.ehr.cmn.PcwkLoger;
import com.pcwk.ehr.dao.CmnCodeDAO;
import com.pcwk.ehr.service.CmnCodeService;

@Service
public class CmnCodeServiceImpl implements CmnCodeService, PcwkLoger{
	
	@Autowired
	CmnCodeDAO commonCodeDAO;

	@Override
	public int doSave(CmnCodeVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int doDelete(CmnCodeVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int doUpdate(CmnCodeVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CmnCodeVO doSelectOne(CmnCodeVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CmnCodeVO> doSearch(CmnCodeVO inVO) throws SQLException {
		return commonCodeDAO.doSearch(inVO);
	}
	
	
	

}
