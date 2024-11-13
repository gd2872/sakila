package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.sakila.service.StoreService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StoreController {
	@Autowired StoreService storeService;
	
	// 스토어 리스트
	@GetMapping("/on/storeList")
	public String getStoreList() {
		List<Map<String, Object>> storeList = storeService.getStoreList();
		log.debug("storeList : " + storeList.toString());
		return "redirect:/on/storeList";
	}
}