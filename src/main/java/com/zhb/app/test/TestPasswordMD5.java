package com.zhb.app.test;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.junit.Test;

public class TestPasswordMD5 {
	
	//MD5 密码加密
	
	@Test
	public void testShiroMD5() {
		String salt ="admin"+"111";
		//"123" 是加密源 , 加密规则salt, 加密次数
		Md5Hash md5Hash = new Md5Hash("111", salt,10);
	
		System.out.println(md5Hash.toString());
		
	}

}
