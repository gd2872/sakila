package com.example.sakila.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.ActorService;
import com.example.sakila.service.CategoryService;
import com.example.sakila.service.FilmService;
import com.example.sakila.service.InventoryService;
import com.example.sakila.service.LanguageService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.Category;
import com.example.sakila.vo.FilmForm;
import com.example.sakila.vo.Language;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FilmController {
	@Autowired FilmService filmService;
	@Autowired ActorService actorService;
	@Autowired LanguageService languageService;
	@Autowired CategoryService categoryService;
	@Autowired InventoryService inventoryService;
	
	
	// 필름 삭제
	@GetMapping("/on/removeFilm")
	public String removeFilm(Model model
							, @RequestParam Integer filmId) {
		Integer count = inventoryService.getCountInventoryByFilm(filmId);
		if(count != 0) {
		/*
			Map<String, Object> film = filmService.getFilmOne(filmId);
			log.debug(film.toString());
			
			List<Actor> actorList = actorService.getActorListByFilm(filmId);
			
			model.addAttribute("film", film);
			model.addAttribute("actorList", actorList);
			model.addAttribute("msg", "film이 inventory에 존재합니다");
			return "on/filmOne"; // 메세지 추가하기 위해 코드 getM("/on/filmOne") 복붙
		*/
			return "redirect:/on/filmOne"; // 메세지 추가는 힘들다
		}
		
		return "redirect:/on/filmList";
	}
	
	// 필름 리스트 11/11
	@GetMapping("/on/filmList")
	public String filmList(Model model
							, @RequestParam(required = false) Integer categoryId
							, @RequestParam(defaultValue = "1") int currentPage
							, @RequestParam(defaultValue = "10") int rowPerPage) {
		log.debug("categoryId: " + categoryId);
		log.debug("currentPage: " + currentPage);
		log.debug("rowPerPage: " + rowPerPage);
		
		List<Map<String, Object>> filmList = filmService.getFilmList(categoryId, currentPage, rowPerPage);
		log.debug("filmList: " + filmList);
		model.addAttribute("filmList", filmList);
		
		// Model에 catetory List 추가
		List<Category> categoryList = categoryService.getCategoryList();
		log.debug("categoryList: " + categoryList);
		model.addAttribute("categoryList", categoryList);
		
		// 같이 넘겨야 모델값 현재페이지, 현재카테고리 ID
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("currentCategoryId", categoryId);
		
		return "on/filmList";
	}
	
	// 필름 추가
	@PostMapping("/on/addFilm")
	public String addFilm(FilmForm filmForm) {
		log.debug(filmForm.toString());
		// filmService : FilmForm -> Film
		
		filmService.addFilm(filmForm);
		return "redirect:/on/filmList";
	}
	
	// 필름 추가
	@GetMapping("/on/addFilm")
	public String addFilm(Model model) {
		// 언어 리스트(자막, 언어)
		List<Language> languageList = languageService.getLanguageList();
		log.debug(languageList.toString());
		
		model.addAttribute("languageList", languageList);
		return "on/addFilm";
	}
	
	// -> filmOne.jsp
	@GetMapping("/on/filmOne")
	public String filmOne(Model model
						, @RequestParam int filmId) {
		Map<String, Object> film = filmService.getFilmOne(filmId);
		log.debug(film.toString());
		
		List<Actor> actorList = actorService.getActorListByFilm(filmId);
		
		model.addAttribute("film", film);
		model.addAttribute("actorList", actorList);
		
		return "on/filmOne";
	}
}
