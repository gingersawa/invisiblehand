package com.pcwk.ehr.daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.VO.CmnCodeVO;
import com.pcwk.ehr.cmn.PcwkLoger;
import com.pcwk.ehr.dao.CmnCodeDAO;

@Repository
public class CmnCodeDAOImpl implements CmnCodeDAO, PcwkLoger{
	final String NAMESPACE = "com.pcwk.ehr";
	final String DOT       = ".";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

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
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doRetrieve                    │");
		LOG.debug("│inVO                          │"+inVO);
		LOG.debug("│statement                     │"+NAMESPACE+DOT+"doSearch");
		LOG.debug("└──────────────────────────────┘");	
		
		//com.pcwk.ehr.doSearch
		return sqlSessionTemplate.selectList(NAMESPACE+DOT+"doSearch", inVO);
	} 
	
	
}
