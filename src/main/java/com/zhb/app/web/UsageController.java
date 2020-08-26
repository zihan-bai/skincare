

package com.zhb.app.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.zhb.app.bean.Product;
import com.zhb.app.bean.Uses;
import com.zhb.app.service.ProductService;
import com.zhb.app.service.UsageService;

@RestController
@RequestMapping("usageController")
public class UsageController {
	
	@Autowired
	private UsageService usageService;
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/usageListPage")
	public Map<String, Object> listUsersPage(Integer page, Integer limit, String pname){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", (page-1)*limit);
		map.put("rows", limit);
		map.put("pname", pname);
		
		Map<String, Object> result= new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count",usageService.countUsage(map) );
		result.put("data", usageService.listUsagePage(map));
		return result;
		
	}
	
	
	
	

	@RequestMapping("/saveUsageInfo")
	public int saveUsageInfo(Uses uses) {
		usageService.saveUsageInfo(uses);
	
		return productService.setUseFlag(uses.getPid());
}
	
	
	@RequestMapping("/addFeedback")
	public String addFeedback(Uses uses) {
		return usageService.addFeedback(uses)!=0?"1":"0";
		
	}
	
	
	
	

	@RequestMapping("/undoUsageInfo")
	public boolean undoUsageInfo(Uses uses) {
		usageService.deleteUsageInfo(uses.getUseid());
   
     return  productService.undoUsageInfo(uses);
		
	}
	
	//获得年销售分析
	@RequestMapping("/yearPurchaseInfo")
	public Map<String, Object> yearPurchaseInfo(Integer page, Integer limit,String years) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", (page - 1) * limit);
		map.put("rows", limit);
		map.put("years", years);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", usageService.purchaseCount(map));
		result.put("data", usageService.yearPurchaseInfo(map));
		return result;
	}
	
	
	//获得年销售分析
		@RequestMapping("/yearUsageInfo")
		public Map<String, Object> yearUsageInfo(Integer page, Integer limit,String years) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("page", (page - 1) * limit);
			map.put("rows", limit);
			map.put("years", years);
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("code", 0);
			result.put("msg", "");
			result.put("count", usageService.usageCount(map));
			result.put("data", usageService.yearUsageInfo(map));
			return result;
		}
	

	
	

}
