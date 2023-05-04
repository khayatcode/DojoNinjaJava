package com.codingdojo.test.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.test.models.Dojo;
import com.codingdojo.test.repositories.DojoRepository;

@Service
public class DojoServices {
	
	@Autowired
	private DojoRepository dojoRepo;
	
	//	Find All
	public List<Dojo> allDojos(){
		return dojoRepo.findAll();
	}
	// View One
	public Dojo viewDojo(Long id) {
		Optional<Dojo> optionalDojo = dojoRepo.findById(id);
		if(optionalDojo.isPresent()) {
			return optionalDojo.get();
		} else {
			return null;
		}
	}
	
	// Create or Update
	public Dojo createOrUpdate(Dojo dojo) {
		return dojoRepo.save(dojo);
	}
	
	// Delete 
	public void deleteDojo(Long id) {
		dojoRepo.deleteById(id);
	}

}
