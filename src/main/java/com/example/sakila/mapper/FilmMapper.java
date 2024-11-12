package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Film;

@Mapper // --> Class 구현 @Repository
public interface FilmMapper {
	
	// 필름 수정
	Integer updateFilm(Film film);
	
	// 필름 삭제
	Integer deleteFilmByKey(Integer filmId);
	
	// 카테고리 있을 시 필름리스트 -> categoryId가 null이나 0이 아닐때
	List<Map<String, Object>> selectFilmListByCategory(Map<String, Object> paramMap);
	
	// 카테고리 없을 시 필름리스트 -> categoryId가 null이거나 0 일때
	List<Map<String, Object>> selectFilmList(Map<String, Object> paramMap);
	
	// 필름 검색 시 /on/actorOne
	List<Film> selectFilmListByTitle(String searchTitle);
	
	// 필름 추가
	int insertFilm(Film film);
		
	// 필름 상세 -> FilmMapper.xml
	// film X language
	Map<String, Object> selectFilmOne(int filmId);
	
	// 필름 타이틀 리스트 -> FilmMapper.xml
	List<Film> selectFilmTitleListByActor(int actorId); 

}
