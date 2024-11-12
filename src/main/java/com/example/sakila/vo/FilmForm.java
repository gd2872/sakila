package com.example.sakila.vo;

import java.util.List;

import lombok.Data;

@Data
// @Builder
public class FilmForm {
	private String title; 
	private String description; // NULL
	private Integer releaseYear;  // NULL
	private Integer languageId; 
	private Integer originalLanguageId; // NULL
	private Integer rentalDuration; 
	private Double rentalRate;
	private Integer length;  // NULL 
	private double replacementCost;
	private String rating;
	
	private List<String> specialFeatures; // NULL
	// private String[] specialFeatures;

	/* 빌드 패턴
	public Film changeFilm() {
		Film f = new Film();
		f.setTitle(this.title);
		return f;
	}
	*/
}
