package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.ActorFile;

@Mapper
public interface ActorFileMapper {
	
	//  
	
	// 배우 추가 파일 입력 
	int insertActorFile(ActorFile actorFile);
}
