package com.pcwk.ehr.VO;

import lombok.Data;
import lombok.ToString;
import oracle.sql.DATE;

@Data
@ToString
public class SubMemList {
	private int subscriptionseq;
	private String membergrade;
	private String memberid;
	private DATE subscriptionstartdate;
	private DATE subscriptionenddate;
	
	public SubMemList() {}
}
