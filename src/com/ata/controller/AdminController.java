package com.ata.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ata.bean.ReservationBean;
import com.ata.bean.RouteBean;
import com.ata.bean.VehicleBean;
import com.ata.service.Administrator;


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