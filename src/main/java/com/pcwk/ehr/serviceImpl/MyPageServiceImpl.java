package com.pcwk.ehr.serviceImpl;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import com.pcwk.ehr.cmn.MyPage;
import com.pcwk.ehr.dao.MyPageDao;
import com.pcwk.ehr.service.MyPageService;


@Service
public class MyPageServiceImpl implements MyPageService {
	
	 @Autowired
	    private MyPageDao myPageDao;

	    @Override
	    public MyPage getMyPageByMemberId(String memberId) {
	        return myPageDao.getMyPageByMemberId(memberId);
	    }

		@Override
		public Object getPaymentInfoByMemberId(String memberId) {
			// TODO Auto-generated method stub
			return null;
		}

	
} // class end
