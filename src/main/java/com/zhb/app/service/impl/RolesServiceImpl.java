package com.zhb.app.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhb.app.bean.Roles;
import com.zhb.app.bean.Users;
import com.zhb.app.dao.RolesMapper;
import com.zhb.app.dao.UserMapper;
import com.zhb.app.service.RolesService;
//在service类前加上@Transactional，声明这个service所有方法需要事务管理。每一个业务方法开始时都会打开一个事务。
@Service
//@Transactional 注解配置后,必须在SpringBootApp 里配置开启事务 @EnableTransactionManagement
@Transactional
public class RolesServiceImpl  implements RolesService{
	@Autowired 
	private RolesMapper rolesMapper;
	
	@Autowired 
	private UserMapper usersMapper;

	@Override
	public List<Roles> listAllRolesInfo() {
		
		return rolesMapper.listAllRolesInfo();
	}

	@Override
	public List<Roles> getRoleInfo(Integer uid) {
		return rolesMapper.getRoleInfo(uid);
	}

	@Override
	public boolean deleteRole(String [] uids) {
	
		return rolesMapper.deleteRole(uids);
	}

}
