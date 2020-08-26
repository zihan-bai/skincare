package com.zhb.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.zhb.app.bean.Roles;

@Repository
@Mapper
public interface RolesMapper {
	
	//get all roles 角色下拉列表
	List<Roles> listAllRolesInfo();

	//get  roles  by uid 角色查看
	List<Roles> getRoleInfo(Integer uid);

	//delete roles by uid 角色删除
	boolean deleteRole(String [] uids);
	
}
