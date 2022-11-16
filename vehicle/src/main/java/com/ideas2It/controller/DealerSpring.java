package com.ideas2It.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ideas2It.model.Dealer;
import com.ideas2It.service.DealerService;
import com.ideas2It.service.impl.DealerServiceImpl;
import com.ideas2It.util.customException.VehicleManagementException;

@Controller
public class DealerSpring {
	DealerService dealerService = new DealerServiceImpl();

	@RequestMapping(value = "/createDealer")
	public String createDealer(Model model) {
		model.addAttribute("dealer", new Dealer());
		return "insertDealer";
	}
	
	@RequestMapping(value = "/insertDealer", method = RequestMethod.POST)
    public String createDealer(@ModelAttribute("dealer") Dealer dealer, 
    		Model model) {
		    int id = dealer.getId();
			try {
	    		if (0 != id) {
	    			dealer.setCreatedAt(dealerService.getDealerById(id).getCreatedAt());
	    			if (dealerService.updateDealer(dealer)) {
	    				model.addAttribute("status", "updated successfully");
	    			}		
	    		} else {
				    model.addAttribute("status", dealerService.createDealer(dealer));	
	    		}
			} catch (VehicleManagementException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	return "insertDealer";
    }
	
	@RequestMapping(value = "/getDealers", method = RequestMethod.GET)
    public String getDealers(Model model) {
    	try {
			model.addAttribute("dealers", dealerService.getDealers());
		} catch (VehicleManagementException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return "dealers";
    }
	
	@RequestMapping(value = {"/getDealerById", "/getDealerForUpdate"}, method = RequestMethod.POST)
    public String getDealerById(HttpServletRequest request, @RequestParam int id, Model model) {
		String action = request.getServletPath();
    	try {
			model.addAttribute("dealer", dealerService.getDealerById(id));
		} catch (VehicleManagementException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	if (action.equals("/getDealerForUpdate")) {
    		return "insertDealer";
    	} else
    	    return "getDealer";
    }
	
	@RequestMapping(value = "/deleteDealerById", method = RequestMethod.POST)
    public String deleteDealerById(@RequestParam int id, Model model) {
    	try {
    		if (dealerService.deleteDealerById(id)) {
    			model.addAttribute("status", "deleted successfully");	
    		} else {
    			model.addAttribute("status", "please provide valid id");
    		}
		} catch (VehicleManagementException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return "deleteDealer";
    }
}
