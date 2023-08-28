package com.pcwk.ehr.VO;

public class MessageVO {
	private String msgContents; //메시지
	private String msgId; //메세지 ID
	
	public MessageVO () {}

	public MessageVO(String msgContents, String msgId) {
		super();
		this.msgContents = msgContents;
		this.msgId = msgId;
	}

	public String getMsgContents() {
		return msgContents;
	}

	public void setMsgContents(String msgContents) {
		this.msgContents = msgContents;
	}

	public String getMsgId() {
		return msgId;
	}

	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}

	@Override
	public String toString() {
		return "MessageDTO [msgContents=" + msgContents + ", msgId=" + msgId + "]";
	}

	

	
	

}
