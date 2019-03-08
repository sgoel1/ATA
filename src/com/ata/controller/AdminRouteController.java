package com.ata.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ata.bean.RouteBean;
import com.ata.service.Administrator;
import com.ata.service.Customer;

@Controller
@RequestMapping(value="/Admin")
public class AdminRouteController {
	
	@Autowired  
	Administrator administratorImp;
	
	@Autowired
	Customer customerImp;
	//=================ROUTE ADD=====================
		@RequestMapping(value="/routeMain",method=RequestMethod.GET)
		public String routenav()
		{
			return "RouteMain";
		}
		
		@RequestMapping(value="/route")
		public String route(Model m){
			m.addAttribute("routeBean",new RouteBean());
			return "AddRoute";
		}
		@RequestMapping(value="/addroute")
		public String addRoute(RouteBean routeBean,Model m){
			String res=administratorImp.addRoute(routeBean);
			String routeMessage="<div class='alert alert-success alert-dismissible fade in' style='width: 500px; margin-left: 30%'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong>"+res+"</div>";
			m.addAttribute("res",routeMessage);
			return "AddRoute";
		}
		
		//=================UPDATING ROUTE==========
			@RequestMapping(value="/modifyRoute",method=RequestMethod.GET)
			public String modifyRoute(@RequestParam("routeID") String routeID,Model m)
			{	
				System.out.println(routeID);
				RouteBean routeBean=administratorImp.viewRoute(routeID);
				m.addAttribute("route",routeBean);
				return "EditRoute";
			}
			@RequestMapping(value="/modifiedRoute",method=RequestMethod.GET)
			public String modifiedRoute(RouteBean routeBean,Model m)
			{	
				String msg = "";
				boolean status=false;
				boolean res = administratorImp.modifyRoute(routeBean);
				if(res)
				{
					msg = "successfully modified Route with id :"+routeBean.getRouteID();
					status = true;
				}
				else
				{
					msg="failed :( to modify !! ";
					
				}
				
				m.addAttribute("status",status);
				m.addAttribute("res",msg);
				return showAllRoute(routeBean, m);
			}
			//=============DELETING ROUTE============
			@RequestMapping(value="/deleteRoute",method=RequestMethod.GET)
			public String deleteRoute(@RequestParam("routeID") String routeID,Model m)
			{	
				String msg = "";
				boolean status=false;
				try{
				int res=administratorImp.deleteRoute(routeID);
				if(res==1){
					msg = "successfully deleted Route with id :"+routeID;
					status = true;
				}
				else{
					msg="failed :( to delete !! ";
				}
				m.addAttribute("status",status);
				m.addAttribute("res",msg);
				return showAllRoute(m);
			}
			catch(Exception e){
				m.addAttribute("status",status);
				m.addAttribute("res","Could not delete route "+routeID);
				return showAllRoute(routeBean, m);
			}
				}
			//=============SHOW ALL ROUTES==========
			@RequestMapping(value="/showRoute",method=RequestMethod.GET)
			public String showAllRoute(RouteBean routeBean,Model m)
			{
				List<RouteBean> li=administratorImp.getAllRoute();
				m.addAttribute("rb", li);
				return "RouteShow";
			}

}
