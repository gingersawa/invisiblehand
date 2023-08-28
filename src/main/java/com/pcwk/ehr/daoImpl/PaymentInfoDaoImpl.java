package com.pcwk.ehr.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.VO.PaymentInfoVO;
import com.pcwk.ehr.cmn.PcwkLoger;
import com.pcwk.ehr.dao.PaymentInfoDao;

@Repository
public class PaymentInfoDaoImpl implements PaymentInfoDao, PcwkLoger {
	final String NAMESPACE = "com.pcwk.ehr.paymentInfo";
	final String DOT = ".";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// 정보 전체 조회
	public List<PaymentInfoVO> selectAll(PaymentInfoVO info) throws SQLException {
		List<PaymentInfoVO> list = new ArrayList<>();

		list = sqlSessionTemplate.selectList(this.NAMESPACE + DOT + "selectAll", info);

		return list;
	}

	// 결제 정보 조회
	@Override
	public PaymentInfoVO selectPaymentInfoByEmail(String buyerEmail) {
		PaymentInfoVO info = this.sqlSessionTemplate.selectOne
				(this.NAMESPACE + DOT + "selectPaymentInfoByEmail", buyerEmail);
		LOG.debug("info-----------" + info);
		
		return info;
	}

	// 결제 정보 입력
	@Override
	public int InsertInfo(PaymentInfoVO inVO) {
		return sqlSessionTemplate.insert(NAMESPACE + DOT + "InsertInfo", inVO);
	}
	
	// 결제 정보 업데이트
	@Override
	public int updatePaymentInfo(PaymentInfoVO inVO) {
		return sqlSessionTemplate.update(this.NAMESPACE + DOT + "updatePaymentInfo", inVO);
	}
	
	// 결제 정보 유무 체크
	@Override
	public int checkPaymentInfo(String buyerEmail) {
		return sqlSessionTemplate.selectOne(NAMESPACE + DOT + "checkPaymentInfo", buyerEmail);
	}

}
