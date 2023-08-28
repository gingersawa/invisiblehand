package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.VO.CommentVO;

public interface CommentService {
	
	//댓글 목록 조회
	List<CommentVO> doRetrieve(CommentVO commentVO) throws SQLException;
	
	//댓글 등록
	int doSave(CommentVO commentVO)throws SQLException;
	
	//댓글 수정
	int doUpdate(CommentVO commentVO)throws SQLException;
	
	//댓글 삭제
	int doDelete(int commentNumber) throws SQLException;
	
	//댓글 좋아요
	int doUpdateLikes(CommentVO commentVO) throws SQLException;

}
