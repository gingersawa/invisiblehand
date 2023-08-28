package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.pcwk.ehr.VO.RankVO;

public interface RankDao {
	
	//1. 랭킹 정보 main 화면에 출력할 로직
	List<RankVO> doGetRanking(RankVO inVO) throws SQLException;
	
	//2. 현재 스코어에 따른 등수 업데이트
	int doUpdatePrevious(RankVO inVO) throws SQLException;
	
	//3. 저번달 등수를 이전 등수 컬럼에 복사
	int doUpdateCurrent(RankVO inVO) throws SQLException;
		
	//4. 특정 행동에 따른 Score에 +1 하는 로직  
	int doUpdateScore(RankVO inVO) throws SQLException;
}
