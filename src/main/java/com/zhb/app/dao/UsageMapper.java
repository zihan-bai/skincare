package com.zhb.app.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.zhb.app.bean.Uses;
import com.zhb.app.bean.PurchaseAnalysis;
import com.zhb.app.bean.UsageAnalysis;


@Repository
@Mapper
public interface UsageMapper {
	//listPage 
	List<Uses> listUsagePage(Map<String,Object>map);
	
    //count
	int countUsage(Map<String, Object> map);

	//save
	int saveUsageInfo(Uses usage);

	//delete
	boolean deleteUsageInfo(Integer useid);

	int addFeedback(Uses uses);
	

	//usage analysis
	List<UsageAnalysis> yearUsageInfo(Map<String, Object> map);

	int usageCount(Map<String, Object> map);
	
	//purchase analysis

	int purchaseCount(Map<String, Object> map);

	List<PurchaseAnalysis> yearPurchaseInfo(Map<String, Object> map);

}
