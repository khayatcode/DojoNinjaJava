package com.codingdojo.test.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.test.models.Ninja;
import com.codingdojo.test.services.DojoServices;
import com.codingdojo.test.services.NinjaServices;

import jakarta.validation.Valid;

@Controller
public class NinjaController {
	@Autowired
	private NinjaServices ninjaService;
	
	@Autowired
	private DojoServices dojoService;
	
	@GetMapping("/ninja/new")
	public String rCreateNinja(@ModelAttribute("ninja") Ninja ninja, Model model) {
		model.addAttribute("dojos", dojoService.allDojos());
		return "createNinja.jsp";
	}
	
	@PostMapping("/createNinja")
	public String sCreateNinja(
			Model model,
			@Valid @ModelAttribute("ninja") Ninja ninja, 
			BindingResult result) {
		if(result.hasErrors()) {
			model.addAttribute("dojos", dojoService.allDojos());
			return "createNinja.jsp";
		} else {
			ninjaService.createOrUpdate(ninja);
			return "redirect:/allDojos";
		}
	}
}
