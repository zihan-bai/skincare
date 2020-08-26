package com.zhb.app.service;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.message.StringFormattedMessage;

import com.zhb.app.bean.Users;

public interface UserService {
     Users Login(String uname);
 	
 	//getAllUser 
 	
 	List<Users> getAllUsersPage(Map<String, Object> map);
 	
 	// count
 	int countUser(Map<String, Object> map);
 	
 	//addUser 
    int saveUserInfo(Users user);
    
    //delete one user
    boolean removeOneUserInfo(Integer uid);
    
    //update one user 
    boolean updateUserInfo(Users user);
    
    //removeBatch
    boolean removeBatchUsersInfo(String[] uids);
	
    
    //add role
   boolean saveRoleInfo(Map<String, Object> map);
}
