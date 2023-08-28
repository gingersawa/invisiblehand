package com.pcwk.ehr.serviceImpl;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.VO.CommentVO;
import com.pcwk.ehr.dao.CommentDAO;
import com.pcwk.ehr.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService{
		
	@Autowired
	CommentDAO dao;
	@Override
	public List<CommentVO> doRetrieve(CommentVO commentVO) throws SQLException {

		return dao.doRetrieve(commentVO);
	}

	@Override
	public int doSave(CommentVO commentVO) throws SQLException {
		return dao.doSave(commentVO);
	}

	@Override
	public int doUpdate(CommentVO commentVO) throws SQLException {
		return dao.doUpdate(commentVO);
	}

	@Override
	public int doDelete(int commentNumber) throws SQLException {
		return dao.doDelete(commentNumber);
	}

	@Override
	public int doUpdateLikes(CommentVO commentVO) throws SQLException {
		return dao.doUpdateLikes(commentVO);
	}
	

}
