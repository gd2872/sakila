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
	
	// 배우 상세 -> 출연작품 삭제
	@GetMapping("/on/removeFilmActor")
	public String removeFilmActor(FilmActor filmActor) {
		
		log.debug("filmId : " + filmActor.getFilmId());
		log.debug("actorId : " + filmActor.getActorId());
		
		int row = filmActorService.removeFilmActor(filmActor);

		return "redirect:/on/actorOne?actorId=" + filmActor.getActorId();
	}
	
	// 배우 상세 -> 출연작품 입력
	@PostMapping("/on/addFilmByActor")
	public String addFilmByActor(FilmActor filmActor) {
		
		log.debug("filmId : " + filmActor.getFilmId());
		log.debug("actorId : " + filmActor.getActorId());
		
		int row = filmActorService.addFilmActor(filmActor);
	
		return "redirect:/on/actorOne?actorId=" + filmActor.getActorId();
	}
	
	
	
}
