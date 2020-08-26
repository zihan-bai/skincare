package com.zhb.app.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.zhb.app.bean.Category;
import com.zhb.app.bean.Users;
import com.zhb.app.service.CategoryService;
import com.zhb.app.service.UserService;

@RestController
@RequestMapping("/categoryController")
public class CategoryController {
	@Autowired
	private CategoryService categoryService;
	@RequestMapping("/categoryListPage")
	public Map<String, Object> listUsersPage(Integer page, Integer limit, String cateName){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", (page-1)*limit);
		map.put("rows", limit);
		map.put("cateName", cateName);
		
		Map<String, Object> result= new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count",categoryService.countCategory(map) );
		result.put("data", categoryService.listCategoryPage(map));
		return result;
		
	}
	
	@RequestMapping("/saveCategoryInfo")
	public String saveCategoryInfo(Category category) {
	try {
		return categoryService.saveCategoryInfo(category)!=0?"1":"0"; // 1:save success, 0: save failed
	} catch (Exception e) {
	     e.printStackTrace();
	     return "-1"; //already exist --> duplicate 
	}
}
	
	@RequestMapping("/removeOneCategoryInfo")
	public boolean removeOneCategoryInfo(Integer cateid) {
		return categoryService.removeOneCategoryInfo(cateid);
	}
	
	@RequestMapping("/removeBatchCategoryInfo")
	public boolean removeBatchCategoryInfo(@RequestParam("cateids[]") String [] cateids) {
		return categoryService.removeBatchCategoryInfo(cateids);
	}
	
	@RequestMapping("/updateCategoryInfo")
	public boolean  updateCategoryInfo(Category category) {
		return categoryService.updateCategoryInfo(category);
		
	}
	
	
	@RequestMapping("/listAllCategoryInfo")
	public List<Category>  listAllCategoryInfo() {
		return categoryService.listAllCategoryInfo();
		
	}
	
	

	
	
	

}
