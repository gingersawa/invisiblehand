package com.pcwk.ehr.VO;

import java.io.Serializable;

public class AdminVO implements Serializable {
    private static final long serialVersionUID = 1L;

    private String adminId;
    private String adminName;
    private String adminEmail;
    
    

    public AdminVO(String adminId, String adminName, String adminEmail) {
		super();
		this.adminId = adminId;
		this.adminName = adminName;
		this.adminEmail = adminEmail;
	}


    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }
}
