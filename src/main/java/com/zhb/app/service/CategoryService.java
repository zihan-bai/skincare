package com.zhb.app.service;

import java.util.List;
import java.util.Map;

import com.zhb.app.bean.Category;

public interface CategoryService {

	//listPage 
	List<Category> listCategoryPage(Map<String,Object>map);
	
	//count
	int countCategory(Map<String,Object>map);
	
	//save
    int  saveCategoryInfo(Category category);
    
    //delete 
    boolean removeOneCategoryInfo(Integer cateid);
    
    //update 
    boolean updateCategoryInfo(Category category);
    
    //removeBatch
    boolean removeBatchCategoryInfo(String[] cateids);

    List<Category> listAllCategoryInfo();
}
