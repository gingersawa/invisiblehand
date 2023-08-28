package com.pcwk.ehr.daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.VO.RankVO;
import com.pcwk.ehr.dao.RankDao;


@Repository
public class RankDaoImpl implements RankDao{
	final Logger log = LogManager.getLogger(getClass());

	final String NAMESPACE = "com.pcwk.ehr.main";
	final String DOT = ".";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
		
	//1. 랭킹 정보 main 화면에 출력할 로직
	@Override
	public List<RankVO> doGetRanking(RankVO inVO) throws SQLException {
				
		return sqlSessionTemplate.selectList(NAMESPACE+DOT+"doGetRanking", inVO);
	}
	
	//2. 현재 스코어에 따른 등수 업데이트
	@Override
	public int doUpdatePrevious(RankVO inVO) throws SQLException {
		
		return sqlSessionTemplate.update(NAMESPACE+DOT+"doUpdatePrevious", inVO);
	}
	
	//3. 저번달 등수를 이전 등수 컬럼에 복사
	@Override
	public int doUpdateCurrent(RankVO inVO) throws SQLException {
		
		return sqlSessionTemplate.update(NAMESPACE+DOT+"doUpdateCurrent", inVO);
	}
	
	//4. 특정 행동에 따른 Score에 +1 하는 로직  
	@Override
	public int doUpdateScore(RankVO inVO) throws SQLException {
		
		return sqlSessionTemplate.update(NAMESPACE+DOT+"doUpdateScore", inVO);		
	}

	

}
