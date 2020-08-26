package com.zhb.app.web;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.zhb.app.bean.CategoryYears;
import com.zhb.app.bean.Product;
import com.zhb.app.service.ProductService;



@RestController
@RequestMapping("/productController")
public class ProductController {
	@Autowired
	private ProductService productService;
	
	
	
	@RequestMapping("/productListPage")
	public Map<String, Object> productListPage(Integer page, Integer limit, String pname){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", (page-1)*limit);
		map.put("rows", limit);
		map.put("pname", pname);
		
		Map<String, Object> result= new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count",productService.countProduct(map) );
		result.put("data", productService.listProductPage(map));
		return result;
		
	}
	
	@RequestMapping("/saveProductInfo")
	public String saveProductInfo(Product product) {
	try {
		return productService.saveProductInfo(product)!=0?"1":"0"; // 1:save success, 0: save failed
	} catch (Exception e) {
	     e.printStackTrace();
	     return "-1"; //already exist --> duplicate 
	}
}
	
	@RequestMapping("/removeOneProductInfo")
	public boolean removeOneProductInfo(Integer pid) {
		return productService.removeOneProductInfo(pid);
	}
	
	@RequestMapping("/removeBatchProductInfo")
	public boolean removeBatchProductInfo(@RequestParam("pids[]") String [] pids) {
		return productService.removeBatchProductInfo(pids);
	}
	
	@RequestMapping("/updateProductInfo")
	public boolean  updateProductInfo(Product product) {
		return productService.updateProductInfo(product);
		
	}
	
	
//bar chart purchase
	@RequestMapping("/yearBarChartPurchase")
	public Map<String, Double[]> yearBarChartPurchase(){
		Map<String, Double[]> map = new HashMap<String, Double[]>();
		//1. get year from product table
		String[] purchaseYear= productService.getPurchaseYear();

		//2. get total purchase by year
		
		for (int i = 0; i < purchaseYear.length; i++) {
			Double []  total= new Double[2];
			Double totalPurchase=productService.getTotalPurchase(purchaseYear[i]);
			Double totalUsage=productService.getTotalUsage(purchaseYear[i]);
			if(totalPurchase==null) {
				totalPurchase=0.0;
			}
			if(totalUsage==null) {
				totalUsage=0.0;
			}
			total[0]=totalPurchase;
			total[1]=totalUsage;
			
		   map.put(purchaseYear[i],total);
		}
		
          return map;
	}
	
	
	//yearPieChartCategory
	//string : category double: money
	@RequestMapping("/yearPieChartCategory")
	public List<CategoryYears> yearPieChartCategory(@RequestParam("years") String years){
		List<CategoryYears> list = productService.yearPieChartCategory(years);
		return list;
	}
	

	//listYears
	@RequestMapping("/listYears")
	public List<String> listYears(){
		return productService.listYears();
	}



	
	

}
