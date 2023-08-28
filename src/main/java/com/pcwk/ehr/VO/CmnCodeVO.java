package com.pcwk.ehr.VO;

public class CmnCodeVO {
	private String masterCode		; //마스터코드 ex) postSearch
	private String codeDetail       ; //상세코드 ex) 10, 20 ,30 
	private String masterCodeName   ; //마스타코드명  ex) 게시판  말머리 조회
	private String codeDetailName   ; //상세코드명  ex)제목, 내용, 제목 +내용
	private String codeOrder        ; //순서 ex)10
	private String isUsed           ; //사용여부 Y/N 기본값 Y
	
	public CmnCodeVO() {}
	
	public CmnCodeVO(String masterCode, String codeDetail, String masterCodeName, String codeDetailName,
			String codeOrder, String isUsed) {
		super();
		this.masterCode = masterCode;
		this.codeDetail = codeDetail;
		this.masterCodeName = masterCodeName;
		this.codeDetailName = codeDetailName;
		this.codeOrder = codeOrder;
		this.isUsed = isUsed;
	}



	public String getMasterCode() {
		return masterCode;
	}



	public void setMasterCode(String masterCode) {
		this.masterCode = masterCode;
	}



	public String getCodeDetail() {
		return codeDetail;
	}



	public void setCodeDetail(String codeDetail) {
		this.codeDetail = codeDetail;
	}



	public String getMasterCodeName() {
		return masterCodeName;
	}



	public void setMasterCodeName(String masterCodeName) {
		this.masterCodeName = masterCodeName;
	}



	public String getCodeDetailName() {
		return codeDetailName;
	}



	public void setCodeDetailName(String codeDetailName) {
		this.codeDetailName = codeDetailName;
	}



	public String getCodeOrder() {
		return codeOrder;
	}



	public void setCodeOrder(String codeOrder) {
		this.codeOrder = codeOrder;
	}



	public String getIsUsed() {
		return isUsed;
	}



	public void setIsUsed(String isUsed) {
		this.isUsed = isUsed;
	}



	@Override
	public String toString() {
		return "CommonCodeVO [masterCode=" + masterCode + ", codeDetail=" + codeDetail + ", masterCodeName="
				+ masterCodeName + ", codeDetailName=" + codeDetailName + ", codeOrder=" + codeOrder + ", isUsed="
				+ isUsed + "]";
	}

	
}
