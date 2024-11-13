package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.sakila.service.FilmActorService;
import com.example.sakila.vo.FilmActor;


@Slf4j
@Controller
public class FilmActorController {
	@Autowired FilmActorService filmActorService;
	
	// 필름 상세 -> 출연배우 삭제 : /on/filmOne
	@GetMapping("/on/removeFilmActorByFilm")
	public String removeFilmActorByFilm(FilmActor filmActor) {
		
		log.debug("filmId : " + filmActor.getFilmId());
		log.debug("actorId : " + filmActor.getActorId());
		
		int row = filmActorService.removeFilmActor(filmActor);
		
		return "redirect:/on/filmOne?filmId=" + filmActor.getFilmId();
	}
	
	// 필름 상세 -> 출연배우 입력 : /on/filmOne
	@PostMapping("/on/addFilmActorByFilm")
	public String addFilmActorByFilm(FilmActor filmActor) {
		log.debug("filmId : " + filmActor.getFilmId());
		log.debug("actorId : " + filmActor.getActorId());
		
		int row = filmActorService.addFilmActor(filmActor);
		
		return "redirect:/on/filmOne?filmId=" + filmActor.getFilmId();
	}
	
	// 배우 상세 -> 출연작품 삭제 : /on/actorOne
	@GetMapping("/on/removeFilmActorByActor")
	public String removeFilmActorByActor(FilmActor filmActor) {
		
		log.debug("filmId : " + filmActor.getFilmId());
		log.debug("actorId : " + filmActor.getActorId());
		
		int row = filmActorService.removeFilmActor(filmActor);

		return "redirect:/on/actorOne?actorId=" + filmActor.getActorId();
	}
	
	// 배우 상세 -> 출연작품 입력 : /on/actorOne
	@PostMapping("/on/addFilmActorByActor")
	public String addFilmActorByActor(FilmActor filmActor) {
		log.debug("filmId : " + filmActor.getFilmId());
		log.debug("actorId : " + filmActor.getActorId());
		
		int row = filmActorService.addFilmActor(filmActor);
	
		return "redirect:/on/actorOne?actorId=" + filmActor.getActorId();
	}
	
	
}

