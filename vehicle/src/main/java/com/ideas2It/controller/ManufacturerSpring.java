package com.ideas2It.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ideas2It.model.Manufacturer;
import com.ideas2It.service.impl.ManufacturerServiceImpl;
import com.ideas2It.util.customException.VehicleManagementException;

@Controller
public class ManufacturerSpring {
    @PostMapping("/insertManufacturer")
    public String insertManufacturer(@ModelAttribute("manufacturer") Manufacturer manufacturer, Model model) {
    	try {
			Manufacturer manufacturer1 = new ManufacturerServiceImpl().createManufacturer1(manufacturer);
			model.addAttribute("manu", manufacturer1);
		} catch (VehicleManagementException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return "insertManufacturer";
    }
}
