package com.pcwk.ehr.serviceImpl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.VO.ChartVO;
import com.pcwk.ehr.dao.ChartDao;
import com.pcwk.ehr.service.ChartService;


@Service
public class ChartServiceImpl implements ChartService {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	ChartDao chartDao;

	@Override
	public List<ChartVO> chartGraph(ChartVO inVO) {
		List<ChartVO> chartdata = null;	
		if(inVO.getMaincategory() != null){
			if(inVO.getSubcategory() != null && !inVO.getSubcategory().equals("-")) {
				LOG.debug(inVO.getSubcategory()+"에 들어있는 SBHI 값이 출력됩니다.");
				chartdata = chartDao.chartGraph(inVO);
			}else if(inVO.getSubcategory() != null && inVO.getSubcategory().equals("-")) {
				LOG.debug(inVO.getMaincategory()+"가 동일한 값들의 평균 SBHI 값이 출력됩니다.");
				chartdata = chartDao.chartGraphAvg(inVO);
			}else {
				LOG.debug("subCategory가 값이 없습니다.");
			}
		}else {
			LOG.debug("mainCategory가 값이 없습니다.");
		}
			
		return chartdata;
	}

}
