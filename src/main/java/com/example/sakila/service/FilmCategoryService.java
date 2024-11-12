package com.example.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.FilmCategoryMapper;

@Service
@Transactional
public class FilmCategoryService {
	@Autowired FilmCategoryMapper filmCategoryMapper;
	
	// 해당 필름의 카테고리 리스트
	public List<Map<String, Object>> getFilmCategoryListByFilm(Integer filmId){
		return filmCategoryMapper.selectFilmCategoryListByFilm(filmId);
	}
}
