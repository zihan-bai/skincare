package com.zhb.app.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhb.app.bean.Category;
import com.zhb.app.dao.CategoryMapper;
import com.zhb.app.service.CategoryService;

//在service类前加上@Transactional，声明这个service所有方法需要事务管理。每一个业务方法开始时都会打开一个事务。
@Service
//@Transactional 注解配置后,必须在SpringBootApp 里配置开启事务 @EnableTransactionManagement
@Transactional
public class CategoryServiceImpl implements CategoryService{	
	@Autowired 
	private CategoryMapper categoryMapper;

	@Override
	public List<Category> listCategoryPage(Map<String, Object> map) {
		
		return categoryMapper.listCategoryPage(map);
	}

	@Override
	public int countCategory(Map<String, Object> map) {
	
		return categoryMapper.countCategory(map);
	}

	@Override
	public int saveCategoryInfo(Category category) {
		
		return categoryMapper.saveCategoryInfo(category);
	}

	@Override
	public boolean removeOneCategoryInfo(Integer cateid) {
	
		return categoryMapper.removeOneCategoryInfo(cateid);
	}

	@Override
	public boolean updateCategoryInfo(Category category) {

		return categoryMapper.updateCategoryInfo(category);
	}

	@Override
	public boolean removeBatchCategoryInfo(String[] cateids) {
		
		return categoryMapper.removeBatchCategoryInfo(cateids);
	}

	@Override
	public List<Category> listAllCategoryInfo() {
		
		return categoryMapper.listAllCategoryInfo();
	}


}
