package com.zhb.app.service;

import java.util.List;
import java.util.Map;

import com.zhb.app.bean.Uses;
import com.zhb.app.bean.PurchaseAnalysis;
import com.zhb.app.bean.UsageAnalysis;



public interface UsageService {
	List<Uses> listUsagePage(Map<String,Object>map);

 	// count
 	int countUsage(Map<String, Object> map);

	int saveUsageInfo(Uses usage);

	boolean deleteUsageInfo(Integer useid);

	int addFeedback(Uses uses);

	
//year Usage analysis
	int usageCount(Map<String, Object> map);

	List<UsageAnalysis> yearUsageInfo(Map<String, Object> map);

	//year Usage analysis
	int purchaseCount(Map<String, Object> map);

	List<PurchaseAnalysis> yearPurchaseInfo(Map<String, Object> map);
}
