package com.zhb.app.web;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.zhb.app.bean.Roles;
import com.zhb.app.service.RolesService;



@RestController
@RequestMapping("/rolesController")
public class RolesController {
	// ROLE: 在给用户添加角色的时候, 角色列表以下拉列表的形式表现
	@Autowired
	private RolesService rolesService;
	
	//list all roles info
	@RequestMapping("/listAllRolesInfo")
	public List<Roles> listAllRolesInfo(){
		return rolesService.listAllRolesInfo();
	}
	
	
	//get roles info 通过用户UID查看角色信息
	@RequestMapping("/getRoleInfo")
	public List<Roles> getRoleInfo(Integer uid){
		return rolesService.getRoleInfo(uid);
		
	}
	

	
	//delete roles info 通过用户UID删除角色信息
	@RequestMapping("/deleteRole")
	public boolean deleteRole(@RequestParam("uids[]") String [] uids){
		return rolesService.deleteRole(uids);
		
	}
	
}
