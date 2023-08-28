package com.pcwk.ehr.serviceImpl;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.VO.PaymentInfoVO;
import com.pcwk.ehr.dao.PaymentInfoDao;
import com.pcwk.ehr.service.PaymentInfoService;

@Service
public class PaymentInfoServiceImpl implements PaymentInfoService {
	
	@Autowired
	PaymentInfoDao dao;

	// 결제 정보 조회
	@Override
	public PaymentInfoVO getPaymentInfoByEmail(String buyerEmail) {
		return dao.selectPaymentInfoByEmail(buyerEmail);
	}
	
	// 결제 정보 입력
	@Override
	public int addInfo(PaymentInfoVO inVO) throws SQLException {
		return dao.InsertInfo(inVO);
	}
	
	// 결제 정보 업데이트
	public int updatePaymentInfo(PaymentInfoVO inVO) {
		return dao.updatePaymentInfo(inVO);
	}

	// 결제 여부 확인
	@Override
	public int checkPaymentInfo(String buyerEmail) {
		return dao.checkPaymentInfo(buyerEmail);
	}

}
