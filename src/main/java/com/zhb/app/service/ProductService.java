package com.zhb.app.service;

import java.util.List;
import java.util.Map;

import com.zhb.app.bean.CategoryYears;
import com.zhb.app.bean.Product;
import com.zhb.app.bean.Uses;



public interface ProductService {
	//listPage 
	List<Product> listProductPage(Map<String,Object>map);
	
	//count
	int countProduct(Map<String,Object>map);
	
	//add 
    int  saveProductInfo(Product product);
    
    //delete one 
    boolean removeOneProductInfo(Integer pid);
    
    //update one 
    boolean updateProductInfo(Product product);
    
    //removeBatch
    boolean removeBatchProductInfo(String[] pids);
    
    //get product by id
    Product getProductByID(Integer pid);

	int setUseFlag(Integer pid);

	boolean undoUsageInfo(Uses uses);
	
	//purchase bar chart

	String[] getPurchaseYear();

	Double  getTotalPurchase(String year);

	Double getTotalUsage(String year);

	List<CategoryYears> yearPieChartCategory(String years);

	List<String> listYears();
}
