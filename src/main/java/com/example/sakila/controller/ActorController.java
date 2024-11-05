package com.example.sakila.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ActorController {
	
	// 배우 추가 폼
	@GetMapping("/on/addActor")
	public String addActor() {
		
		return "on/addActor";
	}
	

}
