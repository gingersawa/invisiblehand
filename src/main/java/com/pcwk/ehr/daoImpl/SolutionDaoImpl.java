package com.pcwk.ehr.daoImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.VO.ChartVO;
import com.pcwk.ehr.dao.SolutionDao;


@Repository
public class SolutionDaoImpl implements SolutionDao {

	final String NAMESPACE = "com.pcwk.ehr.solution";
	final String DOT       = ".";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<ChartVO> SelectMaincategory(ChartVO inVO){
		return sqlSessionTemplate.selectList(NAMESPACE+DOT+"SelectMaincategory", inVO);
	}

	public List<ChartVO> SelectSubcategory(ChartVO inVO) {
		return sqlSessionTemplate.selectList(NAMESPACE+DOT+"SelectSubcategory", inVO);
	}


}
