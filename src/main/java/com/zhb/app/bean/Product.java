package com.zhb.app.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	private Integer pid;
	private String pname;
	private String pbrand;
	private String psize;
	private String pprice;
	private String pdiscount;
	private String plocation;
	private String producedate;
	private String purchasedate;
	private String expiration;
	private String pdesc;
	private Integer cateid;
	private String catename;
	private Integer useflag;

}
