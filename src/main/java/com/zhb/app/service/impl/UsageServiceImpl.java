package com.zhb.app.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhb.app.bean.Uses;
import com.zhb.app.bean.PurchaseAnalysis;
import com.zhb.app.bean.UsageAnalysis;
import com.zhb.app.dao.UsageMapper;
import com.zhb.app.service.UsageService;
//在service类前加上@Transactional，声明这个service所有方法需要事务管理。每一个业务方法开始时都会打开一个事务。
@Service
//@Transactional 注解配置后,必须在SpringBootApp 里配置开启事务 @EnableTransactionManagement
@Transactional
public  class UsageServiceImpl implements UsageService{
	@Autowired
	private UsageMapper usageMapper;
	
	public List<Uses> listUsagePage(Map<String,Object>map){
		return usageMapper.listUsagePage(map);
	}
	
	@Override
	public int countUsage(Map<String, Object> map) {
		
		return usageMapper.countUsage(map);
	}
	
	
	
	@Override
	public int saveUsageInfo(Uses usage) {
		
		return usageMapper.saveUsageInfo(usage);
	}
	@Override
	public boolean deleteUsageInfo(Integer sid) {

		return usageMapper.deleteUsageInfo(sid);
	}
	
	@Override
	public int addFeedback(Uses uses) {
		
		return usageMapper.addFeedback(uses);
	}




	
	//usage analysis

		@Override
		public List<UsageAnalysis> yearUsageInfo(Map<String, Object> map) {
			return usageMapper.yearUsageInfo(map);
		}


		@Override
		public int usageCount(Map<String, Object> map) {
			return usageMapper.usageCount(map);
		}
		
		//purchase analysis

		@Override
		public int purchaseCount(Map<String, Object> map) {
			
			return usageMapper.purchaseCount(map);
		}

		@Override
		public List<PurchaseAnalysis> yearPurchaseInfo(Map<String, Object> map) {
			// TODO Auto-generated method stub
			return usageMapper.yearPurchaseInfo(map);
		}



	
}
