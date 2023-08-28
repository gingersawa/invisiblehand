package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.pcwk.ehr.VO.RankVO;

public interface RankService {
	
	//1. 랭킹 정보 main 화면에 출력할 로직
	List<RankVO> doGetRanking(RankVO inVO) throws SQLException;
	
	
	//4. 특정 행동에 따른 Score에 +1 하는 로직  
	int doUpdateScore(RankVO inVO) throws SQLException;
	
}
