package com.ideas2It.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Collection;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

import com.ideas2It.model.Dealer;
import com.ideas2It.model.Manufacturer;
import com.ideas2It.model.TwoWheeler;
import com.ideas2It.service.DealerService;
import com.ideas2It.service.ManufacturerService;
import com.ideas2It.service.VehicleService;
import com.ideas2It.service.impl.DealerServiceImpl;
import com.ideas2It.service.impl.ManufacturerServiceImpl;
import com.ideas2It.service.impl.VehicleServiceImpl;
import com.ideas2It.util.DateUtil;
import com.ideas2It.util.customException.VehicleManagementException;

@Controller
public class TwoWheelerSpring {
	private VehicleService vehicleService = new VehicleServiceImpl();
    private ManufacturerService manufacturerService = new ManufacturerServiceImpl();
    private DealerService dealerService = new DealerServiceImpl();

	@RequestMapping("/createTwoWheeler")
	public String createTwoWheeler(Model model) {
		try {
			getManufacturersAndDealers(model);
			model.addAttribute("twoWheeler", new TwoWheeler());
		} catch (VehicleManagementException e) {
			e.printStackTrace();
		}
		return "insertTwoWheeler";
	}
	
	@RequestMapping(value = "/insertTwoWheeler", method = RequestMethod.POST)
	public String createTwoWheeler(@RequestParam String date, @RequestParam int manufacturerId, 
			@RequestParam String dealerId, @ModelAttribute("twoWheeler") TwoWheeler twoWheeler, Model model) {
		try {			
			twoWheeler.setDateOfManufacture(DateUtil.convertDate(date));	
			twoWheeler.setManufacturer(manufacturerService.getManufacturerById(manufacturerId));
			if (null != dealerId && !(" ".equals(dealerId))) { 
				twoWheeler.setDealer(dealerService.getDealerById(Integer.parseInt(dealerId))); 
		    } 
			if (0 != twoWheeler.getId()) {
				twoWheeler.setCreatedAt(vehicleService.getTwoWheelerByCode(twoWheeler.getVehicleCode()).getCreatedAt());
				if (vehicleService.updateVehicle(twoWheeler)) {
					model.addAttribute("status", "updated successfully");
				}
			} else {
				getManufacturersAndDealers(model);
				model.addAttribute("status", vehicleService.createTwoWheeler(twoWheeler));
			}
			
		} catch (VehicleManagementException | ParseException e) {
			e.printStackTrace();
		}
		return "insertTwoWheeler";
	}
	
	@RequestMapping(value = {"/getTwoWheelerByCode", "/getTwoWheelerForUpdate"}, method = RequestMethod.POST)
    public String getManufacturerById(HttpServletRequest request, @RequestParam String vehicleCode, Model model) {
		String action = request.getServletPath();
		String response = "";
    	try {
			model.addAttribute("twoWheeler", vehicleService.getTwoWheelerByCode(vehicleCode));
	    	if (action.equals("/getTwoWheelerForUpdate")) {
	    		getManufacturersAndDealers(model, vehicleCode);
	    		response = "insertTwoWheeler";
	    	} else {
	    		response = "getTwoWheeler";	
	    	}
		} catch (VehicleManagementException e) {
			e.printStackTrace();
		}
    	return response;
    }

	@RequestMapping(value = "/getTwoWheelers", method = RequestMethod.GET)
    public String getManufacturers(Model model) {
    	try {
			model.addAttribute("twoWheelers", vehicleService.getTwoWheelers());
		} catch (VehicleManagementException e) {
			e.printStackTrace();
		}
    	return "twoWheelers";
    }
	
	@RequestMapping(value = "/deleteTwoWheelerByCode", method = RequestMethod.POST)
    public String deleteTwoWheelerByCode(@RequestParam String vehicleCode, Model model) {
    	try {
    		if (vehicleService.deleteTwoWheelerByCode(vehicleCode)) {
    			model.addAttribute("status", "deleted successfully");	
    		} else {
    			model.addAttribute("status", "please provide valid id");
    		}
		} catch (VehicleManagementException e) { 
			e.printStackTrace();
		}
    	return "deleteTwoWheeler";
    }
	
	@RequestMapping(value = "/searchTwoWheelers", method = RequestMethod.POST)
	private String searchTwoWheelers(@RequestParam String letter, Model model) {
	    try {
			model.addAttribute("twoWheelers", vehicleService.searchTwoWheeler(letter));
		} catch (VehicleManagementException e) {
			e.printStackTrace();
		}
	    return "searchTwoWheelers";
    }	
	
	@RequestMapping(value = "/range", method = RequestMethod.POST)
	private String retriveTwoWheelersInRange(@RequestParam String start, @RequestParam String end, Model model) {
			try {
				model.addAttribute("twoWheelers", vehicleService.retriveVehiclesInRange(start, end));
			} catch (VehicleManagementException e1) {
				e1.printStackTrace();
			}		
			try {
				new SimpleDateFormat("yyyy-MM-dd").parse(start);
				return "retriveBetweenDate";
			} catch (ParseException e) {
				return "retriveBetweenMileage";
			}
	}
	
	@RequestMapping(value = "/In", method = RequestMethod.GET)
	public String getTwoWheelerInCodes(WebRequest webRequest, Model model) {
		String[] codes = webRequest.getParameterValues("codes");
		try {
			model.addAttribute("twoWheelers", vehicleService.getTwoWheelerByCodes(codes));
		} catch (VehicleManagementException e) {
			e.printStackTrace();
		}
		return "retriveTwoWheelerInCodes";		
	}
	
	private void getManufacturersAndDealers(Model model, String vehicleCode) throws VehicleManagementException {
		getManufacturersAndDealers(model); 	
		TwoWheeler twoWheeler = vehicleService.getTwoWheelerByCode(vehicleCode);
		model.addAttribute("manufacturer", twoWheeler.getManufacturer());
		model.addAttribute("dealer", twoWheeler.getDealer());
	}
	
    public void getManufacturersAndDealers(Model model) throws VehicleManagementException {
		model.addAttribute("manufacturers", manufacturerService.getManufacturers());
		model.addAttribute("dealers", dealerService.getDealers());
    }
}
