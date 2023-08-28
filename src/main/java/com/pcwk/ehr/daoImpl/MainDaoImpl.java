package com.pcwk.ehr.daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.VO.PostVO;
import com.pcwk.ehr.VO.RankVO;
import com.pcwk.ehr.dao.MainDao;

@Repository
public class MainDaoImpl implements MainDao {
	
	final Logger log = LogManager.getLogger(getClass());

	final String NAMESPACE = "com.pcwk.ehr.main";
	final String DOT = ".";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
		

	//리스트 조회
	@Override
	public List<PostVO> doRetrieve(PostVO inVO) throws SQLException {
		
		return sqlSessionTemplate.selectList(NAMESPACE + DOT + "doRetrieve", inVO);
	}
	
	

	

	
	
}

