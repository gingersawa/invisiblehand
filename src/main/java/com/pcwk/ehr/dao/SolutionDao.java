package com.pcwk.ehr.dao;

import java.util.List;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.VO.ChartVO;

@Repository
public interface SolutionDao {
	public List<ChartVO> SelectMaincategory(ChartVO inVO);
	
	public List<ChartVO> SelectSubcategory(ChartVO inVO);

}
