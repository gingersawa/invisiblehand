package com.pcwk.ehr.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.pcwk.ehr.VO.ChartVO;
import com.pcwk.ehr.service.ChartService;

@Controller
@RequestMapping(value = "chart")	//WEB_INF아래 폴더이름을 적는곳.
public class ChartController {
	
	final Logger LOG = LogManager.getLogger(getClass());

	@Autowired
	ChartService chartSerivce;
	
	
	//chartGraph 였음. db랑 연결된게 아니기 때문에 chart()로 변경
	@RequestMapping(value = "/chart.do")
	public String chart() {
		LOG.debug("┌───────────────────────┐");
		LOG.debug("│ chartGraph()          │");
		LOG.debug("└───────────────────────┘");
		
		return "chart/chartGraph";
	}
	
	//차트 기능 구현(jsonArray에 값을 저장,구글 chart에서 원하는 데이터인 이중 배열로 만듬)
	@RequestMapping(value="/chart01.do",method = RequestMethod.GET
			,produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String chartGraph(@RequestParam(value = "mainCategory", required = false, defaultValue = "비제조업") String mainCategory,
            				 @RequestParam(value = "subCategory", required = false, defaultValue = "-") String subCategory) {
		String jsonString = "";
		
		ChartVO inVO = new ChartVO();
		inVO.setMaincategory(mainCategory);
		inVO.setSubcategory(subCategory);		
		List<ChartVO> chartData = chartSerivce.chartGraph(inVO);
		
		JsonArray mainArray=new JsonArray();
		if(subCategory.equals("-")) {
			for(ChartVO outVO  :chartData) {
				JsonArray sArray=new JsonArray();
				sArray.add(outVO.getChartdate());
				sArray.add(outVO.getMaincategory());
				sArray.add(outVO.getSubcategory());
				sArray.add(outVO.getSbhiAvg());
				sArray.add(outVO.getSbhi2Avg());
				sArray.add(outVO.getSbhi3Avg());
				sArray.add(outVO.getSbhi4Avg());
				sArray.add(outVO.getSbhi5Avg());
				sArray.add(outVO.getSbhi6Avg());
				sArray.add(outVO.getSbhi7Avg());
				sArray.add(outVO.getSbhi8Avg());
				sArray.add(outVO.getSbhi9Avg());
				sArray.add(outVO.getSbhi10Avg());			
				mainArray.add(sArray);
			}
			jsonString = mainArray.toString();
			
		}else if(!subCategory.equals("-")) {
				for(ChartVO outVO  :chartData) {
					JsonArray sArray=new JsonArray();
					sArray.add(outVO.getChartdate());
					sArray.add(outVO.getMaincategory());
					sArray.add(outVO.getSubcategory());
					sArray.add(outVO.getSbhi());
					sArray.add(outVO.getSbhi2());
					sArray.add(outVO.getSbhi3());
					sArray.add(outVO.getSbhi4());
					sArray.add(outVO.getSbhi5());
					sArray.add(outVO.getSbhi6());
					sArray.add(outVO.getSbhi7());
					sArray.add(outVO.getSbhi8());
					sArray.add(outVO.getSbhi9());
					sArray.add(outVO.getSbhi10());			
					mainArray.add(sArray);
				}
				jsonString = mainArray.toString();
		}
		LOG.debug("=====================================");
		LOG.debug("jsonString"+jsonString);
		LOG.debug("=====================================");
		return jsonString;
	}

}
