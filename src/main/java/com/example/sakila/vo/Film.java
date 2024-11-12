package com.example.sakila.vo;

import lombok.Data;

// VO에서 기본타입 보다는 랩핑타입 고려

@Data
public class Film {
	private int filmId; // PK
	private String title; // 초록키
	private String description; // 기본값 NULL
	private Integer releaseYear; // 기본값 NULL, 숫자여도 null을 받고싶다면 Integer 사용
	private Integer languageId; // FK
	private Integer originalLanguageId; // FK, NULL
	private Integer rentalDuration;
	private Double rentalRate;
	private Integer length; // 기본값 NULL
	private Double replacementCost;
	private String rating;
	private String specialFeatures; // 기본값 NULL
	private String lastUpdate;
}

// null값 유효성 검사안해도 된다