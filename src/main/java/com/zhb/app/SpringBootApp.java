package com.zhb.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
public class SpringBootApp {
public static void main(String[] args) {
	SpringApplication.run(SpringBootApp.class, args);
 }
}
