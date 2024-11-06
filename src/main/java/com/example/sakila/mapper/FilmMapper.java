package com.example.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Film;

@Mapper // --> Class 구현 @Repository
public interface FilmMapper {
	
	// 필름 타이틀 리스트 -> FilmMapper.xml
	List<Film> selectFilmTitleListByActor(int actorId); 

}
