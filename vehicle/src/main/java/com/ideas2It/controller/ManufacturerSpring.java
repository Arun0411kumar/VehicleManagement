package com.ideas2It.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ideas2It.model.Manufacturer;
import com.ideas2It.service.ManufacturerService;
import com.ideas2It.service.impl.ManufacturerServiceImpl;
import com.ideas2It.util.customException.VehicleManagementException;

@Controller
public class ManufacturerSpring {
	ManufacturerService manufacturerService = new ManufacturerServiceImpl();
	
	@RequestMapping(value = "/createManufacturer")
	public String createManufacturer(Model model) {
		model.addAttribute("manufacturer", new Manufacturer());
		return "insertManufacturer";
	}
	
	@RequestMapping(value = "/updateManufacturer")
	public String updateManufacturer(Model model) {
		model.addAttribute("manufacturer", new Manufacturer());
		return "updateManufacturer";
	}
	
	@RequestMapping(value = "/insertManufacturer", method = RequestMethod.POST)
    public String createManufacturer(@ModelAttribute("manufacturer") Manufacturer manufacturer, 
    		Model model) {
    	try {
			model.addAttribute("manu", new ManufacturerServiceImpl().createManufacturer1(manufacturer));
		} catch (VehicleManagementException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return "insertManufacturer";
    }
	
	@RequestMapping(value = "/getManufacturers", method = RequestMethod.GET)
    public String getManufacturers(Model model) {
    	try {
			model.addAttribute("manufacturers", manufacturerService.getManufacturers());
		} catch (VehicleManagementException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return "manufacturers";
    }
	
	@RequestMapping(value = {"/getManufacturerById", "/getManufacturerForUpdate"}, method = RequestMethod.POST)
    public String getManufacturerById(HttpServletRequest request, @RequestParam int id, Model model) {
		String action = request.getServletPath();
    	try {
			model.addAttribute("manufacturer", manufacturerService.getManufacturerById(id));
		} catch (VehicleManagementException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	if (action.equals("/getManufacturerForUpdate")) {
    		return "updateManufacturer";
    	} else
    	    return "getManufacturer";
    }
	
	@RequestMapping(value = "/deleteManufacturerById", method = RequestMethod.POST)
    public String deleteManufacturerById(@RequestParam int id, Model model) {
    	try {
    		if (manufacturerService.deleteManufacturerById(id)) {
    			model.addAttribute("status", "deleted successfully");	
    		} else {
    			model.addAttribute("status", "please provide valid id");
    		}
    		
		} catch (VehicleManagementException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return "deleteManufacturer";
    }
	
	@RequestMapping(value = "/updateManufacturerById", method = RequestMethod.POST)
    public String updateManufacturerById(@ModelAttribute("manufacturer") Manufacturer manufacturer, 
    		Model model) {
		try {
			model.addAttribute("manufacturer1", manufacturerService.updateManufacturer(manufacturer));
		} catch (VehicleManagementException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "updateManufacturer";
    }	
}
