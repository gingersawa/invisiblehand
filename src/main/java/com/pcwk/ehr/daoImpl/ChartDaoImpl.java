package com.pcwk.ehr.daoImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.VO.ChartVO;
import com.pcwk.ehr.dao.ChartDao;


@Repository
public class ChartDaoImpl implements ChartDao {
	
	final String NAMESPACE = "com.pcwk.ehr.chart";
	final String DOT       = ".";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	//(변수 1개일때 maincategory)
	public List<ChartVO> chartGraphAvg(ChartVO inVO){
		return sqlSessionTemplate.selectList(NAMESPACE+DOT+"chartGraphAvg", inVO);
	}
	
	
	//차트 데이터 조회 (변수 2개일때 maincategory, subcategory)
	public List<ChartVO> chartGraph(ChartVO inVO) {
		
	
		return sqlSessionTemplate.selectList(NAMESPACE+DOT+"chartGraph", inVO);
	}

}
