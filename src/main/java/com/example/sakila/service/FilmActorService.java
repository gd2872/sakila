package com.example.sakila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.FilmActorMapper;
import com.example.sakila.vo.FilmActor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class FilmActorService {
	@Autowired FilmActorMapper filmActorMapper;
	
	// 배우 상세 -> 출연작품 삭제
	public int removeFilmActor(FilmActor filmActor) {
		return filmActorMapper.deleteFilmActor(filmActor);
	}
	
	// 배우 상세 -> 출연작품 입력
	public int addFilmActor(FilmActor filmActor) {
		return filmActorMapper.insertFilmActor(filmActor);
	}
}
