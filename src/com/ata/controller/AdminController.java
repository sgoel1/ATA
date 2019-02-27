package com.ata.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ata.bean.VehicleBean;
import com.ata.service.Administrator;


@Controller
public class AdminController {
	
	@Autowired
	Administrator administratorDao;
	
	@RequestMapping("/vehicle")
	public String vehicle(){
		return "VehicleMain";
	}
	
	@RequestMapping("/display")
	public String addVehicle(Model m)
	{
		m.addAttribute("vehicleBean", new VehicleBean());
		return "AddVehicle";
	}
	
	@RequestMapping("/displayEdit")
	public String displayVehicle(Model m, @RequestParam("vehicleID")String vehicleID, @RequestParam("type")String type,@RequestParam("name")String name,@RequestParam("registrationNumber")String registrationNumber,@RequestParam("seatingCapacity")String seatingCapacity,@RequestParam("farePerKM")String farePerKM)
	{
		m.addAttribute("vehicleEditBean", new VehicleBean(vehicleID,name,type,registrationNumber,Integer.parseInt(seatingCapacity),Double.parseDouble(farePerKM)));
		System.out.println(vehicleID+" "+name+" "+type+" "+registrationNumber);
		return "UpdateVehicle";
	}
	
	@RequestMapping("/addvdb")
	public String addTodb(VehicleBean vehicleBean,Model m)
	{
		String res=administratorDao.addVehicle(vehicleBean);
		m.addAttribute("vehicle",res);
		return "AddVehicle";
	}
	
	@RequestMapping("/updatevdb")
	public String updateTodb(VehicleBean vehicleEditBean,Model m)
	{
		System.out.println(vehicleEditBean.getVehicleID()+"jf "+vehicleEditBean.getName());
		boolean res=administratorDao.modifyVehicle(vehicleEditBean);
		return "redirect:showall";
	}
	
	@RequestMapping("/delvdb")
	public String deleteFromdb(@RequestParam("vehicleID")String vehicleID)
	{
		administratorDao.deleteVehicle(vehicleID);
		return "redirect:showall";
	}
	
	@RequestMapping("/showall")
	public String showAllVehicles(Model m)
	{
		List<VehicleBean> list=administratorDao.showAllVehicles();
		m.addAttribute("vehicleList", list);
		//System.out.println(list.get(1).getName());
		return "Navigation";
	}
}
