package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Film;

@Mapper // --> Class 구현 @Repository
public interface FilmMapper {
	
	// 영화 추가
	int insertFilm(Film film);
		
	// 작품 상세 -> FilmMapper.xml
	// film X language
	Map<String, Object> selectFilmOne(int filmId);
	
	// 필름 타이틀 리스트 -> FilmMapper.xml
	List<Film> selectFilmTitleListByActor(int actorId); 

}
