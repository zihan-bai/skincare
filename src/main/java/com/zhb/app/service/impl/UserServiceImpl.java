package com.zhb.app.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhb.app.bean.Users;
import com.zhb.app.dao.UserMapper;
import com.zhb.app.service.UserService;


//在service类前加上@Transactional，声明这个service所有方法需要事务管理。每一个业务方法开始时都会打开一个事务。
@Service
//@Transactional 注解配置后,必须在SpringBootApp 里配置开启事务 @EnableTransactionManagement
@Transactional
public class UserServiceImpl implements UserService{

@Autowired
 private UserMapper userMapper;


//login
	public Users Login(String uname) {
	
		return userMapper.login(uname);
	}

//pagelist	
	public List<Users> getAllUsersPage(Map<String, Object> map) {
		
		return userMapper.listUsersPage(map);
	}

//count
	public int countUser(Map<String, Object> map) {
		
		return userMapper.countUsers(map);
	}

	@Override
	public int saveUserInfo(Users user) {
		
		return userMapper.saveUserInfo(user);
	}

	@Override
	public boolean removeOneUserInfo(Integer uid) {
		
		return userMapper.removeOneUserInfo(uid);
	}

	@Override
	public boolean updateUserInfo(Users user) {
		
		return userMapper.updateUserInfo(user);
	}

	@Override
	public boolean removeBatchUsersInfo(String[] uids) {
		
		return userMapper.removeBatchUsersInfo(uids);
	}

	@Override
	public boolean saveRoleInfo(Map<String, Object> map) {

		return userMapper.saveRoleInfo(map);
	}
	
	
	

}
