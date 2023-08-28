package com.pcwk.ehr.service;

import java.util.List;

import com.pcwk.ehr.VO.ChartVO;

public interface SolutionService {
	
	public List<ChartVO> SelectMaincategory(ChartVO inVO);

	public List<ChartVO> SelectSubcategory(ChartVO inVO);
}
