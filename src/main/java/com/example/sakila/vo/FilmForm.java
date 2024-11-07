package com.example.sakila.vo;

import java.util.List;

import lombok.Data;

@Data
// @Builder
public class FilmForm {
	private String title; 
	private String description;
	private String releaseYear;
	private int languageId; 
	private int originalLanguageId; 
	private int rentalDuration;
	private Double rentalRate;
	private int length;
	private Double replacementCost;
	private String rating;
	
	private List<String> specialFeatures;
	// private String[] specialFeatures;

	/* 빌드 패턴
	public Film changeFilm() {
		Film f = new Film();
		f.setTitle(this.title);
		return f;
	}
	*/
}
