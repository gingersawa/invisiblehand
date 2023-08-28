package com.pcwk.ehr.dao;

import com.pcwk.ehr.cmn.MyPage;

public interface MyPageDao {
    MyPage getMyPageByMemberId(String memberId);
}