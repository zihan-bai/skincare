package com.zhb.app.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Uses {
	private Integer useid;
	private Integer pid;
	private String pname;
	private String usedate;
	private String feedback;
	private Integer pprice;
	private Double pdiscount;

}
