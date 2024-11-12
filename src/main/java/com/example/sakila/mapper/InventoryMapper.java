package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InventoryMapper {
	
	// 특정 필름의 카운트
	Integer selcetCountInventoryByFilm(Integer filmId);
}
