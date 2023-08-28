package com.pcwk.ehr.service;

import java.util.List;

import com.pcwk.ehr.VO.ChartVO;

public interface ChartService {
	
	public List<ChartVO> chartGraph(ChartVO inVO);

}
