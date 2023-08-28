package com.pcwk.ehr.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.VO.PostVO;


public interface PostDao {
	
	/**
	 * 등록
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	int doSave(PostVO inVO)throws SQLException;
	
	/**
	 * 삭제
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	int doDelete(PostVO inVO)throws SQLException;
	
	/**
	 * 수정
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	int doUpdate(PostVO inVO)throws SQLException;
	
	/**
	 * 단건 조회
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	PostVO doSelectOne(PostVO inVO)throws SQLException;
	
	/**
	 * 목록조회
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	List<PostVO> doRetrieve(PostVO inVO)throws SQLException;
	
	/**
	 * 추천수
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	int doUpdateLikes(PostVO inVO) throws SQLException;
	
	/**
	 * 조회수
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	int doUpdateViews(PostVO inVO) throws SQLException;
}