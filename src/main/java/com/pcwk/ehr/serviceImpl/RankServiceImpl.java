package com.pcwk.ehr.serviceImpl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pcwk.ehr.VO.RankVO;
import com.pcwk.ehr.dao.RankDao;
import com.pcwk.ehr.service.RankService;

@Service
public class RankServiceImpl implements RankService {
	
	@Autowired
	RankDao rankDao;
	
	//1. 랭킹 정보 main 화면에 출력할 로직
	@Override
	public List<RankVO> doGetRanking(RankVO inVO) throws SQLException{
		

		return rankDao.doGetRanking(inVO);
	}
	
//	@Scheduled(cron = "0 * * * * *") //1분마다
    @Scheduled(cron = "0 0 0 1 * ?")
	public void updateRanking() throws SQLException {
    	RankVO inVO = new RankVO();
    	
		rankDao.doUpdatePrevious(inVO);
		
		rankDao.doUpdateCurrent(inVO);
		
	}

    //4. 특정 행동에 따른 Score에 +1 하는 로직  
	@Override
	public int doUpdateScore(RankVO inVO) throws SQLException {

		return rankDao.doUpdateScore(inVO);
	}
	
	
	
}
