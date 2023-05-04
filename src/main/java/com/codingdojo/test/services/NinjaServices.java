package com.codingdojo.test.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.test.models.Ninja;
import com.codingdojo.test.repositories.NinjaRepository;

@Service
public class NinjaServices {
	
	@Autowired
	private NinjaRepository ninjaRepo;
	
	// Find All
	public List<Ninja> findAllNinja(){
		return ninjaRepo.findAll();
	}
	
	// Find One
	public Ninja findNinja(Long id) {
		Optional<Ninja> optionalNinja = ninjaRepo.findById(id);
		if(optionalNinja.isPresent()) {
			return optionalNinja.get();
		}else {
			return null;
		}
	}
	
	// Create or Update
	public Ninja createOrUpdate(Ninja ninja) {
		return ninjaRepo.save(ninja);
	}
	
	// Delete	
	public void deleteNinja(Long id) {
		ninjaRepo.deleteById(id);
	}

}
