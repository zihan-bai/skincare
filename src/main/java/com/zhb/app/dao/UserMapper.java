package com.zhb.app.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.zhb.app.bean.Users;

@Mapper
@Repository
public interface UserMapper {
	
	//login
	Users login(@Param("uname")String uname);
	
	//listPage 
	List<Users> listUsersPage(Map<String,Object>map);
	
	//count
	int countUsers(Map<String,Object>map);
	
	//addUser 
    int  saveUserInfo(Users user);
    
    //delete one user
    boolean removeOneUserInfo(Integer uid);
    
    //update one user 
    boolean updateUserInfo(Users user);
    
    //removeBatch
    boolean removeBatchUsersInfo(String[] uids);
    
    //roles
    //add role
   boolean saveRoleInfo(Map<String, Object> map);
	
	

}
