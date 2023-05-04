package com.codingdojo.test.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.test.models.Dojo;
import com.codingdojo.test.services.DojoServices;

import jakarta.validation.Valid;

@Controller
public class DojoController {
	
	@Autowired
	private DojoServices dojoService;
	
	
	@GetMapping("/")
	public String index() {
		return "redirect:/allDojos";
	}
	
	@GetMapping("/allDojos")
	public String showDojos(Model model) {
		model.addAttribute("dojos", dojoService.allDojos());
		return "dojos.jsp";
	}
	
	@GetMapping("/viewDojo/{id}")
	public String viewDojo(@PathVariable("id") Long id, Model model) {
		model.addAttribute("dojo", dojoService.viewDojo(id));
		return "ninjasInDojo.jsp";
	}
	
	@GetMapping("/dojo/new")
	public String rCreateDojo(@ModelAttribute("dojo") Dojo dojo) {
		return "createDojo.jsp";
	}
	
	@PostMapping("/createDojo")
	public String sCreateDojo(@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result) {
		if(result.hasErrors()) {
			return "createDojo.jsp";
		} else {
			dojoService.createOrUpdate(dojo);
			return "redirect:/allDojos";
		}
	}
	
}
