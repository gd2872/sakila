package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Actor;

@Mapper
public interface ActorMapper {
	
	// 필름 상세 -> searchName 검색 결과 : /on/filmOne
	List<Actor> selectActorListByActor(String searchName);
	
	// 배우 삭제
	int deleteActor(int ActorId);
	
	// 배우 이름 수정
	int updateActor(Actor actor);
	
	// on/filmOne
	// 작품에 출연한 배우 리스트
	List<Actor> selectAcotrListByFilm(int filmId);
	
	// 배우 상세 -> ActorMapper.xml
	Actor selectActorOne(int actorId);
	
	// 배우 리스트
	int selectActorCount(String searchWord);
	
	// 배우 리스트 : /on/actorList
	List<Actor> selectActorList(Map<String, Object> map);
	// -> 매개변수 한가지 타입만 받을 수 있어서 Map 사용
	
	// 배우 추가
	int insertActor(Actor actor);
}
