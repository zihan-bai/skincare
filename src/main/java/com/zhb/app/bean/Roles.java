package com.zhb.app.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Roles implements Serializable {
	private Integer rid;
	private String rname;
	private String rdesc;


}
