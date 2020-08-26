package com.zhb.app.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhb.app.bean.CategoryYears;
import com.zhb.app.bean.Product;
import com.zhb.app.bean.Uses;
import com.zhb.app.dao.ProductMapper;
import com.zhb.app.service.ProductService;

//在service类前加上@Transactional，声明这个service所有方法需要事务管理。每一个业务方法开始时都会打开一个事务。
@Service
//@Transactional 注解配置后,必须在SpringBootApp 里配置开启事务 @EnableTransactionManagement
@Transactional
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductMapper productMapper;

	@Override
	public List<Product> listProductPage(Map<String, Object> map) {
	
		return productMapper.listProductPage(map);
	}

	@Override
	public int countProduct(Map<String, Object> map) {
	
		return productMapper.countProduct(map);
	}

	@Override
	public int saveProductInfo(Product product) {
		
		return productMapper.saveProductInfo(product);
	}

	@Override
	public boolean removeOneProductInfo(Integer bid) {
		
		return productMapper.removeOneProductInfo(bid);
	}

	@Override
	public boolean updateProductInfo(Product product) {
		
		return productMapper.updateProductInfo(product);
	}

	@Override
	public boolean removeBatchProductInfo(String[] pids) {
		
		return productMapper.removeBatchProductInfo(pids);
	}

	@Override
	public Product getProductByID(Integer bid) {
	
		return productMapper.getProductByID(bid);
	}

	@Override
	public int setUseFlag(Integer pid) {
		
		return productMapper.setUseFlag(pid);
	}

	@Override
	public boolean undoUsageInfo(Uses uses) {
		
		return productMapper.undoUsageInfo(uses);
	}

	//purchase bar chart 
	@Override
	public String[] getPurchaseYear() {
		
		return productMapper.getPurchaseYear();
	}

	@Override
	public Double getTotalPurchase(String year) {
		
		return productMapper.getTotalPurchase(year);
	}

	@Override
	public Double getTotalUsage(String year) {
	
		return productMapper.getTotalUsage(year);
	}

	@Override
	public List<CategoryYears> yearPieChartCategory(String years) {
		
		return productMapper.yearPieChartCategory(years);
	}

	@Override
	public List<String> listYears() {
		
		return productMapper.listYears();
	}

}