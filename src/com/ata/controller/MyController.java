package com.ata.controller;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ata.bean.CredentialsBean;
import com.ata.bean.ProfileBean;
import com.ata.bean.RouteBean;
import com.ata.util.Authentication;
import com.ata.util.User;
import com.ata.util.UserImpl;

@Controller
public class MyController {
	
	
	@Autowired
	User udao;
	
	
	
	@RequestMapping(value="/")
	public String login(Model m){
		m.addAttribute("credentialsBean",new CredentialsBean());
		return "index";
	}
	
	@RequestMapping(value="/login")
	public String loginuser(CredentialsBean credentialsBean,HttpSession session,Model m){
		String s=udao.login(credentialsBean);
		if(s.equals("A")){
			session.setAttribute("user",udao.getuser(credentialsBean.getUserID()));
			return "Admin";
		}
		else if(s.equals("C")){
			session.setAttribute("user",udao.getuser(credentialsBean.getUserID()));
			return "Customer";
		}
		else if(s.equals("invalid")){
			m.addAttribute("msg","Invalid Userid or Password");
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
	public String addUserProfile(ProfileBean profileBean,Model m){
		
		/*if(result.hasErrors()){
			return "signup";
		}*/
		String res=udao.register(profileBean);
		m.addAttribute("res",res);
		return "signup";
	}
	
	@RequestMapping(value="showdriverpage")
	public String showdriverpage(){
		return "Show";
	}
	
	
	
}
