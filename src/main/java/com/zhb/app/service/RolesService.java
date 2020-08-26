package com.zhb.app.service;

import java.util.List;

import com.zhb.app.bean.Roles;

public interface RolesService {
	//get all Roles info
	
	List<Roles> listAllRolesInfo();

	//get role info by uid
	List<Roles> getRoleInfo(Integer uid);
	
	//delete role for a user
	boolean deleteRole(String [] uid);
}
