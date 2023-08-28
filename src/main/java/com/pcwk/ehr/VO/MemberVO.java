package com.pcwk.ehr.VO;

public class MemberVO {
	private String memberId; // id
	private String password; // 비번
	private int memberGrade; // 회원 등급
	private String memberName; // 회원 이름
	private String email; // 이메일
	private String nickName; // 닉네임
	private String JoinDate; // 가입 일시
	private String updateDate; // 수정 일시
	private String isverified; // 인증 여부
	private String phoneNumber; // 휴대폰번호

	private int idCheck; // 아이디 중복확인
	private int nickNameCheck; // 니네임 중복확인
	private int emailCheck; // 이메일 중복확인

	private int loginIdCheck; // 로그인시 아이디 확인
	private int passCheck; // 로그인시 아이디 확인

	private int login; // 로그인

	public MemberVO() {
	}

	public MemberVO(String memberId, String password, int memberGrade, String memberName, String email, String nickName,
			String joinDate, String updateDate, String isverified, String phoneNumber, int idCheck, int nickNameCheck,
			int emailCheck, int loginIdCheck, int passCheck, int login) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.memberGrade = memberGrade;
		this.memberName = memberName;
		this.email = email;
		this.nickName = nickName;
		JoinDate = joinDate;
		this.updateDate = updateDate;
		this.isverified = isverified;
		this.phoneNumber = phoneNumber;
		this.idCheck = idCheck;
		this.nickNameCheck = nickNameCheck;
		this.emailCheck = emailCheck;
		this.loginIdCheck = loginIdCheck;
		this.passCheck = passCheck;
		this.login = login;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(int memberGrade) {
		this.memberGrade = memberGrade;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getJoinDate() {
		return JoinDate;
	}

	public void setJoinDate(String joinDate) {
		JoinDate = joinDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getIsverified() {
		return isverified;
	}

	public void setIsverified(String isverified) {
		this.isverified = isverified;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public int getIdCheck() {
		return idCheck;
	}

	public void setIdCheck(int idCheck) {
		this.idCheck = idCheck;
	}

	public int getNickNameCheck() {
		return nickNameCheck;
	}

	public void setNickNameCheck(int nickNameCheck) {
		this.nickNameCheck = nickNameCheck;
	}

	public int getEmailCheck() {
		return emailCheck;
	}

	public void setEmailCheck(int emailCheck) {
		this.emailCheck = emailCheck;
	}

	public int getLoginIdCheck() {
		return loginIdCheck;
	}

	public void setLoginIdCheck(int loginIdCheck) {
		this.loginIdCheck = loginIdCheck;
	}

	public int getPassCheck() {
		return passCheck;
	}

	public void setPassCheck(int passCheck) {
		this.passCheck = passCheck;
	}

	public int getLogin() {
		return login;
	}

	public void setLogin(int login) {
		this.login = login;
	}

	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", password=" + password + ", memberGrade=" + memberGrade
				+ ", memberName=" + memberName + ", email=" + email + ", nickName=" + nickName + ", JoinDate="
				+ JoinDate + ", updateDate=" + updateDate + ", isverified=" + isverified + ", phoneNumber="
				+ phoneNumber + ", idCheck=" + idCheck + ", nickNameCheck=" + nickNameCheck + ", emailCheck="
				+ emailCheck + ", loginIdCheck=" + loginIdCheck + ", passCheck=" + passCheck + ", login=" + login + "]";
	}

}