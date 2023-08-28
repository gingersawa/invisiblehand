package com.pcwk.ehr.VO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//임시 chartVO이기 때문에 롬복을 활용 나중에 바꿈

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ChartVO {
  private String  chartdate;		
  private String  maincategory;
  private String  subcategory;
  private double  sbhi;
  private double sbhi2;
  private double sbhi3;
  private double sbhi4;
  private double sbhi5;
  private double sbhi6;
  private double sbhi7;
  private double sbhi8;
  private double sbhi9;
  private double sbhi10;
  
  //sbhi 평균값을 저장할 곳
  private double sbhiAvg;
  private double sbhi2Avg;  
  private double sbhi3Avg;  
  private double sbhi4Avg;  
  private double sbhi5Avg;  
  private double sbhi6Avg;  
  private double sbhi7Avg;  
  private double sbhi8Avg;  
  private double sbhi9Avg;  
  private double sbhi10Avg; 
    
  
    
}                      
