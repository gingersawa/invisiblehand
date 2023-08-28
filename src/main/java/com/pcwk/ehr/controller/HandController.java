package com.pcwk.ehr.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HandController {
	
	final Logger LOG = LogManager.getLogger(getClass());
	
	
	
	
	@RequestMapping(value = "/hand-board-list.do")
	public String boardList() {
		LOG.debug("┌───────────────────────┐");
		LOG.debug("│ hand-board-list()     │");
		LOG.debug("└───────────────────────┘");
		
		return "hand/hand-board-list";
	}
	
	@RequestMapping(value = "/hand-board-mng.do")
	public String boardMng() {
		LOG.debug("┌───────────────────────┐");
		LOG.debug("│ hand-board-mng()      │");
		LOG.debug("└───────────────────────┘");
		
		return "hand/hand-board-mng";
	}
	
	@RequestMapping(value = "/hand-board-reg.do")
	public String boardReg() {
		LOG.debug("┌───────────────────────┐");
		LOG.debug("│ hand-board-reg()      │");
		LOG.debug("└───────────────────────┘");
		
		return "hand/hand-board-reg";
	}
	
	@RequestMapping(value = "/hand-board.do")
	public String board() {
		LOG.debug("┌───────────────────────┐");
		LOG.debug("│ hand-board()          │");
		LOG.debug("└───────────────────────┘");
		
		return "hand/hand-board";
	}
	
	@RequestMapping(value = "/chart.do")
	public String chart() {
		LOG.debug("┌───────────────────────┐");
		LOG.debug("│ hand-chart()          │");
		LOG.debug("└───────────────────────┘");
		
		return "chart/chart";
	}
	
	@RequestMapping(value = "/hand-chart2.do")
	public String chart2() {
		LOG.debug("┌───────────────────────┐");
		LOG.debug("│ hand-chart2           │");
		LOG.debug("└───────────────────────┘");
		
		return "hand/hand-chart2";
	}
	
	@RequestMapping(value = "/hand-index.do")
	public String index() {
		LOG.debug("┌─────────────────────s──┐");
		LOG.debug("│ hand-index()          │");
		LOG.debug("└───────────────────────┘");
		
		return "hand/hand-index";
	}
	
	@RequestMapping(value = "/hand-login.do")
	public String login() {
		LOG.debug("┌───────────────────────┐");
		LOG.debug("│ hand-login()          │");
		LOG.debug("└───────────────────────┘");
		
		return "hand/hand-login";
	}
	
}
