package com.pcwk.ehr.service;

import java.sql.SQLException;

import com.pcwk.ehr.VO.PaymentInfoVO;

public interface PaymentInfoService {
	
	// 결제 정보 입력
	int addInfo(PaymentInfoVO inVO) throws SQLException;
	
	// 주문 번호 조회(결제 번호 조회)
	public PaymentInfoVO getPaymentInfoByEmail(String buyerEmail);
	
	// 결제 정보 업데이트
	public int updatePaymentInfo(PaymentInfoVO inVO);
	
	// 결제 여부 확인
	public int checkPaymentInfo(String buyerEmail);
	
}
