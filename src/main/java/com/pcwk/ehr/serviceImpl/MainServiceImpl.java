package com.pcwk.ehr.serviceImpl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.VO.PostVO;
import com.pcwk.ehr.dao.MainDao;
import com.pcwk.ehr.service.MainService;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	MainDao mainDao;
	
	
	
	//리스트 조회 //조회수 상위 5개만
	@Override
	public List<PostVO> doRetrieve(PostVO inVO) throws SQLException {
		
		return mainDao.doRetrieve(inVO);
	}

	
	

}
