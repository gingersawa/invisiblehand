package com.pcwk.ehr.serviceImpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.VO.PostVO;
import com.pcwk.ehr.cmn.PcwkLoger;
import com.pcwk.ehr.dao.PostDao;
import com.pcwk.ehr.service.PostService;

@Service
public class PostServiceImpl implements PostService, PcwkLoger {

	@Autowired
	PostDao dao;

	@Override
	public int doSave(PostVO inVO) throws SQLException {
		return dao.doSave(inVO);
	}

	@Override
	public int doDelete(PostVO inVO) throws SQLException {
		return dao.doDelete(inVO);
	}

	@Override
	public int doUpdate(PostVO inVO) throws SQLException {
		return dao.doUpdate(inVO);
	}

	@Override
	public PostVO doSelectOne(PostVO inVO) throws SQLException {
		//1. 단건조회
		//2. 조회 count 증가
		PostVO vo = dao.doSelectOne(inVO);
		
		if(null != vo) {
			dao.doUpdateViews(vo);
		}
		return vo;

	}

	@Override
	public List<PostVO> doRetrieve(PostVO inVO) throws SQLException {
		return dao.doRetrieve(inVO);
	}

	@Override
	public int doUpdateLikes(PostVO inVO) throws SQLException {
		return dao.doUpdateLikes(inVO);
	}

	@Override
	public int doUpdateViews(PostVO inVO) throws SQLException {
		return dao.doUpdateLikes(inVO);
	}
	
	

}
