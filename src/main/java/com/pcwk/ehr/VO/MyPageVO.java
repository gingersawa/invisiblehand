package com.pcwk.ehr.VO;

public class MyPageVO {
    private String memberId;
    private String nickname;
    private String email;
    private String membershipLevel;


    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMembershipLevel() {
        return membershipLevel;
    }

    public void setMembershipLevel(String membershipLevel) {
        this.membershipLevel = membershipLevel;
    }

    @Override
    public String toString() {
        return "MyPageVO{" +
                "memberId='" + memberId + '\'' +
                ", nickname='" + nickname + '\'' +
                ", email='" + email + '\'' +
                ", membershipLevel='" + membershipLevel + '\'' +
                '}';
    }
}
