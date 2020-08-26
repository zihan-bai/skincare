package com.zhb.app.bean;

import java.util.ArrayList;
import java.util.List;



import lombok.Data;

@Data
public class Users {
	private Integer uid;
	private String uname;
	private String password;

	
	// user : roles --> M:M
	//one user can have many roles, 需要用一个集合来装用户的角色
	private List<Roles> list = new ArrayList<Roles>();

}
