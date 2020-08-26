package com.zhb.app.utils;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.javassist.expr.NewArray;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.zhb.app.bean.Roles;
import com.zhb.app.bean.Users;
import com.zhb.app.service.UserService;

import ch.qos.logback.core.net.LoginAuthenticator;

public class MyRealm  extends AuthorizingRealm{
	
	@Autowired
	private UserService userService;
	

	// 1.认证 Authentication
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		//获得登录对象
				String uname =(String) token.getPrincipal();
	    //调用当前类的login方法, 传入当前登录对象,返回user对象
				Users users = this.Login(uname);// uname 是页面上传来的信息
		//AuthenticationInfo 的实现类:SimpleAuthenticationInfo ,这个类中有用户登录时,用户输入的账号密码和数据库信息进行比对的方法
		//用token中页面输入的用户信息   和   users(数据中查出来的用户信息) 进行比对
		//主要是密码匹配的比对
				SimpleAuthenticationInfo info = null;
		if(users!=null) {
			//参数 1:从数据库中查出的用户名 
			//参数 2:从数据库中查出的密码
			//参数 3:域名 realmName 当前域的名称
			//从数据库中得来的  和 页面输入的进行比对
			info = new SimpleAuthenticationInfo(users.getUname(),users.getPassword(),this.getName());
			
		}
	
				
		return info;
	}
	
	
	
	private Users Login(String uname) {
		return userService.Login(uname);
		
	}

	//2.授权:登录成功之后才能授权 Authorization
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		Users user = Login((String)principals.getPrimaryPrincipal());//拿到登录进来的用户
		
		List<String> roleString = new ArrayList<String>();
		
		//get user's roles list 
		List<Roles> roleList = user.getList();
		
		//iterate
		for (Roles roles : roleList) {
			
			roleString.add(roles.getRname());
		}
		
		info.addRoles(roleString);//将角色加入到	SimpleAuthorizationInfo 对象后,在页面中可以借助shiro的标签,进行菜单的可见性处理:管理员和普通用户看到的不同	
		return info;		
	}


}
