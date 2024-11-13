package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.InventoryService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class InventoryController {
	@Autowired InventoryService inventoryService;
	
	// 지점 리스트 -> 인벤토리 리스트 : /on/inventoryList
	@GetMapping("/on/inventoryList")
	public String inventoryList(Model model, @RequestParam Integer storeId
								, @RequestParam(defaultValue = "1") int currentPage
								, @RequestParam(defaultValue = "10") int rowPerPage) {
		
		List<Map<String, Object>> inventoryList = inventoryService.getInventoryListByStore(storeId, currentPage, rowPerPage);
		model.addAttribute("inventoryList", inventoryList);
		model.addAttribute("storeId", storeId);
		
		int lastPage = inventoryService.getTotalCount(storeId, rowPerPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		return "on/inventoryList";
	}
	
}
