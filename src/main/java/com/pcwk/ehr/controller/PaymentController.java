package com.pcwk.ehr.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pcwk.ehr.VO.MemberVO;
import com.pcwk.ehr.VO.PaymentInfoVO;
import com.pcwk.ehr.cmn.MessageVO;
import com.pcwk.ehr.service.MemberService;
import com.pcwk.ehr.service.PaymentInfoService;

@Controller
@RequestMapping(value = "payment") // WEB_INF아래 폴더이름을 적는곳.
public class PaymentController {

	final Logger lg = LogManager.getLogger(getClass());

	@Autowired
	PaymentInfoService payService;

	@Autowired
	MemberService memberService;
	
	// 구독 여부 확인
	@ResponseBody
	@RequestMapping(value = "/payment_check.do")
	public String payment_check(PaymentInfoVO info, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		int result = payService.checkPaymentInfo(email);

		return Integer.toString(result);
	}
	
	// 구독 정보
	@GetMapping("/payment_detail.do")
	public String paymentDetail(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String buyerEmail = (String) session.getAttribute("email"); // session으로 email정보 넘기기
	
		// PaymentInfoVO 객체 생성
		PaymentInfoVO paymentInfo = new PaymentInfoVO();
		paymentInfo = payService.getPaymentInfoByEmail(buyerEmail); // 객체에 정보 담기
	
		model.addAttribute("paymentInfo", paymentInfo);
	
		return "payment/payment_detail";
	}
	
	@PostMapping("/payment_info.do")
	@ResponseBody
	public String paymentInfoAddOrUpdate(PaymentInfoVO inVO, HttpSession session) throws SQLException {
		String email = (String) session.getAttribute("email"); // session으로 email정보 넘기기

		int rowCount = payService.checkPaymentInfo(email); // count가 0이면 insert, 1이면 update
		
		lg.debug("rowCount----------------" + rowCount);
		if (rowCount == 0) { // 결제 정보가 없으면 추가
			int result = payService.addInfo(inVO);
			if (result == 1) {
				String msg = inVO.getBuyerName() + "님의 구독되었습니다!";
				MessageVO messageVO = new MessageVO(Integer.toString(result), msg);
				return new Gson().toJson(messageVO);
			} else {
				String msg = inVO.getBuyerName() + "님의 구독 실패되었습니다.";
				MessageVO messageVO = new MessageVO(Integer.toString(result), msg);
				return new Gson().toJson(messageVO);
			}
		} else { // 있으면 업데이트
			int result = payService.updatePaymentInfo(inVO);
			if (result == 1) {
				String msg = inVO.getBuyerName() + "님의 구독 정보가 업데이트되었습니다!";
				MessageVO messageVO = new MessageVO(Integer.toString(result), msg);
				return new Gson().toJson(messageVO);
			} else {
				String msg = inVO.getBuyerName() + "님의 구독 정보 업데이트가 실패되었습니다.";
				MessageVO messageVO = new MessageVO(Integer.toString(result), msg);
				return new Gson().toJson(messageVO);
			}
		}
	}

	@GetMapping("/payment_view.do")
	public String payment() {
		lg.debug("┌───────────────────────┐");
		lg.debug("│   payment()           │");
		lg.debug("└───────────────────────┘");

		return "payment/payment_view";
	}

}