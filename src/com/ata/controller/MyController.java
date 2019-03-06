package com.ata.controller;


import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import java.io.IOException;
import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ata.bean.CredentialsBean;
import com.ata.bean.DriverBean;
import com.ata.bean.ProfileBean;
import com.ata.bean.ReservationBean;
import com.ata.bean.RouteBean;
import com.ata.util.Authentication;
import com.ata.util.User;
import com.ata.util.UserImpl;

@Controller
public class MyController {
	
	
	@Autowired
	User udao;
	
	@Autowired
	Authentication auth;
	
	
	
	@RequestMapping(value="/")
	public String login(Model m){
		//m.addAttribute("credentialsBean",new CredentialsBean());
		return "index";
	}
	
	@RequestMapping(value="/adminhome")
	public String adminhome() throws InterruptedException{
		return "Admin";
	}
	
	@RequestMapping(value="/customerhome")
	public String customerhome(){
		return "Customer";
	}
	
	@RequestMapping(value="/viewProfile")
	public String profile(){
		return "Profile";
	}
	
	@RequestMapping(value="/login")
	public String loginuser(CredentialsBean credentialsBean, HttpSession session,Model m){
		System.out.println("======Inside Login Controller======");
		String s=udao.login(credentialsBean);
		
		if(s.equals("A")){
			session.setAttribute("user",udao.getuser(credentialsBean.getUserID()));
			session.setAttribute("usertype", "Admin");
			session.setMaxInactiveInterval(1000);
			return "Admin";
		}
		else if(s.equals("C")){
			session.setAttribute("user",udao.getuser(credentialsBean.getUserID()));
			session.setAttribute("usertype", "Customer");
			session.setMaxInactiveInterval(1000);
			return "Customer";
		}
		else if(s.equals("invalid")){
			m.addAttribute("msg","Invalid Userid or Password");
			return "index";
		}
		else if(s.equals("already")){
			m.addAttribute("msg","User Already Logged-in!!!");
			return "index";
		}
		return null;
	}
	
	@RequestMapping(value="/adduser")
	public String addUser(Model m){
		m.addAttribute("profileBean", new ProfileBean());
		return "signup";
	}
	
	@RequestMapping(value="/adduserprofile",method=RequestMethod.GET)
	public String addUserProfile(ProfileBean profileBean,@RequestParam("dateofbirth")String dob,Model m){
		System.out.println("=========Inside Adding new profile=============");
		profileBean.setDateOfBirth(Date.valueOf(dob));	
		String res=udao.register(profileBean);
		m.addAttribute("res",res);
		return "signup";
	}
	
	@RequestMapping(value="/showdriverpage")
	public String showdriverpage(){
		return "Show";
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session,Model m,HttpServletResponse response) throws IOException{
		try{
			ProfileBean profileBean=(ProfileBean)session.getAttribute("user");
			udao.logout(profileBean.getUserID());
			session.setAttribute("user", null);
			m.addAttribute("logoutmsg","Logged Out Successfully!");
			return "index";
		}
		catch(Exception e){
			return "Error";
		}
		
	}
	
	
}
