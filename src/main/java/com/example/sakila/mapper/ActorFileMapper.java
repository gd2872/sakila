package com.example.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.ActorFile;

@Mapper
public interface ActorFileMapper {
	
	// 배우 상세 -> ActorFileMapper.xml
	List<ActorFile> selectActorFileListByActor(int actorId);
	
	// 배우 추가 파일 입력 
	int insertActorFile(ActorFile actorFile);
}
