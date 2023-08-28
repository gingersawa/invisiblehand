package com.pcwk.ehr.VO;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class PaymentInfoVO {
	private int paymentinfoseq; // 결제 시퀀스
	private String merchantUid; // 주문번호
	private String name; // 구매할 상품명
	private int amount; // 구매할 가격
	private String buyerEmail; // 소비자 이메일
	private String buyerName; // 소비자 이름
	private String buyerTel; // 소비자 전화번호
	
	public PaymentInfoVO() {}

}
