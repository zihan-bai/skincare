package com.zhb.app.utils;

import org.springframework.context.annotation.Configuration;
import java.util.LinkedHashMap;
import java.util.Map;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.DependsOn;

import org.springframework.context.annotation.Configuration;

//@Configuration 在spring boot 中没有xml 配置文件,因此本应该用xml 写的配置,现在要用类的形式写出
//Configuration 注解就是指把该类放入spring容器当中

@Configuration
public class ShiroConfiguration {
	/**
	 * LifecycleBeanPostProcessor，这是个DestructionAwareBeanPostProcessor的子类，
	 * 负责org.apache.shiro.util.Initializable类型bean的生命周期的，初始化和销毁。
	 * 主要是AuthorizingRealm类的子类，以及EhCacheManager类。
	 */
	//lifecycleBeanPostProcessor 管理生命周期的类
	@Bean(name = "lifecycleBeanPostProcessor")
	public LifecycleBeanPostProcessor lifecycleBeanPostProcessor() {
		return new LifecycleBeanPostProcessor();
	}


	/**ShiroRealm，这是个自定义的认证类，继承自AuthorizingRealm，
	 * 负责用户的认证和权限的处理，可以参考JdbcRealm的实现。
	 */
	@Bean(name="shiroRealm")//放入spring容器中
	@DependsOn("lifecycleBeanPostProcessor")
	public MyRealm shiroRealm() {
		return  new MyRealm();
	}

	/**
	 * SecurityManager，权限管理，这个类组合了登陆，登出，权限，session的处理，是个比较重要的类。
	 */
	@Bean(name = "getSecurityManager")
	public DefaultWebSecurityManager getSecurityManager() {
		DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
		securityManager.setRealm(shiroRealm());
		return securityManager;

	}
	/**
	 * ShiroFilterFactoryBean，是个factorybean，为了生成ShiroFilter。
	 * 它主要保持了三项数据，securityManager，filters，filterChainDefinitionManager。
	 */
	@Bean(name = "shiroFilter")
	public ShiroFilterFactoryBean shiroFilterFactoryBean() {
		ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
		shiroFilterFactoryBean.setSecurityManager(getSecurityManager());

		Map<String, String> map = new LinkedHashMap<String, String>();//LinkedHashMap 过滤器有次序
		map.put("/userController/login", "anon");//配置匿名访问, 要和userController中的RequestMapping一致
		map.put("/layui/**", "anon");
		map.put("/logout", "logout");//配置注销
		map.put("/**", "anon");
		shiroFilterFactoryBean.setUnauthorizedUrl("/login.jsp");//认证失败跳转页面
		shiroFilterFactoryBean.setFilterChainDefinitionMap(map);
		return shiroFilterFactoryBean;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
