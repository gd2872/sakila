package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FilmCategoryMapper {

	// 필름 삭제 시 카테고리 삭제
	Integer deleteFilmCategoryByFilm(int filmId);

	// 11/12 과제 -> 카테고리 삭제 시 카태고리 삭제
	Integer deleteFilmCategoryByCategory(int categoryId);
}
