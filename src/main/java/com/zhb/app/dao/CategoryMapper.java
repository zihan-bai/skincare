package com.zhb.app.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.zhb.app.bean.Category;


@Repository
@Mapper
public interface CategoryMapper {

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
    boolean removeBatchCategoryInfo(String[] cateIDs);

    List<Category> listAllCategoryInfo();

	

}
