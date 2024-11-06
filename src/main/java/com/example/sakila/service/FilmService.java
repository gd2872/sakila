package com.example.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.FilmMapper;
import com.example.sakila.vo.Film;

@Service
@Transactional
public class FilmService {
	@Autowired FilmMapper fileMapper;
	
	//
	public Map<String, Object> getFilmOne(int filmId) {
		return fileMapper.selectFilmOne(filmId);
	}
	
	// on/actorOne 
		public List<Film> getFilmTitleListByActor(int ActorId) {
			return fileMapper.selectFilmTitleListByActor(ActorId);
		}
}
