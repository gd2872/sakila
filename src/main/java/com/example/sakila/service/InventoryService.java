package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.sakila.mapper.InventoryMapper;

@Service
public class InventoryService {
	@Autowired InventoryMapper inventoryMapper;
	
	
	// 지점 리스트 페이징
	public int getTotalCount(Integer storeId, Integer rowPerPage) {
		int totalRow = inventoryMapper.selectCountInventory(storeId);
		int lastPage = totalRow / rowPerPage;
		if(totalRow % rowPerPage != 0) {
			lastPage++;
		}
		return lastPage;
	}
	
	// 지점 리스트 -> 인벤토리 리스트 : /on/inventoryList
	public List<Map<String, Object>> getInventoryListByStore(
						Integer storeId, Integer currentPage, Integer rowPerPage){
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("storeId", storeId);
		paramMap.put("rowPerPage", rowPerPage);
		
		int beginRow = (currentPage - 1) * rowPerPage;
		paramMap.put("beginRow", beginRow);
		
		
		return inventoryMapper.selectInventoryListByStore(paramMap);
	}
	
	// 특정 필름 카운트 : /on/removeFilm
	public Integer getCountInventoryByFilm(Integer filmId) {
		return inventoryMapper.selcetCountInventoryByFilm(filmId);
	}
	
}
