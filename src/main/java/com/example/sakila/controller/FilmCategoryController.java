package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.sakila.service.FilmCategoryService;
import com.example.sakila.vo.FilmCategory;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FilmCategoryController {
	@Autowired FilmCategoryService filmCategoryService;

	// 카테고리 추가 ->> [이슈] 이미 추가된 장르를 다시 추가하면 중복 에러
	@PostMapping("/on/addFilmCategory")
	public String addFilmCategory(FilmCategory filmCategory) {
		log.debug("filmCategory =====>" + filmCategory.toString());
		
		// FilmCategoryService.addFilmCategory 호출
		int row = filmCategoryService.addFilmCategory(filmCategory);
		
		return "redirect:/on/filmOne?filmId=" + filmCategory.getFilmId();
	}
	
}
