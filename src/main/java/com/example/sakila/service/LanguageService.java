package com.example.sakila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.LanguageMapper;
import com.example.sakila.vo.Language;

@Service
@Transactional
public class LanguageService {
	@Autowired LanguageMapper languageMapper;
	
	// 영화추가 언어리스트
	public List<Language> getLanguageList() {
		return languageMapper.selectLanguageList();
	}

}
