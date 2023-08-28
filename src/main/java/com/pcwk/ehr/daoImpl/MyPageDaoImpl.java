package com.pcwk.ehr.daoImpl;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.cmn.MyPage;
import com.pcwk.ehr.dao.MyPageDao;

@Repository
public class MyPageDaoImpl implements MyPageDao {

    private final String NAMESPACE = "com.pcwk.ehr.hand.mapper.MyPageMapper";

    @Autowired
    private SqlSession sqlSession;

    @Override
    public MyPage getMyPageByMemberId(String memberId) {
        return sqlSession.selectOne(NAMESPACE + ".getMyPageByMemberId", memberId);
    }
} // class end
