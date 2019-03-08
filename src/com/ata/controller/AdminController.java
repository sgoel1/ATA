package com.ata.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping(value="/Admin")
public class AdminController {
	
	@RequestMapping(value="/adminhome")
	public String adminhome() throws InterruptedException{
		return "Admin";
	}
	
	@RequestMapping(value="/viewProfile")
	public String profile(){
		return "AdminProfile";
	}
}