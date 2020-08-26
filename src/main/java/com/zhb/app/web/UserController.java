package com.zhb.app.web;



import java.util.HashMap;
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

import com.zhb.app.bean.Users;
import com.zhb.app.service.UserService;



@RestController
@RequestMapping("/userController")
public class UserController {
	@Autowired
	private UserService userService;
	
	
	
	@RequestMapping("/login")
	public String login(String uname, String password) {
		//获得登录对象Subject,这个对象中有登录的相关方法
		Subject subject = SecurityUtils.getSubject();
		//判断是否认证 第一次: false (没有认证)
		if(!subject.isAuthenticated()) {//默认 false-->需要认证
			//创建登录封装用户信息的对象 UsernamePasswordToken
		//	UsernamePasswordToken token = new UsernamePasswordToken(uname, password);
			String newPassString = new Md5Hash(password, uname+password,10).toString();
			System.out.println(newPassString);
			UsernamePasswordToken token = new UsernamePasswordToken(uname, new Md5Hash(password, uname+password,10).toString());
			
			try {
				subject.login(token); //执行登录方法
				
			} catch (UnknownAccountException e) {//用户名不存在
				return "4"; // 0: 用户名错误
			}catch (IncorrectCredentialsException e) {//密码错误
				return "1"; // 1: 密码错误
			}catch (LockedAccountException e) {//多次输入错误
				return "2"; // 2: 账号被锁住
			}catch (AuthenticationException e) {//认证失败
				return "3"; // 3: 认证失败
			}
			
		}
		    return "0"; //认证成功
		
	}
	
	@RequestMapping("/UsersListPage")
	public Map<String, Object> listUsersPage(Integer page, Integer limit, String uname){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", (page-1)*limit);
		map.put("rows", limit);
		map.put("uname", uname);
		
		Map<String, Object> result= new HashMap<String, Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count",userService.countUser(map) );
		result.put("data", userService.getAllUsersPage(map));
		return result;
		
	}
	
	@RequestMapping("/saveUsersInfo")
	public String saveUsersInfo(Users user) {
	try {
		return userService.saveUserInfo(user)!=0?"1":"0"; // 1:save success, 0: save failed
	} catch (Exception e) {
	     e.printStackTrace();
	     return "-1"; //already exist --> duplicate 
	}
}
	
	@RequestMapping("/removeOneUserInfo")
	public boolean removeOneUserInfo(Integer uid) {
		return userService.removeOneUserInfo(uid);
	}
	
	@RequestMapping("/removeBatchUsersInfo")
	public boolean removeBatchUsersInfo(@RequestParam("uids[]") String [] uids) {
		return userService.removeBatchUsersInfo(uids);
	}
	
	@RequestMapping("/updateUsersInfo")
	public boolean  updateUsersInfo(Users user) {
		return userService.updateUserInfo(user);
		
	}
	

    
	@RequestMapping("/saveRoleInfo")
	public boolean saveRoleInfo(@RequestParam("uid") String uid, @RequestParam("rid") String rid) {
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("rid", rid);
		return userService.saveRoleInfo(map);
	}
	
	
	

}
