package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.FilmActor;

@Mapper
public interface FilmActorMapper {

	// 배우상세 -> 배우 삭제 시 출연작품 연결 삭제
	int deleteFileByActor(int actorId);
	
	// 배우상세 -> 출연작품 삭제
	int deleteFilmActor(FilmActor filmActor);
	
	// 배우상세 -> 출연작품 입력
	int insertFilmActor(FilmActor filmActor);
}
