package com.pcwk.ehr.service;

import com.pcwk.ehr.cmn.MyPage;

public interface MyPageService<PaymentInfo> {

	MyPage getMyPageByMemberId(String memberId);

	PaymentInfo getPaymentInfoByMemberId(String memberId);

}
