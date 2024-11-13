package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InventoryMapper {
	
	// 인벤토리 페이지
	Integer selectCountInventory(Integer storeId);
	
	// 지점 리스트 -> 인벤토리 리스트 : /on/inventoryList
	List<Map<String, Object>> selectInventoryListByStore(Map<String, Object> paramMap);
	
	// 특정 필름 카운트 : /on/removeFilm
	Integer selcetCountInventoryByFilm(Integer filmId);
}
