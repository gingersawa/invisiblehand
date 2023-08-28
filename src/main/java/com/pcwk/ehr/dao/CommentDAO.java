package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.VO.CommentVO;

public interface CommentDAO {
	
	//댓글 목록 조회
	public List<CommentVO> doRetrieve(CommentVO commentVO) throws SQLException;
	
	//댓글 등록
	public int doSave(CommentVO commentVO)throws SQLException;
	
	//댓글 수정
	public int doUpdate(CommentVO commentVO)throws SQLException;

	//댓글 삭제
	public int doDelete(int commentNumber) throws SQLException;
	
	//댓글 좋아요
	public int doUpdateLikes(CommentVO commentVO) throws SQLException;

}
