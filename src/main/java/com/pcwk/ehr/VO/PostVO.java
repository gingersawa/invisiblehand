package com.pcwk.ehr.VO;

import org.springframework.stereotype.Component;

import com.pcwk.ehr.cmn.DTO;

@Component
public class PostVO extends DTO {
	//게시판 
	private int postNumber; 	//게시글 번호(순번) 		
	private String nickname;    //글쓴이 
	private String title;       //글제목
	private String content;     //내용
	private String writtenDate; //작성일 
	private int likes;          //추천수
	private int views;          //조회수
	private String categoryNumber; //카테고리 번호 (10 자유게시판, 20 QnA게시판, 30 공지게시판)
	
	
	
	public PostVO() {}

	
	public PostVO(int postNumber, String nickname, String title, String content, String writtenDate, int likes,
			int views, String categoryNumber) {
		super();
		this.postNumber = postNumber;
		this.nickname = nickname;
		this.title = title;
		this.content = content;
		this.writtenDate = writtenDate;
		this.likes = likes;
		this.views = views;
		this.categoryNumber = categoryNumber;
	}



	public int getPostNumber() {
		return postNumber;
	}



	public void setPostNumber(int postNumber) {
		this.postNumber = postNumber;
	}



	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public String getWrittenDate() {
		return writtenDate;
	}



	public void setWrittenDate(String writtenDate) {
		this.writtenDate = writtenDate;
	}



	public int getLikes() {
		return likes;
	}



	public void setLikes(int likes) {
		this.likes = likes;
	}



	public int getViews() {
		return views;
	}



	public void setViews(int views) {
		this.views = views;
	}



	public String getCategoryNumber() {
		return categoryNumber;
	}



	public void setCategoryNumber(String categoryNumber) {
		this.categoryNumber = categoryNumber;
	}



	@Override
	public String toString() {
		return "PostVO [postNumber=" + postNumber + ", nickname=" + nickname + ", title=" + title + ", content="
				+ content + ", writtenDate=" + writtenDate + ", likes=" + likes + ", views=" + views
				+ ", categoryNumber=" + categoryNumber + "]";
	}

	
	
	


}
