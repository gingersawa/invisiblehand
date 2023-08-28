package com.pcwk.ehr.VO;

import com.pcwk.ehr.cmn.DTO;

public class CommentVO extends DTO {
	private int commentNumber;
	private String nickname;
	private String content;
	private int likes;
	private String writtenDate;
	private int postNumber;
	private String memberId;

	public CommentVO(){}

	public CommentVO(int commentNumber, String nickname, String content, int likes, String writtenDate, int postNumber,
			String memberId) {
		super();
		this.commentNumber = commentNumber;
		this.nickname = nickname;
		this.content = content;
		this.likes = likes;
		this.writtenDate = writtenDate;
		this.postNumber = postNumber;
		this.memberId = memberId;
	}

	public int getCommentNumber() {
		return commentNumber;
	}

	public void setCommentNumber(int commentNumber) {
		this.commentNumber = commentNumber;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public String getWrittenDate() {
		return writtenDate;
	}

	public void setWrittenDate(String writtenDate) {
		this.writtenDate = writtenDate;
	}

	public int getPostNumber() {
		return postNumber;
	}

	public void setPostNumber(int postNumber) {
		this.postNumber = postNumber;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "CommentVO [commentNumber=" + commentNumber + ", nickname=" + nickname + ", content=" + content
				+ ", likes=" + likes + ", writtenDate=" + writtenDate + ", postNumber=" + postNumber + ", memberId="
				+ memberId + "]";
	}
	
	
	


}
