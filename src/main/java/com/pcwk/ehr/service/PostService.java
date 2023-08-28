package com.pcwk.ehr.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.pcwk.ehr.VO.PostVO;


public interface PostService {
	
	/**
	 * 게시글 등록
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	int doSave(PostVO inVO)throws SQLException;
	
	/**
	 * 게시글 삭제
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	int doDelete(PostVO inVO)throws SQLException;
	
	/**
	 * 게시글 수정
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	int doUpdate(PostVO inVO)throws SQLException;
	
	/**
	 * 게시글 단건조회 
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	PostVO doSelectOne(PostVO inVO)throws SQLException;
	
	/**
	 * 게시글 목록조회
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	List<PostVO> doRetrieve(PostVO inVO)throws SQLException;
	
	/**
	 * 게시글 추천수
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	int doUpdateLikes(PostVO inVO) throws SQLException;
	
	/**
	 * 게시글 조회수
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	int doUpdateViews(PostVO inVO) throws SQLException;
}

