package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.FilmCategory;

@Mapper
public interface FilmCategoryMapper {
	
	// 필름상세 -> 카테고리 추가 : /on/addFilmCategory
	Integer insertFilmCategory(FilmCategory filmCategory);
	
	// 해당 필름의 카테고리 리스트 : /on/filmOne
	List<Map<String, Object>> selectFilmCategoryListByFilm(Integer filmId);

	// 필름 삭제 시 카테고리 삭제
	Integer deleteFilmCategoryByFilm(Integer filmId);

	// 11/12 과제 -> 카테고리 삭제 시 카태고리 삭제
	Integer deleteFilmCategoryByCategory(Integer categoryId);
}
