package com.example.sakila.vo;

import lombok.Data;

@Data
public class Film {
	private int filmId; // PK
	private String title; // 초록키
	private String description; // 기본값 NULL
	private Integer releaseYear; // 기본값 NULL, 숫자여도 null을 받고싶다면 Integer 사용
	private int languageId; // FK
	private Integer originalLanguageId; // FK, NULL
	private int rentalDuration;
	private double rentalRate;
	private Integer length; // 기본값 NULL
	private double replacementCost;
	private String rating;
	private String specialFeatures; // 기본값 NULL
	private String lastUpdate;
}

// null값 유효성 검사안해도 된다