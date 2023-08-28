package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.VO.PostVO;

public interface MainService {
	
//	int doUpdateViews(PostVO inVO) throws SQLException;
	
//	PostVO doSelectOne(PostVO inVO) throws SQLException;E
	
	List<PostVO> doRetrieve(PostVO inVO) throws SQLException;
	


}
