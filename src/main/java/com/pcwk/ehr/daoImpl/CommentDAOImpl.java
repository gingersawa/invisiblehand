package com.pcwk.ehr.daoImpl;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.mapping.BoundSql;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.VO.CommentVO;
import com.pcwk.ehr.cmn.PcwkLoger;
import com.pcwk.ehr.dao.CommentDAO;

@Repository
public class CommentDAOImpl implements CommentDAO, PcwkLoger {
	final String NAMESPACE = "com.pcwk.ehr.comment";
	final String DOT       = ".";
	
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;


	@Override
	public List<CommentVO> doRetrieve(CommentVO commentVO) throws SQLException {
		
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doRetrieve                    │");
		LOG.debug("│CommentVO                     │"+commentVO);
		LOG.debug("│statement                     │"+NAMESPACE+DOT+"doRetrieve");
		LOG.debug("└──────────────────────────────┘");
		
		return sqlSessionTemplate.selectList(NAMESPACE+DOT+"doRetrieve", commentVO);
	}


	@Override
	public int doSave(CommentVO commentVO) throws SQLException {
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doSave                        │");
		LOG.debug("│commentVO                     │"+commentVO);
		LOG.debug("│statement                     │"+NAMESPACE+DOT+"doSave");
		LOG.debug("└──────────────────────────────┘");	
		BoundSql boundSql  =sqlSessionTemplate.getConfiguration().getMappedStatement(NAMESPACE+DOT+"doSave").getBoundSql(commentVO);
		String query = boundSql.getSql(); 
		LOG.debug("│query                          │"+query);
		return sqlSessionTemplate.insert(NAMESPACE+DOT+"doSave", commentVO);
		
	}


	@Override
	public int doUpdate(CommentVO commentVO) throws SQLException {
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doUpdate                      │");
		LOG.debug("│commentVO                     │"+commentVO);
		LOG.debug("│statement                     │"+NAMESPACE+DOT+"doUpdate");
		LOG.debug("└──────────────────────────────┘");	
		
		return sqlSessionTemplate.update(NAMESPACE+DOT+"doUpdate", commentVO);		
	}


	@Override
	public int doDelete(int commentNumber) throws SQLException {
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doDelete                      │");
		LOG.debug("│commentNumber                 │"+commentNumber);
		LOG.debug("│statement                     │"+NAMESPACE+DOT+"doDelete");
		LOG.debug("└──────────────────────────────┘");	
		
		return sqlSessionTemplate.delete(NAMESPACE+DOT+"doDelete", commentNumber);
	}


	@Override
	public int doUpdateLikes(CommentVO commentVO) throws SQLException {
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doUpdateLikes                 │");
		LOG.debug("│commentVO                     │"+commentVO);
		LOG.debug("│statement                     │"+NAMESPACE+DOT+"doUpdateLikes");
		LOG.debug("└──────────────────────────────┘");	
		
		return sqlSessionTemplate.update(NAMESPACE+DOT+"doUpdateLikes", commentVO);
	
	}


	
	
	
}
