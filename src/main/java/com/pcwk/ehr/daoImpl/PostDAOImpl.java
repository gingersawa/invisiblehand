package com.pcwk.ehr.daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.mapping.BoundSql;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.VO.PostVO;
import com.pcwk.ehr.cmn.PcwkLoger;
import com.pcwk.ehr.dao.PostDao;

@Repository
public class PostDAOImpl implements PostDao, PcwkLoger {
	final String NAMESPACE = "com.pcwk.ehr.post";
	final String DOT       = ".";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int doSave(PostVO inVO) throws SQLException {
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doSave                        │");
		LOG.debug("│inVO                          │"+inVO);
		LOG.debug("│statement                     │"+NAMESPACE+DOT+"doSave");
		LOG.debug("└──────────────────────────────┘");	
		BoundSql boundSql  =sqlSessionTemplate.getConfiguration().getMappedStatement(NAMESPACE+DOT+"doSave").getBoundSql(inVO);
		String query = boundSql.getSql(); 
		LOG.debug("│query                          │"+query);
		return sqlSessionTemplate.insert(NAMESPACE+DOT+"doSave", inVO);
	}

	@Override
	public int doDelete(PostVO inVO) throws SQLException {
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doDelete                      │");
		LOG.debug("│inVO                          │"+inVO);
		LOG.debug("│statement                     │"+NAMESPACE+DOT+"doDelete");
		LOG.debug("└──────────────────────────────┘");	
		return sqlSessionTemplate.delete(NAMESPACE+DOT+"doDelete", inVO);
	}

	@Override
	public int doUpdate(PostVO inVO) throws SQLException {
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doUpdate                      │");
		LOG.debug("│inVO                          │"+inVO);
		LOG.debug("│statement                     │"+NAMESPACE+DOT+"doUpdate");
		LOG.debug("└──────────────────────────────┘");	
		return sqlSessionTemplate.update(NAMESPACE+DOT+"doUpdate", inVO);
	}

	@Override
	public PostVO doSelectOne(PostVO inVO) throws SQLException {
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doSelectOne                   │");
		LOG.debug("│inVO                          │"+inVO);
		LOG.debug("│statement                     │"+NAMESPACE+DOT+"doSelectOne");
		LOG.debug("└──────────────────────────────┘");	
		return sqlSessionTemplate.selectOne(NAMESPACE+DOT+"doSelectOne", inVO);
	}

	@Override
	public List<PostVO> doRetrieve(PostVO inVO) throws SQLException {
		
		inVO.setNickname("MJ");
		
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doRetrieve                    │");
		LOG.debug("│inVO                          │"+inVO);
		LOG.debug("│statement                     │"+NAMESPACE+DOT+"doRetrieve");
		LOG.debug("└──────────────────────────────┘");
		
		
		return sqlSessionTemplate.selectList(NAMESPACE+DOT+"doRetrieve", inVO);
	}

	@Override
	public int doUpdateLikes(PostVO inVO) throws SQLException {
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doUpdateLikes                 │");
		LOG.debug("│inVO                          │"+inVO);
		LOG.debug("│statement                     │"+NAMESPACE+DOT+"doUpdateLikes");
		LOG.debug("└──────────────────────────────┘");			
		
		return sqlSessionTemplate.update(NAMESPACE+DOT+"doUpdateLikes", inVO);
	}

	@Override
	public int doUpdateViews(PostVO inVO) throws SQLException {
	    LOG.debug("┌──────────────────────────────┐");
	    LOG.debug("│doUpdateViews                 │");
	    LOG.debug("│inVO                          │"+inVO);
	    LOG.debug("│statement                     │"+NAMESPACE+DOT+"doUpdateViews");
	    LOG.debug("└──────────────────────────────┘");            
	    return sqlSessionTemplate.update(NAMESPACE+DOT+"doUpdateViews", inVO);
	}

	
	
	
}
