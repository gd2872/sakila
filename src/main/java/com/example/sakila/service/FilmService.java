package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.FilmActorMapper;
import com.example.sakila.mapper.FilmCategoryMapper;
import com.example.sakila.mapper.FilmMapper;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.FilmForm;

@Service
@Transactional
public class FilmService {
	@Autowired FilmMapper filmMapper;
	@Autowired FilmActorMapper filmActorMapper;
	@Autowired FilmCategoryMapper filmCategoryMapper;
	
	// 필름 수정
	public int modifyFilm(Film film) {
		return filmMapper.updateFilm(film);
	}
	
	// 필름 삭제
	public void removeFilmByKey(Integer filmId) {
		// 1) 필름_카테고리 삭제
		filmCategoryMapper.deleteFilmCategoryByFilm(filmId);
		// 2 필름_배우 삭제
		filmActorMapper.deleteFilmActorByFilm(filmId);
		// 3) 필름 삭제
		filmMapper.deleteFilmByKey(filmId);
	}
	
	// 카테고리 리스트
	public List<Map<String, Object>> getFilmList(Integer categoryId, int currentPage, int rowPerPage){
		Map<String, Object> paramMap = new HashMap<>();
		if(categoryId == null || categoryId == 0) {
			paramMap.put("categoryId", null);
		} else {
			paramMap.put("categoryId", categoryId);
		}
		int beginRow = (1 - currentPage) * rowPerPage;
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		if(paramMap.get("categoryId") == null) {
			return filmMapper.selectFilmList(paramMap);
		} else {
			return filmMapper.selectFilmListByCategory(paramMap);
		}
	}
	
	//
	public List<Film> getFilmListByTitle(String searchTitle){
		return filmMapper.selectFilmListByTitle(searchTitle);
	}
	
	//
	public int addFilm(FilmForm filmForm) {
		Film film = new Film();
		// filmForm --> Film
		film.setTitle(filmForm.getTitle());
		// 삼항연산자 사용 (? 참이면 앞 : 거짓이면 뒤) 
		// film.setDescription(filmForm.getDescription().equals("") ? null : filmForm.getDescription());
		// if문 사용 
		if(filmForm.getDescription().equals("")) {
			film.setDescription(null);
		} else {
			film.setDescription(filmForm.getDescription());
		}
		
		film.setReleaseYear(filmForm.getReleaseYear());
		film.setLanguageId(filmForm.getLanguageId());
		film.setOriginalLanguageId(filmForm.getOriginalLanguageId());
		film.setRentalDuration(filmForm.getRentalDuration());
		film.setRentalRate(filmForm.getRentalRate());
		film.setLength(filmForm.getLength());
		film.setReplacementCost(filmForm.getReplacementCost());
		film.setRating(filmForm.getRating());
		
		if(filmForm.getSpecialFeatures() == null) {
			film.setSpecialFeatures(null);
		} else {
			// specialFeatures 배열 -> , 문자열
			String specialFeatures = filmForm.getSpecialFeatures().get(0);
			
			for(int i = 1; i < filmForm.getSpecialFeatures().size(); i++) {
				specialFeatures += "," + filmForm.getSpecialFeatures().get(i);
			}
			film.setSpecialFeatures(specialFeatures);
		}

		return filmMapper.insertFilm(film);
	}
	
	//
	public Map<String, Object> getFilmOne(int filmId) {
		return filmMapper.selectFilmOne(filmId);
	}
	
	// on/actorOne 
		public List<Film> getFilmTitleListByActor(int ActorId) {
			return filmMapper.selectFilmTitleListByActor(ActorId);
		}
}
