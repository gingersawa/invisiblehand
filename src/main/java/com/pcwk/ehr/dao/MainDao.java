package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.VO.PostVO;
import com.pcwk.ehr.VO.RankVO;

public interface MainDao {

//	int doUpdateViews(PostVO inVO) throws SQLException;
	
//	PostVO doSelectOne(PostVO inVO) throws SQLException;
	
	public List<PostVO> doRetrieve(PostVO inVO) throws SQLException;
		


}
